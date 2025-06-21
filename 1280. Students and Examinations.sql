-- 📄 Problem Title: 1280. Students and Examinations
-- 🔗 Link: https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description
-- Tables:
--   Students(student_id PK, student_name)
--   Subjects(subject_name PK)
--   Examinations(student_id, subject_name)   -- may contain duplicates
--
-- For every student‑subject pair, report how many times the student attended
-- that subject’s exam.  Include pairs with zero attendance.
-- Return results ordered by student_id, then subject_name.

-- ✅ SQL Solution
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM
    Students AS s
CROSS JOIN
    Subjects AS sub                          -- generate every student‑subject pair
LEFT JOIN
    Examinations AS e
      ON  e.student_id   = s.student_id
      AND e.subject_name = sub.subject_name  -- match only that exact pair
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;
