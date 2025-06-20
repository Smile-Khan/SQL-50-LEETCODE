-- 📄 Problem Title: 577. Employee Bonus
-- 🔗 Link: https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Employee
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
-- empId is the primary key.

-- Table: Bonus
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
-- empId is the primary key and foreign key to Employee.empId.

-- 💼 Task:
-- Return the name and bonus amount of each employee who:
--   - has a bonus less than 1000, or
--   - does not appear in the Bonus table (bonus is NULL).

-- ✅ SQL Solution:
SELECT
    e.name,
    b.bonus
FROM
    Employee e
LEFT JOIN
    Bonus b ON e.empId = b.empId
WHERE
    b.bonus < 1000 OR b.bonus IS NULL;
