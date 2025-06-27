-- 📄 Problem Title: 1633. Percentage of Users Attended a Contest
-- 🔗 Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Users
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | user_name   | varchar |
-- +-------------+---------+
-- user_id is the primary key for this table.
-- Each row contains a user's ID and name.

-- Table: Register
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | contest_id  | int     |
-- | user_id     | int     |
-- +-------------+---------+
-- (contest_id, user_id) is the primary key.
-- Each row records a user's registration for a contest.

-- 🏁 Task:
-- Write a query to compute the percentage of users who registered for each contest.
-- Round the percentage to two decimal places.
-- Order the result by percentage in descending order. In case of tie, order by contest_id in ascending order.

-- ✅ SQL Solution:
SELECT
    contest_id,
    ROUND(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM
    Register
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;
