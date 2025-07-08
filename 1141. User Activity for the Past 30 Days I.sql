-- 📄 Problem Title: 1141. User Activity for the Past 30 Days I
-- 🔗 Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Activity

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | session_id    | int     |
-- | activity_date | date    |
-- | activity_type | enum    |
-- +---------------+---------+
-- activity_type is one of: ('open_session', 'end_session', 'scroll_down', 'send_message')
-- Each row shows a user's activity on a social media website.
-- Each session belongs to exactly one user.

-- 🏁 Task:
-- Find the number of **distinct users** active on each day within the last 30 days ending **2019-07-27**.
-- A user is considered active if they had **any** activity on a given day.
-- Return the result with columns: `day` (date), `active_users` (int)

-- ✅ SQL Solution:
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY
    activity_date
ORDER BY
    activity_date;
