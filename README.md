# 🚀 sql-clothing-store-database-redesign

## **Project Overview**
Ths project shows how I audites a "flat" database for an online store and refactored it into a professional, relational schema. I handled the full mormalization process and verified the results in both **PostgreSQL** and **MS SQL Server**.
---

## 🔍 **Step 1: 1NF Investigation (The Audit)**
I started with 3455 rows of a raw transaction data.
  - **The Process:** I ran a SELECT COUNT(*) and compared it to SELECT DISTINCT* to check for duplicates.
  - **The Results:** Both counts matched exactly at 3455, meaning there were no duplicate rows.
  - **Confirmation:** I confirmed the table was in **First Normal Form** --every cell was atomic and unique identifier was present.

## 🛠️ **Step 2: 2NF Candidate Keys & Table Refactoring**
I focused on removing partial dependencies by identifying the correct **Candidate Keys**
  - **The Logic:** I identified two Candidate Keys, (transactionid) and  a **Composite Candidate Key** (timestamp + customerid).
  - **THe TMP Table Bridge:** I created a temporary table (TMP) to isolate customer-specific columns like firstname, surname, shopping_state, and loyalty_discount.
  - **Creating the Entity:** I extracted 942 unique users into a new permanent **CUSTOMERS** table.
  - **Final Cleanup:** I used ALTER TABLE to **DROP** the redundant columns from Transactions table and then **DROPPED** the TMP table to keep the database clean.
  - **Confirmation:** I confirmed the tables were in **Second Normal Form**

## ⚡ **Step 3: 3NF - Checking All Tables for Transitive Dependencies** to reach **Third Normal Form**, I audited all newly created tables
  - **Auditing Customers:** I verified that all fields in the CUSTOMERS table depended only on the customerid Candidate Key.
  - **Auditing Transactions:** I discovered that retail_price and description depended on the Item name, not the transaction itself --a transitive dependency.
  -  **The Final Fix:** I isolated 126 unique products into a master **ITEMS** table and dropped the redundant columns from Transactions.
  -  **Confirmation:** I confirmed the tables were in **Third Normal Form**.

## 💻 **Code Comparison Examples (The Bridge Strategy)**

### **PostgreSQL**
````
CREATE TABLE TMP AS
SELECT customerid,
      firstname,
      surname,
      shipping_state,
      loyalty_discount
FROM Transactions;
````
### **MS SQL Server**

 ````
SELECT  customerid,
        firstname,
        surname,
        shipping_state,
        loyalty_discount
INTO TMP
FROM Transactions;
````
---
### 🧷 Full Script
To view the complete and detailed SQL code for this project, visit:
[postgresql_redesign_3nf_schema.sql](./postgresql_redesign_3nf_schema.sql) and
[mssql_redesign_3nf_scheme.sql](./mssql_redesign_3nf_schema.sql)




### ✅**Summary of Skills**
  - **Database Design:** 1NF, 2NF, 3NF, Candidate Key Theory
  - **SQL Environments:** PostgreSQL & Microsoft SQL Server.

      

