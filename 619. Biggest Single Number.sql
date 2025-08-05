-- 📄 Problem Title: 619. Biggest Single Number
-- 🔗 Link: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: MyNumbers
--
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
--
-- This table may contain duplicates.
-- Each row contains an integer.
--
-- A single number is a number that appeared only once in the MyNumbers table.
--
-- 🏁 Task:
-- Find the largest single number.
-- If there is no single number, report null.

-- Example 1:
-- Input:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output:
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- Explanation:
-- Single numbers are 1, 4, 5, and 6. Largest = 6.

-- Example 2:
-- Input:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- Output:
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- Explanation:
-- No single numbers, so return null.

-- ✅ Approach:
-- 1. Group by `num` to count occurrences.
-- 2. Keep only numbers with COUNT = 1.
-- 3. Pick the maximum among them using MAX().
-- 4. If none exist, return null.

-- ✅ SQL Solution:
SELECT
    MAX(num) AS num
FROM (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING
        COUNT(*) = 1
) AS singles;
