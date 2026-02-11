CREATE TABLE transactions (
    transactionid varchar,
    timestampsec timestamp,
    customerid varchar,
    firstname varchar,
    surname varchar,
    shipping_state varchar,
    item varchar,
    description varchar,
    retail_price float(2),
    loyalty_discount float(2)
);


COPY transactions FROM 'C:\Users\spisa\Desktop\SQL Databases\OLTP.csv' DELIMITER ',' CSV HEADER;

SELECT *
FROM TRANSACTIONS

--Normalization 1NF Investigation
SELECT *
FROM TRANSACTIONS
	
--check for duplicates
SELECT COUNT (*)
FROM TRANSACTIONS
--result 3455 rows
	
SELECT COUNT (*)
FROM 
	(SELECT DISTINCT *
	FROM TRANSACTIONS
	) AS DISTINCT_ROWS;
-- result 3455 rows
--1NF confirmed

--Normalization 2NF 
SELECT*
FROM TRANSACTIONS;

CREATE TABLE TMP AS
SELECT CUSTOMERID,
	   FIRSTNAME,
	   SURNAME,
	   SHIPPING_STATE,
	   LOYALTY_DISCOUNT
FROM TRANSACTIONS;
-- result 3455 rows

SELECT*
FROM TMP;
	
--REMOVE DUPLICATES
CREATE TABLE CUSTOMERS AS 
SELECT DISTINCT *
FROM TMP; 
--result 942 rows

SELECT*
FROM CUSTOMERS;
--2NF confirmed

ALTER TABLE TRANSACTIONS
DROP COLUMN FIRSTNAME,
DROP COLUMN SURNAME, 
DROP COLUMN SHIPPING_STATE,
DROP COLUMN LOYALTY_DISCOUNT;
SELECT *
FROM TRANSACTIONS;
--2NF confirmed

DROP TABLE TMP;

--Normalization 3NF

SELECT * 
FROM CUSTOMERS;
--3NF CONFIRMED
	
SELECT *
FROM TRANSACTIONS;
--Candidate keys: transaction_id, time_stamp+customerid

CREATE TABLE TMP AS
SELECT ITEM,
	   DESCRIPTION,
	   RETAIL_PRICE
FROM TRANSACTIONS;
-- result 3455 rows	
	
SELECT *
FROM TMP;

--REMOVE DUPLICATES
CREATE TABLE ITEMS AS
SELECT DISTINCT *
FROM TMP;
-- result 126 rows
	
	--CHECK
	
SELECT *
FROM ITEMS;
-- 3NF CONFIRMED

	
ALTER TABLE TRANSACTIONS 
DROP COLUMN DESRIPTION,
DROP COLUMN RETAIL_PRICE;
	
SELECT *
FROM TRANSACTIONS;
--3NF CONFIRMED 

DROP TABLE TMP;
	
--I  normalized the database.







