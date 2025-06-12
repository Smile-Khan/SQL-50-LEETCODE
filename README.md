# 📊 LeetCode SQL 50 Solutions

This repository contains my solutions to the **LeetCode Top 50 SQL Questions** — a curated list of essential SQL problems to build and strengthen your database querying skills.

## ✅ What's Included

- 🧠 Clear and optimized SQL solutions
- ✍️ Explanations for tricky queries
- 📈 Covers topics like `JOIN`, `GROUP BY`, `HAVING`, subqueries, window functions, and more
- 💼 Useful for interviews, practice, and revision

## 📚 Topics Covered

- Basic SQL Queries
- Aggregation & Grouping
- JOIN operations
- Subqueries & CTEs
- Window Functions
- Advanced filtering & sorting

## 🧩 Example Problem Structure

```sql
-- Problem: Find customers who never order anything
SELECT name
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);
