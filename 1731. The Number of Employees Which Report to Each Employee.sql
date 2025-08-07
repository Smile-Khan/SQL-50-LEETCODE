-- 1731. The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
--
-- Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50
--
-- Schema:
-- Table: Employees
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+
-- employee_id is the primary key for this table.
-- reports_to is a foreign key referring to employee_id.
--
-- A manager is an employee who has at least one direct report.
--
-- Task:
-- Return a table with the following columns:
-- - employee_id (manager)
-- - name (manager's name)
-- - reports_count (number of employees directly reporting to them)
-- - average_age (rounded average age of the direct reports)
--
-- Return result ordered by employee_id

-- ✅ Solution:

SELECT
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r
    ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
