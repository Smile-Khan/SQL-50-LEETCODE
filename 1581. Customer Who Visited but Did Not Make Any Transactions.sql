-- 📄 Problem Title: 1581. Customer Who Visited but Did Not Make Any Transactions
-- 🔗 Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Visits

-- +-------------+------------+
-- | Column Name | Type       |
-- +-------------+------------+
-- | visit_id    | int        |
-- | customer_id | int        |
-- +-------------+------------+
-- visit_id is the primary key for this table.
-- Each row contains a record of a customer visiting the mall.

-- Table: Transactions

-- +----------------+------------+
-- | Column Name    | Type       |
-- +----------------+------------+
-- | transaction_id | int        |
-- | visit_id       | int        |
-- | amount         | int        |
-- +----------------+------------+
-- transaction_id is the primary key for this table.
-- Each row contains a record of a transaction made during a visit.

-- 🧾 Task:
-- Write a SQL query to find all customers who visited the mall but made no transactions during those visits.
-- Return the `customer_id` and the count of such no-transaction visits as `count_no_trans`.
-- Sort order does not matter.

-- 🧪 Example:

-- Input:
-- Visits
-- +----------+-------------+
-- | visit_id | customer_id |
-- +----------+-------------+
-- | 1        | 23          |
-- | 2        | 9           |
-- | 4        | 30          |
-- | 5        | 54          |
-- | 6        | 96          |
-- | 7        | 54          |
-- | 8        | 54          |
-- +----------+-------------+

-- Transactions
-- +----------------+----------+--------+
-- | transaction_id | visit_id | amount |
-- +----------------+----------+--------+
-- | 2              | 5        | 310    |
-- | 3              | 5        | 300    |
-- | 9              | 5        | 200    |
-- | 12             | 1        | 910    |
-- | 13             | 2        | 970    |
-- +----------------+----------+--------+

-- Output:
-- +-------------+----------------+
-- | customer_id | count_no_trans |
-- +-------------+----------------+
-- | 54          | 2              |
-- | 30          | 1              |
-- | 96          | 1              |
-- +-------------+----------------+

-- ✅ SQL Solution:
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
LEFT JOIN
    Transactions t ON v.visit_id = t.visit_id
WHERE
    t.transaction_id IS NULL
GROUP BY
    v.customer_id;
