-- 📄 Problem Title: 1789. Primary Department for Each Employee
-- 🔗 Link: https://leetcode.com/problems/primary-department-for-each-employee/

-- 🧩 Problem Description:
-- Table: Employee

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | employee_id   | int     |
-- | department_id | int     |
-- | primary_flag  | varchar |
-- +---------------+---------+
-- (employee_id, department_id) is the primary key.
-- An employee can belong to multiple departments.
-- If they belong to only one, the `primary_flag` is 'N'.
-- Otherwise, 'Y' marks the primary department.

-- 🏁 Task:
-- Write a SQL query to return each employee's primary department.
-- If the employee has only one department, return that one.

-- ✅ SQL Solution:
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'
    OR employee_id IN (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
    );
