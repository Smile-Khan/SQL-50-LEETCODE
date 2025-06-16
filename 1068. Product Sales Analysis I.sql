-- 📄 Problem Title: 1068. Product Sales Analysis I
-- 🔗 Link: https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Sales

-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Each row of this table represents a sale of the product_id in a certain year.
-- Note: price is per unit.

-- Table: Product

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row indicates the product name corresponding to a product_id.

-- 🧾 Task:
-- Write a SQL query to display:
-- - product_name
-- - year
-- - price
-- for each sale in the Sales table.

-- Return the result in any order.

-- 🧪 Example:

-- Input:
-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+

-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+

-- Output:
-- +--------------+------+-------+
-- | product_name | year | price |
-- +--------------+------+-------+
-- | Nokia        | 2008 | 5000  |
-- | Nokia        | 2009 | 5000  |
-- | Apple        | 2011 | 9000  |
-- +--------------+------+-------+

-- ✅ SQL Solution:
SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales s
LEFT JOIN
    Product p ON s.product_id = p.product_id;
