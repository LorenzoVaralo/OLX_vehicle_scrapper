from db_config import *
from concurrent.futures import as_completed
from requests_futures.sessions import FuturesSession
import json
import datetime
import regex
import cx_Oracle
import datetime

headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'
    }
regex_compiled = regex.compile('<script id=\"initial-data\" type=\"text\/plain\" data-json=\".*?><\/script>')


# -- Connect to Oracle --
dns_tns = cx_Oracle.makedsn(db_config["HOST"], db_config["PORT"], service_name=db_config["SERVICE_NAME"])

conn = cx_Oracle.connect(user=db_config["USER"], password=db_config["PASSWORD"], dsn = dns_tns)
curs = conn.cursor()
# --


##### Change these variables #####

# size of the payload in pages:
payload_size = 7 
# Date in unix timestamp, the max date of the ads to be scraped:

today = datetime.datetime.today()

dt = datetime.datetime(today.year, today.month, today.day, 0, 0, 0) #Last Midnight

#dt = datetime.datetime(2023, 1, 1, 0, 0, 0)


limit_adDate = 1681077016 - 10800 #int(time.mktime(dt.timetuple())) - 10800 # -3 hours


##### Main Loop #####
#
# for uf in ['AC','AL','AP','AM','BA','CE','DF','ES', 'GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO']:
for uf in ['RS']:
    with FuturesSession() as session:
        pg = 1
        _break_flag = False
        while True:
            futures = [session.get(f'https://{uf.lower()}.olx.com.br/autos-e-pecas/carros-vans-e-utilitarios?o={x}&sf=1', headers=headers) for x in range(pg, min([pg + payload_size, 100]))]
            
            payload_jsons = [] #list of dicts, each dict is an ad
            payload = []       #list of strings, each string is a multiple dicts with limit of 32000 chars
            
            # Transform each page and append to payload_jsons (list of dicts), each dict is an ad
            # payload_jsons have data of a number of (payload_size) pages
            for future in as_completed(futures):
                html = future.result().text
                if html == None:
                    print('html is None')
                    continue
                #url = f'https://rs.olx.com.br/autos-e-pecas/carros-vans-e-utilitarios?o={pg}&sf=1'

                #html = requests.get(url, headers=headers).text

                page_json = regex.search(regex_compiled, html).group(0)[55:-11]
                page_json = page_json.replace('&quot;', '\"')
                page_json = page_json.replace('&amp;', '&')
                
                
                page_json = json.loads(page_json)['listingProps']['adList']

                remove_list = []
                for i in page_json:
                    if 'isPubListingItem' in i.keys():
                        remove_list.append(i)
                for i in remove_list:
                    page_json.remove(i)


                if page_json[0]['date'] < limit_adDate: 
                    # se o primeiro anúncio for mais antigo que o limite, 
                    # então todos os anuncios da página passam do limite, limpa o payload e para
                    page_json = []
                    _break_flag = True
                        
                elif page_json[-1]['date'] < limit_adDate: 
                    # se o último anúncio for mais antigo que o limite e o primeiro não, 
                    # então só alguns da página passam do limite, remove os mais antigos
                    for j in page_json:
                        if j['date'] < limit_adDate:
                            page_json.remove(j)
                
                pg += 1
                payload_jsons.extend(page_json)
                
                if pg == 100:
                    _break_flag = True
                
            ##### Create Payload #####
            
            # Payload is a list of string below 32kb, normaly 4-5 ads per row, that way is minimizing the number
            # of posts to the database, 32kb is the limit of a CLOB datatype in Oracle
            
            batch_min_size = 4 #os primeiros 4 registros não são considerados, pois 4 anuncios não passam de 32kb, melhora a performance
            char_limit = 32000 #limite de caracteres por payload
            first = 0
            for i in range(len(payload_jsons)):
                if (i - first) < batch_min_size:
                    #print('pass')
                    continue
                else:
                    #print(f'Is json length of a[{first}:{i+1}] > 75?')
                    if len(json.dumps(payload_jsons[first:i+1])) > char_limit:
                        #print(i-first)
                        payload.append( (json.dumps(payload_jsons[first:i]),) )
                        first = i
            payload.append( (json.dumps(payload_jsons[first:]),) )
            for i in payload:
                if len(i) > char_limit:
                    print(payload)
                    raise Exception('Payload too big')
            
            
            ##### Insert Payload #####
                
            curs.executemany('BEGIN OLXLAKE.JSON_TO_TABLE(:1); END;', payload)

            conn.commit()
            print(f'{uf} - Commited batch up to page {pg -1} ✔️  +{len(payload_jsons)}')
                

            if _break_flag:
                break
conn.close()  








