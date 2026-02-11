# 🚀 sql-clothing-store-database-redesign

## **Project Overview**
Ths project shows how I audites a "flat" database for an online store and refactored it into a professional, relational schema. I handled the full mormalization process and verified the results in both **PostgreSQL** and **MS SQL Server**.

## 🔍 **Step 1: 1NF Investigation (The Audit)**
I started with 3455 rows of a raw transaction data.
  - **The Process:** I ran a SELECT COUNT(*) and compared it to SELECT DISTINCT* to check for duplicates.
  - **The Results:** Both counts matched exactly at 3455, meaning there were no duplicate rows.
  - **Confirmation:** I confirmed the table was in **First Normal Form** --every cell was atomic and unique identifier was present. 


