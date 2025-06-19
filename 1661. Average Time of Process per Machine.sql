-- 📄 Problem Title: 1661. Average Time of Process per Machine
-- 🔗 Link: https://leetcode.com/problems/average-time-of-process-per-machine/

-- 🧩 Problem Description:
-- Table: Activity
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | machine_id   | int     |
-- | process_id   | int     |
-- | activity_type| enum    |  -- values: 'start', 'end'
-- | timestamp    | float   |
-- +--------------+---------+
-- (machine_id, process_id, activity_type) is the primary key.
-- For every (machine_id, process_id) pair there is exactly one 'start' and one 'end',
-- and the 'start' timestamp is always < the 'end' timestamp.

-- 🧾 Task:
-- For each machine, compute the average processing time:
--   processing_time = average( end_timestamp - start_timestamp )
-- Round the result to 3 decimal places. Return any order.

-- 🧪 Example:
-- Input tables shown in the statement produce:
-- +------------+-----------------+
-- | machine_id | processing_time |
-- +------------+-----------------+
-- | 0          | 0.894           |
-- | 1          | 0.995           |
-- | 2          | 1.456           |
-- +------------+-----------------+

-- ✅ SQL Solution:
WITH duration_per_process AS (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) -
        MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS duration
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT
    machine_id,
    ROUND(AVG(duration), 3) AS processing_time
FROM duration_per_process
GROUP BY machine_id;
