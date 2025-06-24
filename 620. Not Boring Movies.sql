-- 📄 Problem Title: 620. Not Boring Movies
-- 🔗 Link: https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50

-- 🧩 Problem Description:
-- Given a table `Cinema` with movie details including `id`, `movie`, `description`, and `rating`:
-- - Return only those movies which:
--   - Have an **odd-numbered ID**
--   - Have a `description` that is **not** equal to "boring"
-- - The result should be sorted in descending order of `rating`.

-- 🧪 Example Output:
-- +----+------------+-------------+--------+
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 5  | House card | Interesting | 9.1    |
-- | 1  | War        | great 3D    | 8.9    |
-- +----+------------+-------------+--------+

-- ✅ SQL Solution:
SELECT
    id,
    movie,
    description,
    rating
FROM
    Cinema
WHERE
    MOD(id, 2) = 1
    AND description != 'boring'
ORDER BY
    rating DESC;
