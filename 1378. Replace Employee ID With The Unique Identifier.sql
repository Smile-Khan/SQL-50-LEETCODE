-- 📄 Problem Title: 1378. Replace Employee ID With The Unique Identifier
-- 🔗 Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

-- 🧩 Description:
-- You're given two tables:
--
-- Table: Employees
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | PK | varchar  |
-- +----+----------+
--
-- Table: EmployeeUNI
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | PK | int       |
-- +----+-----------+
--
-- The `Employees` table contains employee records.
-- The `EmployeeUNI` table maps employee `id`s to their `unique_id`s.
--
-- 🔍 Objective:
-- Write a SQL query to show the `unique_id` of each employee.
-- If an employee does not have a corresponding `unique_id`, display `null` for that field.

-- 💡 Example:
-- Input:
-- Employees:
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
--
-- EmployeeUNI:
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
--
-- Output:
-- +-----------+----------+
-- | unique_id | name     |
-- +-----------+----------+
-- | null      | Alice    |
-- | null      | Bob      |
-- | 2         | Meir     |
-- | 3         | Winston  |
-- | 1         | Jonathan |

-- ✅ SQL Solution:
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
  ON e.id = eu.id;
