-- 📄 Problem Title: 1193. Monthly Transactions I
-- 🔗 Link: https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Transactions
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- `state` is an ENUM with values: ['approved', 'declined'].
-- Each row indicates an incoming transaction and contains details such as country, amount, date, and transaction state.

-- 🏁 Task:
-- Write a query to return the following data for each month and country:
-- 1. Month (YYYY-MM format)
-- 2. Country
-- 3. Number of total transactions
-- 4. Number of approved transactions
-- 5. Total transaction amount
-- 6. Total amount of approved transactions

-- ✅ SQL Solution:
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month, country
ORDER BY
    month, country;
