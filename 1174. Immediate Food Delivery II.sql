-- 📄 Problem Title: 1174. Immediate Food Delivery II
-- 🔗 Link: https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Delivery
-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id is the unique identifier for each delivery.
-- Each row holds a food order with its customer ID, order date, and preferred delivery date.
-- An "immediate" order is one where order_date = customer_pref_delivery_date.
-- The first order per customer is determined by the earliest order_date.
-- The task is to find the percentage of customers whose **first order** was an immediate one.

-- 🏁 Task:
-- Calculate the percentage of customers whose **first order** was immediate (order_date = preferred delivery date).
-- Round the result to 2 decimal places and name the column `immediate_percentage`.

-- ✅ SQL Solution:
SELECT
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
    2) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date) IN (
        SELECT
            customer_id,
            MIN(order_date) AS first_order_date
        FROM
            Delivery
        GROUP BY
            customer_id
    );
