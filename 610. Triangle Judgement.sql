-- 📄 Problem Title: 610. Triangle Judgement
-- 🔗 Link: https://leetcode.com/problems/triangle-judgement/

-- 🧩 Problem Description:
-- Table: Triangle
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- (x, y, z) is the primary key column for this table.
-- Each row contains the lengths of three line segments.
--
-- 🏁 Task:
-- Report for every three line segments whether they can form a triangle.
-- A triangle is valid if:
--   x + y > z
--   AND y + z > x
--   AND x + z > y
--
-- Return the result table in any order.

-- ✅ SQL Solution:
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
