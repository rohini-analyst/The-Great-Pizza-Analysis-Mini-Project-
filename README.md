# The-Great-Pizza-Analysis-Mini-Project-
🍕 The Great Pizza Analytics Challenge – SQL Project
📌 Project Overview

This project is part of The Great Pizza Analytics Challenge, where I worked as a Data Analyst for IDC Pizza to analyze pizza sales data using MySQL.

The objective of the project was to transform raw pizza sales data into meaningful insights by applying SQL concepts such as data inspection, filtering, aggregations, and joins.

🗄️ Database Setup
Tables Created

orders

order_details

pizza_types

pizzas

Table Relationships

pizzas table contains a foreign key pizza_type_id referencing pizza_types.

order_details table contains two foreign keys:

order_id referencing orders

pizza_id referencing pizzas

This relational structure simulates a real-world sales database.

📥 Data Loading

After creating the database schema, the dataset was inserted into the tables to prepare the database for analysis.

🔍 Data Inspection

Initial inspection was performed to understand the dataset and check data quality.

Key checks included:

Identifying unique pizza categories

Total categories found: 4

Checking for missing ingredient data

Missing values were replaced using "Missing Data" where necessary

Result: No pizzas had missing ingredient data

Verifying missing pizza prices

Result: All pizzas had valid prices

🔎 Filtering & Data Exploration

Various SQL filtering techniques were used to explore the dataset and answer business questions:

Orders placed on a specific date

Pizzas sold in specific sizes

Pizzas within a price range

Pizzas containing specific keywords

Orders placed after a specific time

📊 Sales Performance Analysis

Using SQL aggregations and joins, the following analyses were performed:

Total quantity of pizzas sold

Average pizza price

Total order value per order

Total quantity sold per pizza category

Categories with more than 5000 pizzas sold

Pizzas that were never ordered

Price differences between sizes of the same pizza

🧠 SQL Concepts Used

Database creation

Table relationships & foreign keys

Data inspection

Data cleaning

WHERE, IN, BETWEEN, LIKE

Aggregations (SUM, AVG, COUNT)

GROUP BY and HAVING

INNER JOIN, LEFT JOIN

SELF JOIN

🛠️ Tools Used

MySQL

MySQL Workbench

SQL

🚀 Key Learning Outcomes

Working with real-world structured datasets

Designing relational database structures

Writing analytical SQL queries

Performing business-focused data analysis

Converting raw data into actionable insights

If you want, I can also help you add 3 more things that make GitHub projects look very professional:

1️⃣ Project folder structure
2️⃣ SQL query examples section
3️⃣ Dataset explanation section

These make your GitHub look like a real Data Analyst portfolio project.

Is this conversation helpful
