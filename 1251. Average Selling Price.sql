-- 📄 Problem Title: 1251. Average Selling Price
-- 🔗 Link: https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Prices
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | start_date    | date    |
-- | end_date      | date    |
-- | price         | int     |
-- +---------------+---------+
-- (product_id, start_date, end_date) is the primary key.
-- Each row indicates the price of a product during a given date range.
-- No overlapping periods exist for the same product_id.

-- Table: UnitsSold
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | purchase_date | date    |
-- | units         | int     |
-- +---------------+---------+
-- Each row represents a sale of units on a specific date for a product.
-- Duplicate rows are possible.

-- 🏁 Task:
-- Find the average selling price for each product.
-- - Round the result to 2 decimal places.
-- - If a product has no sales, return 0 as its average price.
-- Return the result in any order.

-- ✅ SQL Solution:
SELECT
    p.product_id,
    ROUND(
        IFNULL(SUM(p.price * u.units) / SUM(u.units), 0)
    , 2) AS average_price
FROM
    Prices p
LEFT JOIN
    UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
