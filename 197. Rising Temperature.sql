-- 📄 Problem Title: 197. Rising Temperature
-- 🔗 Link: https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Weather

   +---------------+---------+
   | Column Name   | Type    |
   +---------------+---------+
   | id            | int     |
   | recordDate    | date    |
   | temperature   | int     |
   +---------------+---------+
   id is the primary key (column with unique values) for this table.
   recordDate is unique (no duplicate dates).
   This table contains information about the temperature on each day.

-- Task:
-- Write a solution to find all date `id`s with higher temperatures compared to the previous day.

-- Return the result table in any order.

-- Example 1:

-- Input:
-- Weather table:
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+

-- Output:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+

-- Explanation:
-- On 2015-01-02, temperature rose from 10 to 25.
-- On 2015-01-04, temperature rose from 20 to 30.

-- ✅ SQL Solution:
# Write your MySQL query statement below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
