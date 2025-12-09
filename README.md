### Date created
Date project was created: 7-27-2025  
Date README file was last updated: 12-9-2025  

### Project Title
Walmart Customer Purchases Analysis

### Description
This project analyzes a synthetic customer purchase dataset modeled after Walmart retail transactions. Using SQL, the project explores buyer behavior, spending patterns, demographic trends, and category-level performance. The dataset is fully fictional and created for analytical practice.

This project reinforced practical skills in SQL data analysis, aggregation, filtering, grouping, and deriving insights from transactional data.

The project involved:

* Creating and importing a customer purchases table into PostgreSQL.
* Analyzing spending totals, category trends, and city-level purchasing behavior.
* Comparing buying habits across gender, age groups, and repeat vs. new customers.
* Assessing discount usage, customer ratings, and their impact on spending.
* Producing clean, well-structured SQL queries suitable for showcasing analytical ability.

### Key Findings

* **Category revenue (Query 1):** Electronics had the highest total revenue (~$2.92M), followed closely by Home, Beauty, and Clothing.  
* **Sub-category averages (Query 2):** Unit price and cost vary widely across products; margins are small in some low-cost items but higher for more expensive sub-categories.  
* **Total male customers in Electronics (Query 3):** 4,284 males made purchases in the Electronics category.  
* **Average spending by age and sub-category (Query 4):** Average spending per transaction is around $250, with some peaks over $260 for ages 34, 41, and 48.  
* **High-activity cities (Query 5):** 23 cities had more than 10 purchases from customers aged 20–34, highlighting regions with strong young-adult engagement.  
* **Most profitable cities per year (Query 6):** Top revenue-generating cities include North Michael and multiple Electronics-heavy cities such as East Michael, West Christopher, and New Michael.  
* **Average female spending by age (Query 7):** Peak average spending occurs around ages 20–56, with the highest at $272.13.  
* **Unit cost statistics by gender and category (Query 8):** Costs are fairly consistent; for example, female and male customers both show high costs around $5 and average costs around $3 across categories.  
* **Age distribution by category (Query 9):** Customers range from 18–60 across all categories, with average ages around 39, reflecting a broad adult demographic.  
* **Most common payment method (Query 10):** Debit Card is the most frequently used payment method, with 12,589 transactions.

### Files used
**Walmart_customer_purchases.csv** — A synthetic retail dataset containing customer purchase transactions.  
**walmart_customer_analysis.sql** — SQL script including table creation, data import, and 10 analytic queries.

### Requirements
* PostgreSQL or any SQL system supporting standard ANSI SQL  
* Optional: pgAdmin, Azure Data Studio, or Visual Studio Code with a SQL extension for running queries  
