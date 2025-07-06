-- 📄 Problem Title: 2356. Number of Unique Subjects Taught by Each Teacher
-- 🔗 Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Teacher

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
-- (subject_id, dept_id) is the primary key.
-- Each row indicates that the teacher with teacher_id teaches subject_id in dept_id.
-- A subject taught in multiple departments should only be counted once per teacher.

-- 🏁 Task:
-- Write a SQL query to count the number of **unique subjects** each teacher teaches.
-- Return the result as: teacher_id, cnt

-- ✅ SQL Solution:
SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM
    Teacher
GROUP BY
    teacher_id;
