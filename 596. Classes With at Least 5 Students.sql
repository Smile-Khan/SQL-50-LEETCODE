-- 📄 Problem Title: 596. Classes With at Least 5 Students
-- 🔗 Link: https://leetcode.com/problems/classes-with-at-least-5-students/

-- 🧩 Problem Description:
-- Table: Courses
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key for this table.
-- Each row indicates the name of a student and the class they are enrolled in.

-- 🏁 Task:
-- Write a SQL query to find all classes that have at least 5 students.
-- Return the result table in any order.

-- ✅ Approach:
-- 1. Group the records by `class`.
-- 2. Use COUNT(DISTINCT student) to count how many students per class.
-- 3. Filter classes with COUNT >= 5 using HAVING.
--
-- This ensures we only return the classes meeting the criteria.

-- ✅ SQL Solution:
SELECT
    class
FROM
    Courses
GROUP BY
    class
HAVING
    COUNT(DISTINCT student) >= 5;
