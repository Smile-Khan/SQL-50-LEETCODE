-- 📄 Problem Title: 550. Game Play Analysis IV
-- 🔗 Link: https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key.
-- This table logs player activity on specific dates, showing how many games were played.
-- The goal is to calculate the fraction of players who returned **exactly one day** after their first login.

-- 🏁 Task:
-- Calculate the number of players who logged in **on the day after** their first login.
-- Divide that number by the **total number of players**.
-- Return the result rounded to 2 decimal places in a column named `fraction`.

-- ✅ SQL Solution:
SELECT
    ROUND(COUNT(DISTINCT a.player_id) / COUNT(DISTINCT b.player_id), 2) AS fraction
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_login
        FROM
            Activity
        GROUP BY
            player_id
    ) b
LEFT JOIN
    Activity a
    ON b.player_id = a.player_id
    AND a.event_date = DATE_ADD(b.first_login, INTERVAL 1 DAY);
