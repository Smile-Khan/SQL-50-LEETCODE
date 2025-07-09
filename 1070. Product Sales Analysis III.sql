-- 📄 Problem Title: 1070. Product Sales Analysis III
-- 🔗 Link: https://leetcode.com/problems/product-sales-analysis-iii/

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
-- (sale_id, year) is the primary key.
-- Each row is a record of a product sale in a specific year.
-- A product can have multiple sales in a year.

-- 🏁 Task:
-- Return all sales entries that occurred in the **first year** each product was sold.
-- Output columns: product_id, first_year, quantity, price

-- ✅ Approach:
-- 1. Use a subquery to get the **first year** (MIN(year)) for each product.
-- 2. Join this subquery back with the original Sales table to get all rows that match the product and that first year.
-- 3. Select the required columns: product_id, first_year, quantity, price.

-- ✅ SQL Solution:
SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM
    Sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
) AS first_sales
    ON s.product_id = first_sales.product_id
    AND s.year = first_sales.first_year;
