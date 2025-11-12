☕ Coffee Sales Analytics – SQL Project
📘 Overview

This project provides SQL-based analytical solutions for a fictional coffee sales dataset.
It answers key business questions related to customer behavior, sales performance, and market segmentation using data from multiple tables — city, products, customers, and sales.

The queries are optimized for PostgreSQL but can be easily adapted to other SQL databases.

🧩 Dataset Structure

The project assumes the presence of the following tables:

Table Name	Description
city	Contains city-level demographic details including city name, rank, and population.
products	Contains product details such as product ID and name.
customers	Contains customer information along with city IDs.
sales	Contains transaction-level data including sale date, product ID, customer ID, and total sale amount.
🧠 Business Questions & SQL Solutions
1️⃣ Coffee Consumers Count

Goal: Estimate how many people in each city consume coffee, assuming 25% of the population drinks coffee.
Output: City name, coffee consumers (in millions), and city rank.

2️⃣ Total Revenue from Coffee Sales (Q4 2023)

Goal: Calculate the total revenue generated from coffee sales during the last quarter of 2023.
Output: Total revenue across all cities and breakdown by city.

3️⃣ Sales Count for Each Product

Goal: Determine how many units (orders) were sold for each coffee product.
Output: Product name and total order count.

4️⃣ Average Sales Amount per City

Goal: Compute the average sales per customer in each city.
Output: City name, total revenue, total unique customers, and average sale per customer.

5️⃣ City Population and Coffee Consumers

Goal: Combine population and estimated coffee consumers with actual active customers per city.
Output: City name, coffee consumers (25% of population), and unique customer count.

6️⃣ Top 3 Selling Products by City

Goal: Identify the top three most sold coffee products in each city based on sales volume.
Output: City name, product name, total orders, and rank.

7️⃣ Customer Segmentation by City

Goal: Count the number of unique customers per city who purchased coffee products.
Output: City name and number of unique customers.

🧮 SQL Features Used

Joins: INNER JOIN, LEFT JOIN

Aggregations: SUM(), COUNT(), ROUND()

Window Functions: DENSE_RANK() for ranking top products per city

CTEs (Common Table Expressions): Used for modular and readable query design

Date Functions: EXTRACT(YEAR FROM ...), EXTRACT(QUARTER FROM ...)

Grouping & Ordering: For summarizing and ranking data

📈 Insights You Can Derive

Which cities have the highest estimated coffee consumption.

Revenue trends across different cities and time periods.

The most popular coffee products by city.

Customer engagement and purchasing power by city.

Potential market penetration compared to estimated coffee drinkers.

⚙️ How to Run

Load the database:

Import all base tables (city, products, customers, sales) into your SQL environment.

Run Solutions.sql:

Execute each query sequentially.

Each query block is commented with its respective question.

View Results:

Analyze the output in your SQL IDE or export it as CSV for visualization.

🧾 File Structure
📂 Coffee-Sales-Analytics/
├── Solutions.sql      # Contains all SQL queries answering business questions
└── README.md          # Documentation file

🧑‍💻 Author

Gaurav Chikane
Data Analyst | SQL Enthusiast | BI Developer
📧 [gauravchikane11@gmail.com
]
🔗 [(www.linkedin.com/in/gaurav-chikane)](https://github.com/Gauravchikane)]
