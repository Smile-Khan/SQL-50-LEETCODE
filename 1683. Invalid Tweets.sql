## 📄 Problem: [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50)

### 🧩 Description:

You're given a table named **`Tweets`** that stores all the tweets in a social media application.

#### Table: `Tweets`

| Column Name | Type    |
|-------------|---------|
| tweet_id    | int     |
| content     | varchar |

- `tweet_id` is the **primary key**.
- `content` contains only **alphanumeric characters**, `'!'`, and **spaces**.
- A **tweet is considered invalid** if its `content` length is **strictly greater than 15 characters**.

---

### 🎯 Objective:
Write an SQL query to **retrieve the IDs of invalid tweets** (where `LENGTH(content) > 15`).
Return the result in any order.

---

### 📌 Example:

**Input:**

| tweet_id | content                           |
|----------|------------------------------------|
| 1        | Let us Code                        |
| 2        | More than fifteen chars are here!  |

**Output:**

| tweet_id |
|----------|
| 2        |

**Explanation:**
- Tweet ID 1 has 11 characters → ✅ Valid
- Tweet ID 2 has 33 characters → ❌ Invalid

---

### ✅ SQL Solution:

```sql
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
