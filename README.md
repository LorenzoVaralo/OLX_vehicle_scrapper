# OLX Vehicle Scrapper
[Under Development]

### What it is
This project is web scrapper and data pipeline to extract millions of car images and car data from OLX.com.

The data extraction is made asynchronously, making the data throughput BLAZINGLY FAST, it can extract all the car deals from OLX at a particular day in a matter of minutes (~50.000 car deals data and ~500.000 car images downloaded daily), the purpose of this project is for image gathering to train a neural network (another project).

### How it is done
This project is a data pipeline consisting of many python scripts, that should me executed in order (I'm thinking about orchestrating these scripts using Airflow later on), all the data is stored into an Oracle database in which the scripts are connected, part of the data processing is done at the database with PL-SQL procedures and functions, like transforming a JSON batch of data into table inserts. The images that are downloaded is stored in a local file, segregating by vehicle brand, version, model and olx Id.

### How to setup
First of, you need to ensure that all the dependencies are installed, the recomended action is to install all packages of the ```requirements.txt``` into an virtual environment or into a docker container.

##### Setup Oracle Database
In the github code files I included the Oracle database DSL as the file ```db_setup.dls```, you need to load this dsl into an already working Oracle database, this way all the tables, procedures and views necessary for the webscraping to work will be generated into the database.

### Running

The order for running all the scripts are:

1.```scrapeJsonList.py``` - Gets all the data from dozens of pages from the website, stores into the database.

2.```fillDimVeiculo.py``` - Checks all the vehicle models that are not in the vehicle dimension table, and inserts into those vehicle deals individually to collect detailed information of car version.

3.```getImages.py``` - Checks all ads whose images was not downloaded, and downloads them asynchronously into its respective folder.

---
### Thank You!
