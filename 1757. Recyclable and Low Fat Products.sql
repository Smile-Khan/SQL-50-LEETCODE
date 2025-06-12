-- 📄 Problem Title: Recyclable and Low Fat Products
-- 🔗 Link: https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Table: Products
-- +-------------+----------+------------+
-- | product_id  | int      |
-- | low_fats    | enum('Y','N') |
-- | recyclable  | enum('Y','N') |
-- +-------------+----------+------------+
-- product_id is the primary key of this table.
-- low_fats is an ENUM where 'Y' means low fat.
-- recyclable is an ENUM where 'Y' means recyclable.

-- Write a solution to find the IDs of products that are both low fat and recyclable.
-- Return the result table in any order.

-- 🧪 Example:
-- Input:
-- +-------------+----------+------------+
-- | product_id  | low_fats | recyclable |
-- +-------------+----------+------------+
-- | 0           | Y        | N          |
-- | 1           | Y        | Y          |
-- | 2           | N        | Y          |
-- | 3           | Y        | Y          |
-- | 4           | N        | N          |
-- +-------------+----------+------------+

-- Output:
-- +-------------+
-- | product_id  |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+

-- ✅ SQL Solution:

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y';
