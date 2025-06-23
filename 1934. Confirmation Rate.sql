-- 📄 Problem Title: 1934. Confirmation Rate
-- 🔗 Link: https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- You are given two tables:
-- 1. Signups: stores the user_id and signup timestamp.
-- 2. Confirmations: stores confirmation events (confirmed or timeout) for those users.

-- The task is to compute the **confirmation rate** per user:
--   - confirmation_rate = confirmed confirmations / total confirmations
--   - If a user has no confirmation entries, their rate is 0.
--   - Round the rate to 2 decimal places.

-- 🧪 Example Output:
-- +---------+-------------------+
-- | user_id | confirmation_rate |
-- +---------+-------------------+
-- | 6       | 0.00              |
-- | 3       | 0.00              |
-- | 7       | 1.00              |
-- | 2       | 0.50              |
-- +---------+-------------------+

-- ✅ SQL Solution:
SELECT
    s.user_id,
    ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM
    Signups s
LEFT JOIN
    Confirmations c
    ON s.user_id = c.user_id
GROUP BY
    s.user_id;
