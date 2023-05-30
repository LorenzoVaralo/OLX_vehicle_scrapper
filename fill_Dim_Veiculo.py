from db_config import db_config
import cx_Oracle
import requests
import json
import re


# -- Connect to Oracle --
dns_tns = cx_Oracle.makedsn(db_config["HOST"], db_config["PORT"], service_name=db_config["SERVICE_NAME"])

conn = cx_Oracle.connect(user=db_config["USER"], password=db_config["PASSWORD"], dsn = dns_tns)
curs = conn.cursor()
# --


headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36'
    }

futures_size = 1
priority = 1
print('Starting...')

while True:
    curs.execute(f"select url from OLXLAKE.VW_MODELS_NOT_IN_DIM WHERE priority = {priority}")#FETCH FIRST 500 ROWS ONLY")
    print(f"Priority {priority}...")
    df = curs.fetchall() #List of tuples
    
    if df.__len__() == 0:
        break
    
    url_list = [x[0] for x in df] #List of urls

    idx = 0
    payload = []

    for link in url_list:
        idx += 1
        html = requests.get(link, headers = headers).text
        script = re.search('<script>window.dataLayer.*?<\/script>', html).group()
        if script[49:63] == 'page_not_found':
            print('404 -', str(idx))
        else:    
            data = json.loads(re.search('\[(.*)\]', script).group()[1:-1])
            
            marca  = data['page']['adDetail']['brand']
            modelo = data['page']['adDetail']['model']
            versao = data['page']['adDetail']['version']
            vehicle_model = data['page']['adDetail']['vehicle_model']
            
            payload.append((marca, modelo, versao, vehicle_model, 1))
            print(idx)
        
    print('Finished priority', priority)
    curs.executemany("BEGIN OLXLAKE.INSERT_VEICULO(:1, :2, :3, :4, :5); END;", payload)
    conn.commit()

    priority += 1

conn.close()












