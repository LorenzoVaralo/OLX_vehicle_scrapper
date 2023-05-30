--------------------------------------------------------
--  File created - Wednesday-May-24-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View VENDAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLXLAKE"."VENDAS" ("NOME", "VALOR") AS 
  SELECT 
    dc.NOME, 
    fat.VALOR
FROM 
    OLXLAKE.FATO fat
    JOIN
        OLXLAKE.DIM_CLIENTE dc ON fat.SK_CLIENTE = dc.SK_CLIENTE
;
--------------------------------------------------------
--  DDL for View VW_ANUNCIOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLXLAKE"."VW_ANUNCIOS" ("JSON_ANUNCIOS_ID", "JSON_ANUNCIOS_IS_IN_TABLE", "ADDATE", "STATE_ID", "LIST_ID", "PARENT_CATEGORY_ID", "CATEGORY_ID", "CITY_ID", "ZIPCODE", "OLXPAY_ENABLED", "DYNAMICBADGEPROPS", "INSTALLMENTS", "OLXDELIVERY_ENABLED", "WEIGHT", "VEHICLEREPORT_ENABLED", "TAGSSIZE", "YEAR_MONTH_REF", "PRICE_MIN", "PRICE_P25", "PRICE_P33", "PRICE_P50", "PRICE_P66", "PRICE_P75", "PRICE_MAX", "PRICE_STDDEV", "VEHICLE_COUNT", "VEHICLETAGS", "LASTINTERNALSOURCE", "LISTID", "SELLERNAME", "PRICE", "MAINCATEGORY", "SUBCATEGORY", "MAINCATEGORYID", "SUBCATEGORYID", "STATE", "DDD", "BRAND", "MODEL", "VERSION", "GEARBOX", "SUBJECT", "REGION", "VEHICLE_MODEL", "CARTYPE", "REGDATE", "MILEAGE", "MOTORPOWER", "FUEL", "CAR_STEERING", "CARCOLOR", "DOORS", "OWNER", "EXCHANGE", "FINANCIAL", "EXTRA", "GNV_KIT", "OWNER_MANUAL", "EXTRA_KEY", "DEALERSHIP_REVIEW", "WARRANTY", "HAS_GNV_KIT", "HAS_AUCTION", "HAS_PAID_IPVA", "HAS_WITH_FINE", "IS_SETTLED", "IS_FUNDED", "INDEXED_FINANCIAL_STATUS", "CONSERVATION_AND_WARRANTY", "INDEXED_CAR_STEERING", "ON_AUTOS_FAIR", "PICTURES", "LOGINTYPE", "USERID", "PAGETYPE", "ABTESTINGENABLE", "state", "category", "ISMOBILE", "source", "ADDESC") AS 
  SELECT
    ja.ID as json_anuncios_id,
    ja.IS_IN_TABLE as json_anuncios_is_in_table,
    OLXLAKE.UNIX_TO_TIMESTAMP(ja.exp_json_value."page".detail.adDate) as adDate,
    CAST(ja.exp_json_value."page".detail.state_idm as NUMBER) as state_id,
    ja.exp_json_value."page".detail.list_id as list_id,
    ja.exp_json_value."page".detail.parent_category_id as parent_category_id,
    ja.exp_json_value."page".detail.category_id as category_id,
    ja.exp_json_value."page".detail.city_id as city_id,
    ja.exp_json_value."page".detail.zipcode as zipcode,
    ja.exp_json_value."page".detail.olxPay.enabled as olxPay_enabled,
    ja.exp_json_value."page".detail.olxPay.dynamicBadgeProps as dynamicBadgeProps,
    ja.exp_json_value."page".detail.olxPay.installments as installments,
    ja.exp_json_value."page".detail.olxDelivery.enabled as olxDelivery_enabled,
    ja.exp_json_value."page".detail.olxDelivery.weight as weight,
    ja.exp_json_value."page".detail.vehicleReport.enabled as vehicleReport_enabled,
    ja.exp_json_value."page".detail.vehicleReport.tagsSize as tagsSize,
    ja.exp_json_value."page".detail.abuyPriceRef.year_month_ref as year_month_ref,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_min as NUMBER(10,2)) as price_min,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_p25 as NUMBER(10,2)) as price_p25,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_p33 as NUMBER(10,2)) as price_p33,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_p50 as NUMBER(10,2)) as price_p50,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_p66 as NUMBER(10,2)) as price_p66,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_p75 as NUMBER(10,2)) as price_p75,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_max as NUMBER(10,2)) as price_max,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.price_stddev as NUMBER(10,4)) as price_stddev,
    CAST(ja.exp_json_value."page".detail.abuyPriceRef.vehicle_count as NUMBER(10)) as vehicle_count,
    ja.exp_json_value."page".detail.vehicleTags as vehicleTags,
    ja.exp_json_value."page".detail.lastInternalSource as lastInternalSource,
    ja.exp_json_value."page".adDetail.listId as listId,
    ja.exp_json_value."page".adDetail.sellerName as sellerName,
    ja.exp_json_value."page".adDetail.price as price,
    ja.exp_json_value."page".adDetail.mainCategory as mainCategory,
    ja.exp_json_value."page".adDetail.subCategory as subCategory,
    ja.exp_json_value."page".adDetail.mainCategoryID as mainCategoryID,
    ja.exp_json_value."page".adDetail.subCategoryID as subCategoryID,
    ja.exp_json_value."page".adDetail.state as state,
    ja.exp_json_value."page".adDetail.ddd as ddd,
    ja.exp_json_value."page".adDetail.brand as brand,
    ja.exp_json_value."page".adDetail.model as model,
    ja.exp_json_value."page".adDetail.version as version,
    ja.exp_json_value."page".adDetail.gearbox as gearbox,
    ja.exp_json_value."page".adDetail.subject as subject,
    ja.exp_json_value."page".adDetail.region as region,
    ja.exp_json_value."page".adDetail.vehicle_model as vehicle_model,
    ja.exp_json_value."page".adDetail.cartype as cartype,
    ja.exp_json_value."page".adDetail.regdate as regdate,
    ja.exp_json_value."page".adDetail.mileage as mileage,
    ja.exp_json_value."page".adDetail.motorpower as motorpower,
    ja.exp_json_value."page".adDetail.fuel as fuel,
    ja.exp_json_value."page".adDetail.car_steering as car_steering,
    ja.exp_json_value."page".adDetail.carcolor as carcolor,
    ja.exp_json_value."page".adDetail.doors as doors,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.owner) as NUMBER(1,0)) as owner,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.exchange) as NUMBER(1,0)) as exchange,
    ja.exp_json_value."page".adDetail.financial as financial,
    ja.exp_json_value."page".adDetail.extra as extra,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.gnv_kit) as NUMBER(1,0)) as gnv_kit,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.owner_manual) as NUMBER(1,0)) as owner_manual,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.extra_key) as NUMBER(1,0)) as extra_key,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.dealership_review) as NUMBER(1,0)) as dealership_review,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.warranty) as NUMBER(1,0)) as warranty,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.has_gnv_kit) as NUMBER(1,0)) as has_gnv_kit,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.has_auction) as NUMBER(1,0)) as has_auction,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.has_paid_ipva) as NUMBER(1,0)) as has_paid_ipva,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.has_with_fine) as NUMBER(1,0)) as has_with_fine,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.is_settled) as NUMBER(1,0)) as is_settled,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.is_funded) as NUMBER(1,0)) as is_funded,
    ja.exp_json_value."page".adDetail.indexed_financial_status as indexed_financial_status,
    ja.exp_json_value."page".adDetail.conservation_and_warranty as conservation_and_warranty,
    ja.exp_json_value."page".adDetail.indexed_car_steering as indexed_car_steering,
    CAST(OLXLAKE.SN_TO_BINARY(ja.exp_json_value."page".adDetail.on_autos_fair) as NUMBER(1,0)) as on_autos_fair,
    ja.exp_json_value.pictures as pictures,
    ja.exp_json_value."session"."user".loginType as loginType,
    ja.exp_json_value."session"."user".userID as userID,
    ja.exp_json_value.pageType as pageType,
    ja.exp_json_value.abtestingEnable as abtestingEnable,
    ja.exp_json_value."state" as "state",
    ja.exp_json_value."category" as "category",
    ja.exp_json_value.site.isMobile as isMobile,
    ja.exp_json_value.site."source" as "source",
    ja.exp_json_value.addesc as addesc
FROM
    OLXLAKE.JSON_ANUNCIOS ja
;
--------------------------------------------------------
--  DDL for View VW_IMAGE_LINKS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLXLAKE"."VW_IMAGE_LINKS" ("LISTID", "BRAND", "MODELO", "VERSAO", "VEHICLE_MODEL", "REGDATE", "IMAGES_ORIGINAL") AS 
  SELECT 
	DISTINCT fal.LISTID,
	dv.BRAND,
	dv.MODELO,
	dv.VERSAO,
	dv.VEHICLE_MODEL,
	fal.P_REGDATE regdate,
	fal.IMAGES_ORIGINAL
	
FROM
	OLXLAKE.FATO_ANUNCIOS_LISTA fal 
	JOIN
		OLXLAKE.DIM_VEICULO dv ON fal.P_VEHICLE_MODEL = dv.VEHICLE_MODEL
WHERE 
	fal.IMAGES_DOWNLOADED = 0
;
--------------------------------------------------------
--  DDL for View VW_MODELS_NOT_IN_DIM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "OLXLAKE"."VW_MODELS_NOT_IN_DIM" ("LISTID", "URL", "DATE_UNIX", "VEHICLE_MODEL", "PRIORITY") AS 
  SELECT 
  	DISTINCT fal.LISTID listid,
	fal.URL url,
	fal.DATE_UNIX date_unix,
	fal.P_VEHICLE_MODEL vehicle_model,
	rank() OVER(PARTITION BY fal.P_VEHICLE_MODEL ORDER BY fal.DATE_UNIX) priority
FROM 
	OLXLAKE.FATO_ANUNCIOS_LISTA fal 
	LEFT JOIN OLXLAKE.DIM_VEICULO dv 
	ON fal.P_VEHICLE_MODEL = dv.VEHICLE_MODEL 
WHERE 
	dv.VEHICLE_MODEL IS NULL
ORDER BY
	fal.P_VEHICLE_MODEL,
	fal.DATE_UNIX
;

--------------------------------------------------------
--  DDL for Table DIM_VEICULO
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."DIM_VEICULO" 
   (	"SK_VEICULO" NUMBER(10,0), 
	"BRAND" VARCHAR2(25 BYTE), 
	"MODELO" VARCHAR2(100 BYTE), 
	"VERSAO" VARCHAR2(255 BYTE), 
	"VEHICLE_MODEL" VARCHAR2(255 BYTE), 
	"INSERT_DATE" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FATO_ANUNCIOS
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."FATO_ANUNCIOS" 
   (	"JSON_ANUNCIOS_ID" VARCHAR2(10 BYTE), 
	"ADDATE" TIMESTAMP (6), 
	"LIST_ID" VARCHAR2(15 BYTE), 
	"PARENT_CATEGORY_ID" VARCHAR2(7 BYTE), 
	"CATEGORY_ID" VARCHAR2(7 BYTE), 
	"CITY_ID" VARCHAR2(7 BYTE), 
	"ZIPCODE" CHAR(8 BYTE), 
	"VEHICLEREPORT_ENABLED" VARCHAR2(7 BYTE), 
	"TAGSSIZE" VARCHAR2(7 BYTE), 
	"YEAR_MONTH_REF" VARCHAR2(7 BYTE), 
	"PRICE_MIN" NUMBER(10,2), 
	"PRICE_P25" NUMBER(10,2), 
	"PRICE_P33" NUMBER(10,2), 
	"PRICE_P50" NUMBER(10,2), 
	"PRICE_P66" NUMBER(10,2), 
	"PRICE_P75" NUMBER(10,2), 
	"PRICE_MAX" NUMBER(10,2), 
	"PRICE_STDDEV" NUMBER(10,4), 
	"VEHICLE_COUNT" NUMBER(10,0), 
	"VEHICLETAGS" VARCHAR2(100 BYTE), 
	"SELLERNAME" VARCHAR2(100 BYTE), 
	"PRICE" NUMBER(10,2), 
	"STATE" CHAR(2 BYTE), 
	"DDD" CHAR(2 BYTE), 
	"GEARBOX" VARCHAR2(20 BYTE), 
	"REGION" VARCHAR2(50 BYTE), 
	"CARTYPE" VARCHAR2(30 BYTE), 
	"REGDATE" CHAR(4 BYTE), 
	"MILEAGE" NUMBER(10,0), 
	"MOTORPOWER" VARCHAR2(25 BYTE), 
	"FUEL" VARCHAR2(25 BYTE), 
	"CAR_STEERING" VARCHAR2(25 BYTE), 
	"CARCOLOR" VARCHAR2(25 BYTE), 
	"DOORS" VARCHAR2(10 BYTE), 
	"OWNER" NUMBER(1,0), 
	"EXCHANGE" NUMBER(1,0), 
	"FINANCIAL" VARCHAR2(100 BYTE), 
	"EXTRA" VARCHAR2(300 BYTE), 
	"GNV_KIT" NUMBER(1,0), 
	"OWNER_MANUAL" NUMBER(1,0), 
	"EXTRA_KEY" NUMBER(1,0), 
	"DEALERSHIP_REVIEW" NUMBER(1,0), 
	"WARRANTY" NUMBER(1,0), 
	"HAS_GNV_KIT" NUMBER(1,0), 
	"HAS_AUCTION" NUMBER(1,0), 
	"HAS_PAID_IPVA" NUMBER(1,0), 
	"HAS_WITH_FINE" NUMBER(1,0), 
	"IS_SETTLED" NUMBER(1,0), 
	"IS_FUNDED" NUMBER(1,0), 
	"INDEXED_FINANCIAL_STATUS" VARCHAR2(30 BYTE), 
	"CONSERVATION_AND_WARRANTY" VARCHAR2(120 BYTE), 
	"INDEXED_CAR_STEERING" VARCHAR2(25 BYTE), 
	"ON_AUTOS_FAIR" NUMBER(1,0), 
	"PICTURES" NUMBER(3,0), 
	"ISMOBILE" VARCHAR2(5 BYTE), 
	"SOURCE" VARCHAR2(10 BYTE), 
	"ADDESC" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FATO_ANUNCIOS_LISTA
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."FATO_ANUNCIOS_LISTA" 
   (	"SUBJECT" VARCHAR2(300 BYTE), 
	"PRICE" VARCHAR2(120 BYTE), 
	"LISTID" VARCHAR2(120 BYTE), 
	"LASTBUMPAGESECS" VARCHAR2(120 BYTE), 
	"OLDPRICE" VARCHAR2(120 BYTE), 
	"PROFESSIONALAD" VARCHAR2(120 BYTE), 
	"ISFEATURED" VARCHAR2(120 BYTE), 
	"LISTINGCATEGORYID" VARCHAR2(120 BYTE), 
	"IMAGES_ORIGINAL" VARCHAR2(2500 BYTE), 
	"IMAGES_THUMBNAIL" VARCHAR2(2500 BYTE), 
	"VIDEOCOUNT" VARCHAR2(120 BYTE), 
	"ISCHATENABLED" VARCHAR2(120 BYTE), 
	"FIXEDONTOP" VARCHAR2(120 BYTE), 
	"URL" VARCHAR2(250 BYTE), 
	"THUMBNAIL" VARCHAR2(200 BYTE), 
	"DATE_STRING" VARCHAR2(120 BYTE), 
	"DATE_UNIX" NUMBER(10,0), 
	"IMAGECOUNT" VARCHAR2(120 BYTE), 
	"LOCATION" VARCHAR2(120 BYTE), 
	"CATEGORY" VARCHAR2(120 BYTE), 
	"SEARCHCATEGORYLEVELZERO" VARCHAR2(120 BYTE), 
	"SEARCHCATEGORYLEVELONE" VARCHAR2(120 BYTE), 
	"P_CATEGORY" VARCHAR2(120 BYTE), 
	"P_VEHICLE_MODEL" VARCHAR2(120 BYTE), 
	"P_VEHICLE_BRAND" VARCHAR2(120 BYTE), 
	"P_CARTYPE" VARCHAR2(120 BYTE), 
	"P_REGDATE" VARCHAR2(120 BYTE), 
	"P_MILEAGE" VARCHAR2(120 BYTE), 
	"P_MOTORPOWER" VARCHAR2(120 BYTE), 
	"P_FUEL" VARCHAR2(120 BYTE), 
	"P_GEARBOX" VARCHAR2(120 BYTE), 
	"P_CAR_STEERING" VARCHAR2(120 BYTE), 
	"P_CARCOLOR" VARCHAR2(250 BYTE), 
	"P_DOORS" VARCHAR2(120 BYTE), 
	"P_END_TAG" VARCHAR2(120 BYTE), 
	"P_OWNER" VARCHAR2(120 BYTE), 
	"P_EXCHANGE" VARCHAR2(120 BYTE), 
	"P_CAR_FEATURES" VARCHAR2(150 BYTE), 
	"P_GNV_KIT" VARCHAR2(120 BYTE), 
	"P_OWNER_MANUAL" VARCHAR2(120 BYTE), 
	"P_EXTRA_KEY" VARCHAR2(120 BYTE), 
	"P_DEALERSHIP_REVIEW" VARCHAR2(120 BYTE), 
	"P_WARRANTY" VARCHAR2(120 BYTE), 
	"P_HAS_GNV_KIT" VARCHAR2(120 BYTE), 
	"P_HAS_AUCTION" VARCHAR2(120 BYTE), 
	"P_HAS_PAID_IPVA" VARCHAR2(120 BYTE), 
	"P_HAS_WITH_FINE" VARCHAR2(120 BYTE), 
	"P_IS_SETTLED" VARCHAR2(120 BYTE), 
	"P_IS_FUNDED" VARCHAR2(120 BYTE), 
	"P_INDEXED_FINANCIAL_STATUS" VARCHAR2(120 BYTE), 
	"P_DOCU_AND_REGULARIZATION" VARCHAR2(120 BYTE), 
	"P_CONSERV_AND_WARRANTY" VARCHAR2(120 BYTE), 
	"P_INDEXED_CAR_STEERING" VARCHAR2(120 BYTE), 
	"P_ON_AUTOS_FAIR" VARCHAR2(50 BYTE), 
	"IMAGES_DOWNLOADED" NUMBER(2,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FAT_ANUNCIO
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."FAT_ANUNCIO" 
   (	"ID" NUMBER, 
	"OLX_COD" CHAR(15 BYTE), 
	"LISTID" NUMBER, 
	"VEHICLEID" NUMBER(10,0), 
	"SELLERNAME" VARCHAR2(50 BYTE), 
	"PRICE" VARCHAR2(10 BYTE), 
	"ESTADO" VARCHAR2(30 BYTE), 
	"DDD" VARCHAR2(5 BYTE), 
	"GEARBOX" VARCHAR2(25 BYTE), 
	"TITULO" VARCHAR2(150 BYTE), 
	"REGION" VARCHAR2(50 BYTE), 
	"CARTYPE" VARCHAR2(30 BYTE), 
	"REGDATE" VARCHAR2(20 BYTE), 
	"MILEAGE" VARCHAR2(10 BYTE), 
	"MOTORPOWER" VARCHAR2(30 BYTE), 
	"FUEL" VARCHAR2(15 BYTE), 
	"CAR_STEERING" VARCHAR2(20 BYTE), 
	"CARCOLOR" VARCHAR2(30 BYTE), 
	"DOORS" VARCHAR2(30 BYTE), 
	"END_TAG" VARCHAR2(15 BYTE), 
	"DONO" VARCHAR2(5 BYTE), 
	"EXCHANGE" VARCHAR2(5 BYTE), 
	"FINANCIAL" VARCHAR2(5 BYTE), 
	"EXTRA" VARCHAR2(25 BYTE), 
	"ADDESC" VARCHAR2(1000 BYTE), 
	"PRO_VENDOR" NUMBER, 
	"INSERT_DATE" NUMBER(8,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JSON_ANUNCIOS
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."JSON_ANUNCIOS" 
   (	"ID" NUMBER, 
	"EXP_JSON_VALUE" CLOB, 
	"IS_IN_TABLE" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("EXP_JSON_VALUE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LINKS
--------------------------------------------------------

  CREATE TABLE "OLXLAKE"."LINKS" 
   (	"ID" NUMBER(5,0), 
	"HREF" VARCHAR2(255 BYTE), 
	"OLX_CODE" CHAR(15 BYTE), 
	"INSERT_DATE" NUMBER(8,0), 
	"EXPLORED" NUMBER(3,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ANUNCIO_ID
--------------------------------------------------------

   CREATE SEQUENCE  "OLXLAKE"."SEQ_ANUNCIO_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CLIENTE_TESTEE
--------------------------------------------------------

   CREATE SEQUENCE  "OLXLAKE"."SEQ_CLIENTE_TESTEE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ID_CLIENTE
--------------------------------------------------------

   CREATE SEQUENCE  "OLXLAKE"."SEQ_ID_CLIENTE"  MINVALUE 100 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 120 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ_LINKS
--------------------------------------------------------

   CREATE SEQUENCE  "OLXLAKE"."SEQ_LINKS"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2761 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence SEQ_VEICULO_ID
--------------------------------------------------------

   CREATE SEQUENCE  "OLXLAKE"."SEQ_VEICULO_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6821 CACHE 20 NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Procedure INSERT_ANUNCIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."INSERT_ANUNCIO" (
    p_listId NUMBER,
    p_brand VARCHAR,
    p_modelo VARCHAR,
    p_versao VARCHAR,
    p_vehicle_model VARCHAR,
    p_sellerName VARCHAR,
    p_price VARCHAR,
    p_estado VARCHAR,
    p_ddd VARCHAR,
    p_gearbox VARCHAR,
    p_titulo VARCHAR,
    p_region VARCHAR,
    p_cartype VARCHAR,
    p_regdate VARCHAR,
    p_mileage VARCHAR,
    p_motorpower VARCHAR,
    p_fuel VARCHAR,
    p_car_steering VARCHAR,
    p_carcolor VARCHAR,
    p_doors VARCHAR,
    p_end_tag VARCHAR,
    p_dono VARCHAR,
    p_exchange VARCHAR,
    p_financial VARCHAR,
    p_extra VARCHAR,
    p_addesc VARCHAR,
    p_pro_vendor NUMBER) 
    IS
        v_sk_veiculo NUMBER;
    BEGIN

        -- Cadastrar Veiculo
        OLXLAKE.INSERT_VEICULO(p_brand, p_modelo, p_versao, p_vehicle_model, v_sk_veiculo);

        INSERT INTO OLXLAKE.FAT_ANUNCIO(
            Id,
            listId ,
            vehicleId,
            sellerName,
            price,
            estado,
            ddd,
            gearbox,
            titulo,
            region,
            cartype,
            regdate,
            mileage,
            motorpower,
            fuel,
            car_steering,
            carcolor,
            doors,
            end_tag,
            dono,
            exchange,
            financial,
            extra,
            addesc,
            pro_vendor,
            insert_date)
        VALUES(
            SEQ_ANUNCIO_ID.nextval,
            p_listId,
            v_sk_veiculo,
            p_sellerName,
            p_price,
            p_estado,
            p_ddd,
            p_gearbox,
            p_titulo,
            p_region,
            p_cartype,
            p_regdate,
            p_mileage,
            p_motorpower,
            p_fuel,
            p_car_steering,
            p_carcolor,
            p_doors,
            p_end_tag,
            p_dono,
            p_exchange,
            p_financial,
            p_extra,
            p_addesc,
            p_pro_vendor,
            to_number(to_char(sysdate, 'YYYYmmdd')));
    END;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."INSERT_LINK" (v_href VARCHAR, v_olx_code CHAR) IS
    olx_code_count NUMBER;
    BEGIN
        SELECT COUNT(OLX_CODE) INTO olx_code_count 
        FROM OLXLAKE.LINKS
        WHERE OLX_CODE = v_olx_code;

        IF olx_code_count = 0 THEN
            INSERT INTO 
                OLXLAKE.LINKS (
                    id,
                    href ,
                    olx_code ,
                    insert_date,
                    explored)
            VALUES (
                OLXLAKE.seq_links.nextval,
                v_href,
                v_olx_code,
                to_number(to_char(sysdate, 'YYYYmmdd')),
                0);
        ELSE
            DBMS_OUTPUT.PUT_LINE('AVISO: OLX_CODE '||v_olx_code||' JÁ EXISTE NA TABELA "LINKS".');
        END IF;
    END;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_VEICULO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."INSERT_VEICULO" (
    v_marca VARCHAR, 
    v_modelo VARCHAR, 
    v_versao VARCHAR, 
    v_vehicle_model VARCHAR, 
    result_id OUT NUMBER)
    IS
        /*Procedure para adicionar informações sobre modelos de carro, para alimentar a dimensão de veiculos
        modelos de carros que já estão na dimensao são desconsiderados, a procedure retorna o código do modelo de 
        carro por meio do parametro OUT 'result_id'. */

        cadastro_id NUMBER;
    BEGIN
        SELECT 
            MAX(SK_VEICULO) INTO cadastro_id 
        FROM 
            OLXLAKE.DIM_VEICULO 
        WHERE 
            BRAND = UPPER(v_marca) AND 
            MODELO = UPPER(v_modelo) AND 
            VERSAO = UPPER(v_versao) AND 
            VEHICLE_MODEL = UPPER(v_vehicle_model);

        IF cadastro_id IS NULL THEN
            -- SE não existe cadastro: adicionar na dimensão e na fato
            cadastro_id := SEQ_VEICULO_ID.nextval;

            INSERT INTO OLXLAKE.DIM_VEICULO(
                    sk_veiculo,
                    brand,
                    modelo,
                    versao,
                    vehicle_model,
                    insert_date)
                VALUES(
                    cadastro_id,
                    UPPER(v_marca),
                    UPPER(v_modelo),
                    UPPER(v_versao),
                    UPPER(v_vehicle_model),
                    to_number(to_char(sysdate, 'YYYYmmdd')));

        END IF;

          result_id := cadastro_id;

    END;

/
--------------------------------------------------------
--  DDL for Procedure JSON_TO_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."JSON_TO_TABLE" (json_clob CLOB)
IS

BEGIN
	--dbms_output.put_line(json_clob);
	FOR i IN (
			SELECT 
				jt.*
			FROM
				JSON_TABLE(
					json_clob,
					'$[*]'
					COLUMNS(
						"subject" VARCHAR2 PATH '$.subject', 
						"price" VARCHAR2 PATH '$.price', 
						"listId" VARCHAR2 PATH '$.listId', 
						"lastBumpAgeSecs" VARCHAR2 PATH '$.lastBumpAgeSecs', 
						"oldPrice" VARCHAR2 PATH '$.oldPrice', 
						"professionalAd" VARCHAR2 PATH '$.professionalAd', 
						"isFeatured" VARCHAR2 PATH '$.isFeatured', 
						"listingCategoryId" VARCHAR2 PATH '$.listingCategoryId', 
						"images_original" VARCHAR2 FORMAT JSON WITH WRAPPER PATH '$.images[*].original', 
						"images_thumbnail" VARCHAR2 FORMAT JSON WITH WRAPPER PATH '$.images[*].thumbnail', 
						"videoCount" VARCHAR2 PATH '$.videoCount', 
						"isChatEnabled" VARCHAR2 PATH '$.isChatEnabled', 
						"fixedOnTop" VARCHAR2 PATH '$.fixedOnTop', 
						"url" VARCHAR2 PATH '$.url', 
						"thumbnail" VARCHAR2 PATH '$.thumbnail', 
						"date" VARCHAR2 PATH '$.date', 
						"imageCount" VARCHAR2 PATH '$.imageCount', 
						"location" VARCHAR2 PATH '$.location', 
						"category" VARCHAR2 PATH '$.category', 
						"searchCategoryLevelZero" VARCHAR2 PATH '$.searchCategoryLevelZero', 
						"searchCategoryLevelOne" VARCHAR2 PATH '$.searchCategoryLevelOne', --Da pra fzr q nem fez nas imagens, ao invés de se assim
						"p_category" VARCHAR2 PATH '$.properties[0].value',
						"p_vehicle_model" VARCHAR2 PATH '$.properties[1].value',
						"p_vehicle_brand" VARCHAR2 PATH '$.properties[2].value',
						"p_cartype" VARCHAR2 PATH '$.properties[3].value',
						"p_regdate" VARCHAR2 PATH '$.properties[4].value',
						"p_mileage" VARCHAR2 PATH '$.properties[5].value',
						"p_motorpower" VARCHAR2 PATH '$.properties[6].value',
						"p_fuel" VARCHAR2 PATH '$.properties[7].value',
						"p_gearbox" VARCHAR2 PATH '$.properties[8].value',
						"p_car_steering" VARCHAR2 PATH '$.properties[9].value',
						"p_carcolor" VARCHAR2 PATH '$.properties[10].value',
						"p_doors" VARCHAR2 PATH '$.properties[11].value',
						"p_end_tag" VARCHAR2 PATH '$.properties[12].value',
						"p_owner" VARCHAR2 PATH '$.properties[13].value',
						"p_exchange" VARCHAR2 PATH '$.properties[14].value',
						"p_car_features" VARCHAR2 PATH '$.properties[15].value',
						"p_gnv_kit" VARCHAR2 PATH '$.properties[16].value',
						"p_owner_manual" VARCHAR2 PATH '$.properties[17].value',
						"p_extra_key" VARCHAR2 PATH '$.properties[18].value',
						"p_dealership_review" VARCHAR2 PATH '$.properties[19].value',
						"p_warranty" VARCHAR2 PATH '$.properties[20].value',
						"p_has_gnv_kit" VARCHAR2 PATH '$.properties[21].value',
						"p_has_auction" VARCHAR2 PATH '$.properties[22].value',
						"p_has_paid_ipva" VARCHAR2 PATH '$.properties[23].value',
						"p_has_with_fine" VARCHAR2 PATH '$.properties[24].value',
						"p_is_settled" VARCHAR2 PATH '$.properties[25].value',
						"p_is_funded" VARCHAR2 PATH '$.properties[26].value',
						"p_indexed_financial_status" VARCHAR2 PATH '$.properties[27].value',
						"p_docu_and_regularization" VARCHAR2 PATH '$.properties[28].value',
						"p_conserv_and_warranty" VARCHAR2 PATH '$.properties[29].value',
						"p_indexed_car_steering" VARCHAR2 PATH '$.properties[30].value',
						"p_on_autos_fair" VARCHAR2 PATH '$.properties[31].value'
					)
				) jt
	)LOOP 
		INSERT 
			INTO
		OLXLAKE.FATO_ANUNCIOS_LISTA (
			subject,
			price,
			listId,
			lastBumpAgeSecs,
			oldPrice,
			professionalAd,
			isFeatured,
			listingCategoryId,
			images_original,
			images_thumbnail,
			videoCount,
			isChatEnabled,
			fixedOnTop,
			url,
			thumbnail,
			date_string,
			date_unix,
			imageCount,
			location,
			category,
			searchCategoryLevelZero,
			searchCategoryLevelOne,
			p_category,
			p_vehicle_model,
			p_vehicle_brand,
			p_cartype,
			p_regdate,
			p_mileage,
			p_motorpower,
			p_fuel,
			p_gearbox,
			p_car_steering,
			p_carcolor,
			p_doors,
			p_end_tag,
			p_owner,
			p_exchange,
			p_car_features,
			p_gnv_kit,
			p_owner_manual,
			p_extra_key,
			p_dealership_review,
			p_warranty,
			p_has_gnv_kit,
			p_has_auction,
			p_has_paid_ipva,
			p_has_with_fine,
			p_is_settled,
			p_is_funded,
			p_indexed_financial_status,
			p_docu_and_regularization,
			p_conserv_and_warranty,
			p_indexed_car_steering,
			p_on_autos_fair
		) VALUES (
			i."subject", 
			i."price",
			i."listId",
			i."lastBumpAgeSecs",
			i."oldPrice",
			i."professionalAd",
			i."isFeatured",
			i."listingCategoryId",
			i."images_original",
			i."images_thumbnail",
			i."videoCount",
			i."isChatEnabled",
			i."fixedOnTop",
			i."url",
			i."thumbnail",
			OLXLAKE.UNIX_TO_TIMESTAMP(i."date"),
			i."date",
			i."imageCount",
			i."location",
			i."category",
			i."searchCategoryLevelZero",
			i."searchCategoryLevelOne",
			i."p_category",
			i."p_vehicle_model",
			i."p_vehicle_brand",
			i."p_cartype",
			i."p_regdate",
			i."p_mileage",
			i."p_motorpower",
			i."p_fuel",
			i."p_gearbox",
			i."p_car_steering",
			i."p_carcolor",
			i."p_doors",
			i."p_end_tag",
			OLXLAKE.SN_TO_BINARY(i."p_owner"),
			OLXLAKE.SN_TO_BINARY(i."p_exchange"),
			i."p_car_features",
			OLXLAKE.SN_TO_BINARY(i."p_gnv_kit"),
			OLXLAKE.SN_TO_BINARY(i."p_owner_manual"),
			OLXLAKE.SN_TO_BINARY(i."p_extra_key"),
			OLXLAKE.SN_TO_BINARY(i."p_dealership_review"),
			OLXLAKE.SN_TO_BINARY(i."p_warranty"),
			OLXLAKE.SN_TO_BINARY(i."p_has_gnv_kit"),
			OLXLAKE.SN_TO_BINARY(i."p_has_auction"),
			OLXLAKE.SN_TO_BINARY(i."p_has_paid_ipva"),
			OLXLAKE.SN_TO_BINARY(i."p_has_with_fine"),
			OLXLAKE.SN_TO_BINARY(i."p_is_settled"),
			OLXLAKE.SN_TO_BINARY(i."p_is_funded"),
			i."p_indexed_financial_status",
			i."p_docu_and_regularization",
			i."p_conserv_and_warranty",
			i."p_indexed_car_steering",
			OLXLAKE.SN_TO_BINARY(i."p_on_autos_fair"));
	END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure RESET_SEQ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."RESET_SEQ" ( p_seq_name in varchar2 )
is
    l_val number;
begin
    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;

    execute immediate
    'alter sequence ' || p_seq_name || ' increment by -' || l_val || 
                                                          ' minvalue 0';
    execute immediate
    'select ' || p_seq_name || '.nextval from dual' INTO l_val;

    execute immediate
    'alter sequence ' || p_seq_name || ' increment by 1 minvalue 0';
end;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_TABLES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "OLXLAKE"."UPDATE_TABLES" IS
    CURSOR data_cur IS 
        SELECT * FROM OLXLAKE.VW_ANUNCIOS WHERE json_anuncios_is_in_table = 0;
    crow data_cur%ROWTYPE;

    vehicle_id NUMBER;
BEGIN

    for crow in data_cur 
    loop
        OLXLAKE.INSERT_VEICULO(
                crow.brand,
                crow.model,
                crow.version,
                crow.vehicle_model,
                vehicle_id);

        INSERT INTO OLXLAKE.FATO_ANUNCIOS(
            json_anuncios_id,
            adDate,
            list_id,
            parent_category_id,
            category_id,
            city_id,
            zipcode,
            vehicleReport_enabled,
            tagsSize,
            year_month_ref,
            price_min,
            price_p25,
            price_p33,
            price_p50,
            price_p66,
            price_p75,
            price_max,
            price_stddev,
            vehicle_count,
            vehicleTags,
            sellerName,
            price,
            state,
            ddd,
            gearbox,
            region,
            cartype,
            regdate,
            mileage,
            motorpower,
            fuel,
            car_steering,
            carcolor,
            doors,
            owner,
            exchange,
            financial,
            extra,
            gnv_kit,
            owner_manual,
            extra_key,
            dealership_review,
            warranty,
            has_gnv_kit,
            has_auction,
            has_paid_ipva,
            has_with_fine,
            is_settled,
            is_funded,
            indexed_financial_status,
            conservation_and_warranty,
            indexed_car_steering,
            on_autos_fair,
            pictures,
            isMobile,
            source,
            addesc)
        VALUES (
            crow.json_anuncios_id,
            crow.adDate,
            crow.list_id,
            crow.parent_category_id,
            crow.category_id,
            crow.city_id,
            crow.zipcode,
            crow.vehicleReport_enabled,
            crow.tagsSize,
            crow.year_month_ref,
            crow.price_min,
            crow.price_p25,
            crow.price_p33,
            crow.price_p50,
            crow.price_p66,
            crow.price_p75,
            crow.price_max,
            crow.price_stddev,
            crow.vehicle_count,
            crow.vehicleTags,
            crow.sellerName,
            crow.price,
            crow.state,
            crow.ddd,
            crow.gearbox,
            crow.region,
            crow.cartype,
            crow.regdate,
            crow.mileage,
            crow.motorpower,
            crow.fuel,
            crow.car_steering,
            crow.carcolor,
            crow.doors,
            crow.owner,
            crow.exchange,
            crow.financial,
            crow.extra,
            crow.gnv_kit,
            crow.owner_manual,
            crow.extra_key,
            crow.dealership_review,
            crow.warranty,
            crow.has_gnv_kit,
            crow.has_auction,
            crow.has_paid_ipva,
            crow.has_with_fine,
            crow.is_settled,
            crow.is_funded,
            crow.indexed_financial_status,
            crow.conservation_and_warranty,
            crow.indexed_car_steering,
            crow.on_autos_fair,
            crow.pictures,
            crow.isMobile,
            crow."source",
            crow.addesc);


    end loop;
end;

/
--------------------------------------------------------
--  DDL for Function SN_TO_BINARY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "OLXLAKE"."SN_TO_BINARY" ( v_SN varchar) RETURN NUMBER IS
BEGIN
    IF UPPER(v_SN) = 'SIM' THEN
        RETURN 1;
    ELSE 
        IF UPPER(v_SN) = 'NÃO' THEN
            RETURN 0;
        ELSE
            RETURN null;
        END IF;
    END IF;
END;

/
--------------------------------------------------------
--  DDL for Function SN_TO_BOOLEAN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "OLXLAKE"."SN_TO_BOOLEAN" ( v_SN varchar) RETURN BOOLEAN IS
BEGIN
    IF UPPER(v_SN) = 'SIM' THEN
        RETURN true;
    ELSE 
        IF UPPER(v_SN) = 'NÃO' THEN
            RETURN false;
        ELSE
            RETURN null;
        END IF;
    END IF;
END;

/
--------------------------------------------------------
--  DDL for Function UNIX_TO_TIMESTAMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "OLXLAKE"."UNIX_TO_TIMESTAMP" (unix number) RETURN TIMESTAMP IS
    v_timestamp TIMESTAMP;
BEGIN
    SELECT 
        TO_TIMESTAMP('1970-01-01', 'YYYY-MM-DD') + NUMTODSINTERVAL(unix, 'SECOND')
    INTO 
        v_timestamp 
    FROM 
        dual;

    RETURN v_timestamp;
END;

/
--------------------------------------------------------
--  Constraints for Table DIM_VEICULO
--------------------------------------------------------

  ALTER TABLE "OLXLAKE"."DIM_VEICULO" MODIFY ("SK_VEICULO" NOT NULL ENABLE);
  ALTER TABLE "OLXLAKE"."DIM_VEICULO" ADD PRIMARY KEY ("SK_VEICULO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FAT_ANUNCIO
--------------------------------------------------------

  ALTER TABLE "OLXLAKE"."FAT_ANUNCIO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "OLXLAKE"."FAT_ANUNCIO" MODIFY ("LISTID" NOT NULL ENABLE);
  ALTER TABLE "OLXLAKE"."FAT_ANUNCIO" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JSON_ANUNCIOS
--------------------------------------------------------

  ALTER TABLE "OLXLAKE"."JSON_ANUNCIOS" ADD CONSTRAINT "EXP_JSON_CHK" CHECK (exp_json_value is json (with unique keys)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LINKS
--------------------------------------------------------

  ALTER TABLE "OLXLAKE"."LINKS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "OLXLAKE"."LINKS" MODIFY ("HREF" NOT NULL ENABLE);
  ALTER TABLE "OLXLAKE"."LINKS" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "OLXLAKE"."LINKS" ADD UNIQUE ("HREF")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
