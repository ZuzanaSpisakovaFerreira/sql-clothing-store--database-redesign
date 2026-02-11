# 🚀 sql-clothing-store-database-redesign

## **Project Overview**
Ths project shows how I audites a "flat" database for an online store and refactored it into a professional, relational schema. I handled the full mormalization process and verified the results in both **PostgreSQL** and **MS SQL Server**.

## 🔍 **Step 1: 1NF Investigation (The Audit)**
I started with 3455 rows of a raw transaction data.
  - **The Process:** I ran a SELECT COUNT(*) and compared it to SELECT DISTINCT* to check for duplicates.
  - **The Results:** Both counts matched exactly at 3455, meaning there were no duplicate rows.
  - **Confirmation:** I confirmed the table was in **First Normal Form** --every cell was atomic and unique identifier was present.

## 🛠️ **Step 2: 2NF Candidate Keys & Table Refactoring**
I focused on removing partial dependencies by identifying the correct **Candidate Keys**
  - **The Logic:** I identified two Candidate Keys, (transactionsid) and  a **Composite Candidate KEy** (timestamp + customerid).
  - **THe TMP Table Bridge:** I created a temporary table (TMP) to isolate customer-specific columns like firstname, surname, shopping_state, and loyalty_discount.
  - **Creating the Entity:** I extracted 942 unique users into a new permanente **CUSTOMERS** table.
  - **Final Cleanup:** I used ALTER TABLE to **DROP** the reduntant columns from Transactions table and then **DROPPED** the TMP table to keep the database clean.
  - **Confirmation:** I confirmed the tables were in **Second Normal Form**


