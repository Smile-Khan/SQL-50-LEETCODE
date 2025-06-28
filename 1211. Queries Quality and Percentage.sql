-- 📄 Problem Title: 1211. Queries Quality and Percentage
-- 🔗 Link: https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Queries
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table may contain duplicate rows.
-- `position` ranges from 1 to 500, and `rating` from 1 to 5.
-- A query is considered poor if its rating is less than 3.

-- 🏁 Task:
-- Write a query to return the following metrics for each query_name:
-- 1. Quality = Average of (rating / position)
-- 2. Poor Query Percentage = (Number of queries with rating < 3) * 100 / Total queries
-- Round both values to 2 decimal places.

-- ✅ SQL Solution:
SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM
    Queries
GROUP BY
    query_name;
