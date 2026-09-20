
USE amazon_ecommerce;

-- Task 14
-- 14. Identify the top 5 most valuable customers using a composite score that combines three key metrics: (SQL)
-- Total Revenue (50% weight): The total amount of money spent by the customer.
-- Order Frequency (30% weight): The number of orders placed by the customer, indicating their loyalty and engagement.
-- Average Order Value (20% weight): The average value of each order placed by the customer, reflecting the typical transaction size.

SELECT TOP 5
    CustomerID,
    SUM(CAST(SalePrice AS DECIMAL(18,2))) AS Total_Revenue,
    COUNT(OrderID) AS Order_Frequency,
    AVG(CAST(SalePrice AS DECIMAL(18,2))) AS Avg_Order_Value,
    (
        (SUM(CAST(SalePrice AS DECIMAL(18,2))) * 0.5) +
        (COUNT(OrderID) * 0.3) +
        (AVG(CAST(SalePrice AS DECIMAL(18,2))) * 0.2)
    ) AS Composite_Score
FROM Orders_cleaned
GROUP BY CustomerID
ORDER BY Composite_Score DESC;


-- Task 15              
-- Calculate the month-over-month growth rate in total revenue across the entire dataset.

WITH base AS (
    SELECT 
        CAST(SalePrice AS DECIMAL(18,2)) AS SalePrice,
        CONVERT(VARCHAR(7), TRY_CONVERT(DATE, REPLACE(OrderDate, '-', ' '), 6), 120) AS OrderMonth
    FROM Orders_cleaned
),
month_group AS (
    SELECT 
        OrderMonth,
        SUM(SalePrice) AS Total_Revenue
    FROM base
    GROUP BY OrderMonth
),
prev_data AS (
    SELECT *,
        LAG(Total_Revenue) OVER (ORDER BY OrderMonth) AS Previous_Month_Revenue
    FROM month_group
)
SELECT *,
    ROUND(((Total_Revenue - Previous_Month_Revenue) * 100.0) / Previous_Month_Revenue, 2) AS Growth_Rate
FROM prev_data
ORDER BY OrderMonth;

-- Task 16
-- Calculate the rolling 3-month average revenue for each product category.

WITH base AS (
    SELECT 
        ProductCategory,
        CAST(SalePrice AS DECIMAL(18,2)) AS SalePrice,
        CONVERT(VARCHAR(7), TRY_CONVERT(DATE, REPLACE(OrderDate, '-', ' '), 6), 120) AS OrderMonth
    FROM Orders_cleaned
),
category_data AS (
    SELECT    
        ProductCategory,
        OrderMonth,
        SUM(SalePrice) AS Total_Revenue
    FROM base
    GROUP BY ProductCategory, OrderMonth
)
SELECT *,
    ROUND(
        AVG(Total_Revenue) OVER (
            PARTITION BY ProductCategory 
            ORDER BY OrderMonth
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS Rolling_Average_3_Month
FROM category_data
ORDER BY ProductCategory, OrderMonth;

-- Task 17
-- Update the orders table to apply a 15% discount on the `Sale Price` for orders placed by customers who have made at least 10 orders.

WITH customer_list AS (
    SELECT CustomerID
    FROM Orders_cleaned
    GROUP BY CustomerID
    HAVING COUNT(*) >= 10
)
UPDATE Orders_cleaned
SET SalePrice = CAST(CAST(SalePrice AS DECIMAL(18,2)) * 0.85 AS VARCHAR(30))
WHERE CustomerID IN (SELECT CustomerID FROM customer_list);

-- Task 18
-- Calculate the average number of days between consecutive orders for customers who have placed at least five orders.

WITH base AS (
    SELECT 
        CustomerID,
        TRY_CONVERT(DATE, REPLACE(OrderDate, '-', ' '), 6) AS OrderDate
    FROM Orders_cleaned
),
qualify AS (
    SELECT CustomerID
    FROM base
    GROUP BY CustomerID
    HAVING COUNT(*) >= 5
),
Orders_data AS (
    SELECT 
        CustomerID,
        OrderDate,
        DATEDIFF(DAY, LAG(OrderDate) OVER (
            PARTITION BY CustomerID ORDER BY OrderDate
        ), OrderDate) AS day_diff
    FROM base 
    WHERE CustomerID IN (SELECT CustomerID FROM qualify)
),
Average_data AS (
    SELECT 
        CustomerID,
        AVG(day_diff * 1.0) AS avg_diff
    FROM Orders_data
    WHERE day_diff IS NOT NULL
    GROUP BY CustomerID
)
SELECT AVG(avg_diff) AS Average_Days_Between_Orders
FROM Average_data;

-- Task 19
-- Identify customers who have generated revenue that is more than 30% higher than the average revenue per customer.

WITH Customer_data AS (
    SELECT 
        CustomerID,
        SUM(CAST(SalePrice AS DECIMAL(18,2))) AS Total_Revenue
    FROM Orders_cleaned
    GROUP BY CustomerID
)
SELECT *
FROM Customer_data
WHERE Total_Revenue > (
    SELECT AVG(Total_Revenue) * 1.3 FROM Customer_data
)
ORDER BY Total_Revenue DESC;

-- Task 20
-- Determine the top 3 product categories that have shown the highest increase in sales over the past year compared to the previous year

WITH base AS (
    SELECT 
        ProductCategory,
        CAST(SalePrice AS DECIMAL(18,2)) AS SalePrice,
        TRY_CONVERT(DATE, REPLACE(OrderDate, '-', ' '), 6) AS OrderDate
    FROM Orders_cleaned
),
year_sales AS (
    SELECT 
        ProductCategory,
        YEAR(OrderDate) AS Order_Year,
        SUM(SalePrice) AS Total_Sales
    FROM base
    GROUP BY ProductCategory, YEAR(OrderDate)
),
sales_growth AS (
    SELECT *,
        LAG(Total_Sales) OVER (
            PARTITION BY ProductCategory 
            ORDER BY Order_Year
        ) AS Previous_Sales
    FROM year_sales
)
SELECT TOP 3 *,
    (Total_Sales - Previous_Sales) AS Sales_Increase
FROM sales_growth
WHERE Previous_Sales IS NOT NULL
ORDER BY Sales_Increase DESC;