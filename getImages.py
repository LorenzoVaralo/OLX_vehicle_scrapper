from db_config import *
import aiofiles
import aiohttp
import asyncio
import cx_Oracle
import os
import time
import json


def path(*files):
    return os.path.join(os.path.dirname(__file__), *files)

def categories_to_path(cat_list):
    return path(
            'images', 
            str(cat_list[0]).upper(),                          #brand 
            str(cat_list[1]).upper(),                          #model
            str(cat_list[2]).upper().replace('/', '&SLASH'),   #version
            #str(cat_list[3]).upper(),                         #vehicle_model
            str(cat_list[4]),                                  #regdate
            str(cat_list[5]),                                  #listid
        )
    

async def download_image(session, url, path):
    async with session.get(url) as response:
        if response.status == 200:
            try:
                async with aiofiles.open(path, 'wb') as f:
                    await f.write(await response.read())
                #print(f'Image {path.split("/")[-1]} downloaded.')
            except Exception as e:
                print('path: ',path)
                print('url: ',url)
                print(e)
        else:
            global listIdsFailed
            listIdsFailed.append(path.split('/')[-2])
            print(f'Error downloading image {path}.')


async def download_images(path_link: list): #list of (path, link)
    async with aiohttp.ClientSession() as session:
        tasks = [
            download_image(
                session, 
                link, 
                os.path.join(path, link.split('/')[-1])
                ) 
                for path, link in path_link
            ]

        await asyncio.gather(*tasks)


# -- Connect to Oracle --
dns_tns = cx_Oracle.makedsn(db_config["HOST"], db_config["PORT"], service_name=db_config["SERVICE_NAME"])

conn = cx_Oracle.connect(user=db_config["USER"], password=db_config["PASSWORD"], dsn = dns_tns)
curs = conn.cursor()
# --


batches = 0
batch_size = 100

print('Getting image links')
while True:
    curs.execute(f'SELECT BRAND, MODELO, VERSAO, VEHICLE_MODEL, REGDATE, LISTID, IMAGES_ORIGINAL FROM OLXLAKE.VW_IMAGE_LINKS fetch next {batch_size} rows only')

    data = curs.fetchall() #list of tuples
    
    if data == []:
        break
    
    path_link = []
    listIds = []
    listIdsFailed = []

    for row in data:
        listIds.append(row[5])
        links = json.loads(row[-1])
        for link in links:
            path_link.append((categories_to_path(row), link))
        #path_link[categories_to_path(row)] = links
            

    print(f'{len(path_link)} images to download')

    pastas = set(list(zip(*path_link))[0])

    for imgs_path in pastas:
        if not os.path.exists(imgs_path):
            os.makedirs(imgs_path)
    
    print('Started download')     
    asyncio.run(download_images(path_link))
    print('Finished download')

    for removed in listIdsFailed:
        listIds.remove(removed)

    curs.execute(f'UPDATE OLXLAKE.FATO_ANUNCIOS_LISTA SET IMAGES_DOWNLOADED = 1 WHERE LISTID IN {str(tuple(listIds))}')
    if listIdsFailed.__len__() > 0:
        curs.execute(f'UPDATE OLXLAKE.FATO_ANUNCIOS_LISTA SET IMAGES_DOWNLOADED = 2 WHERE LISTID IN {str(tuple(listIdsFailed))}')
    conn.commit()
    
    batches += 1
    
    print(f'Batch {batches} complete! +{batch_size}')
    time.sleep(5)

conn.close()
