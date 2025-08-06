-- 📄 Problem Title: 1045. Customers Who Bought All Products
-- 🔗 Link: https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Customer
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+
-- This table may contain duplicate rows.
-- customer_id is not NULL.
-- product_key is a foreign key to Product table.

-- Table: Product
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+
-- product_key is the primary key.

-- 🏁 Task:
-- Find the customer IDs who bought ALL products listed in the Product table.
-- Return the result table in any order.

-- Example:
-- Customer table:
-- +-------------+-------------+
-- | customer_id | product_key |
-- +-------------+-------------+
-- | 1           | 5           |
-- | 2           | 6           |
-- | 3           | 5           |
-- | 3           | 6           |
-- | 1           | 6           |
-- +-------------+-------------+
--
-- Product table:
-- +-------------+
-- | product_key |
-- +-------------+
-- | 5           |
-- | 6           |
-- +-------------+
--
-- Output:
-- +-------------+
-- | customer_id |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+

-- ✅ Approach:
-- 1. Find how many unique products exist (COUNT in Product).
-- 2. For each customer, count DISTINCT products they purchased.
-- 3. If their count equals total product count, include them.

-- ✅ SQL Solution:
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
