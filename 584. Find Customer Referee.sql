-- 📄 Problem Title: 584. Find Customer Referee
-- 🔗 Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

-- 🧩 Problem Description:
-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key of this table.
-- Each row indicates an employee's name, department, and manager's id.
-- If managerId is null, then that employee has no manager.
-- No employee manages themself.

-- 🏁 Task:
-- Write a SQL query to find the names of managers who have at least five direct reports.
-- Return the result in any order.

-- ✅ SQL Solution:
SELECT
    e1.name
FROM
    Employee e1
JOIN
    Employee e2
    ON e1.id = e2.managerId
GROUP BY
    e1.id, e1.name
HAVING
    COUNT(e2.id) >= 5;
