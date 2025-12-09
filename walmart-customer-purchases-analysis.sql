-- =====================================================================
-- Walmart Customer Purchase Analysis
-- Author: Gerardo Najarro
-- Created: 7-27-2025
-- Description:
--     This SQL script creates a table, imports Walmart customer purchase
--     data, and runs a set of analytical queries exploring spending 
--     patterns, customer behavior, and product trends.
-- =====================================================================


-- ==========================================================
-- 1. CREATE TABLE
--    Schema for Walmart_customer_purchases.csv
-- ==========================================================

DROP TABLE IF EXISTS walmart_purchases;

CREATE TABLE walmart_purchases (
    Customer_ID        VARCHAR(40),
    Age                INT,
    Gender             VARCHAR(20),
    City               VARCHAR(40),
    Category           VARCHAR(40),
    Product_Name       VARCHAR(100),
    Purchase_Date      DATE,
    Purchase_Amount    NUMERIC(10,2),
    Payment_Method     VARCHAR(40),
    Discount_Applied   VARCHAR(10),
    Rating             INT,
    Repeat_Customer    VARCHAR(10)
);

-- ==========================================================
-- 2. IMPORT CSV
--    IMPORTANT: Update the file path below.
--    Example file path:
--    '/Users/yourname/Documents/Walmart_customer_purchases.csv'
-- ==========================================================

COPY walmart_purchases
FROM 'C:\temp\Walmart_customer_purchases.csv'
DELIMITER ','
CSV HEADER;



-- =====================================================================
-- 3. QUERIES
--    Each section includes a short explanation of purpose.
-- =====================================================================

-- ----------------------------------------------------------
-- Query 1
-- Total revenue per category for 2024
-- Rationale: Understand which product groups generate most spending.
-- ----------------------------------------------------------
SELECT 
    Category,
    SUM(Purchase_Amount) AS total_revenue
FROM walmart_purchases
WHERE EXTRACT(YEAR FROM Purchase_Date) = 2024
GROUP BY Category
ORDER BY Category;



-- ----------------------------------------------------------
-- Query 2
-- Average purchase amount, discount rate, and average rating per city
-- Rationale: Compare customer spending behavior and satisfaction by location.
-- ----------------------------------------------------------
SELECT
    City,
    ROUND(AVG(Purchase_Amount), 2) AS avg_spending,
    ROUND(AVG(CASE WHEN Discount_Applied = 'Yes' THEN 1 ELSE 0 END), 2) AS discount_rate,
    ROUND(AVG(Rating), 2) AS avg_rating
FROM walmart_purchases
GROUP BY City
ORDER BY City;



-- ----------------------------------------------------------
-- Query 3
-- Total male customers who purchased Electronics
-- Rationale: Analyze gender-specific engagement with electronics.
-- ----------------------------------------------------------
SELECT 
    COUNT(*) AS total_male_electronics_buyers
FROM walmart_purchases
WHERE Gender = 'Male'
  AND Category = 'Electronics';



-- ----------------------------------------------------------
-- Query 4
-- Average amount spent by customers of each age group
-- Rationale: Identify age groups with the highest spending power.
-- ----------------------------------------------------------
SELECT 
    Age,
    ROUND(AVG(Purchase_Amount), 2) AS avg_spent
FROM walmart_purchases
GROUP BY Age
ORDER BY Age DESC;



-- ----------------------------------------------------------
-- Query 5
-- Cities with more than 10 purchases from customers aged 20–34
-- Rationale: Pinpoint locations with high young-adult engagement.
-- ----------------------------------------------------------
SELECT
    City
FROM walmart_purchases
WHERE Age BETWEEN 20 AND 34
GROUP BY City
HAVING COUNT(*) > 10
ORDER BY City;



-- ----------------------------------------------------------
-- Query 6
-- Most profitable city–category combinations
-- Profit = revenue - discount_effect (basic profitability proxy)
-- Rationale: Identify where product categories perform best geographically.
-- ----------------------------------------------------------
SELECT 
    City,
    Category,
    SUM(Purchase_Amount) AS total_revenue,
    SUM(CASE WHEN Discount_Applied = 'Yes' THEN Purchase_Amount * 0.10 ELSE 0 END) AS est_discount_cost,
    SUM(Purchase_Amount) - 
      SUM(CASE WHEN Discount_Applied = 'Yes' THEN Purchase_Amount * 0.10 ELSE 0 END) AS estimated_profit
FROM walmart_purchases
GROUP BY City, Category
HAVING SUM(Purchase_Amount) > 0
ORDER BY estimated_profit DESC;



-- ----------------------------------------------------------
-- Query 7
-- Average spending per age for FEMALE customers
-- Rationale: Similar to the original assignment but gender swapped.
-- ----------------------------------------------------------
SELECT 
    Age,
    ROUND(AVG(Purchase_Amount), 2) AS avg_spending
FROM walmart_purchases
WHERE Gender = 'Female'
GROUP BY Age
ORDER BY avg_spending DESC;



-- ----------------------------------------------------------
-- Query 8
-- Highest, lowest, and average rating by category and gender
-- Rationale: Compare satisfaction patterns across demographics.
-- ----------------------------------------------------------
SELECT 
    Gender,
    Category,
    MAX(Rating) AS highest_rating,
    MIN(Rating) AS lowest_rating,
    ROUND(AVG(Rating), 2) AS avg_rating
FROM walmart_purchases
GROUP BY Gender, Category
ORDER BY Gender, Category;



-- ----------------------------------------------------------
-- Query 9
-- Age distribution (Youngest, Oldest, Avg Age) by Category and City
-- For purchases in 2024
-- Rationale: Understand demographic variation in product interest.
-- ----------------------------------------------------------
SELECT 
    Category,
    MIN(Age) AS youngest_customer,
    MAX(Age) AS oldest_customer,
    ROUND(AVG(Age), 1) AS avg_customer_age
FROM walmart_purchases
WHERE EXTRACT(YEAR FROM Purchase_Date) = 2024
GROUP BY Category
ORDER BY avg_customer_age;



-- ----------------------------------------------------------
-- Query 10
-- Most frequently used payment method overall
-- Rationale: Identify dominant customer payment preferences.
-- ----------------------------------------------------------
SELECT 
    Payment_Method,
    COUNT(*) AS usage_count
FROM walmart_purchases
GROUP BY Payment_Method
ORDER BY usage_count DESC
LIMIT 1;
