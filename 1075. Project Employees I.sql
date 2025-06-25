-- 📄 Problem Title: 1075. Project Employees I
-- 🔗 Link: https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Project
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key.
-- employee_id is a foreign key referencing Employee.
-- Each row indicates an employee working on a project.

-- Table: Employee
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key.
-- experience_years is guaranteed NOT NULL.

-- 🏁 Task:
-- Write an SQL query to report the average experience years of all employees per project,
-- rounded to 2 decimal places.
-- Return the result table in any order.

-- ✅ SQL Solution:
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM
    Project p
JOIN
    Employee e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;
