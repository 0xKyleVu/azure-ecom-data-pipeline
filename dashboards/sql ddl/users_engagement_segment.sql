SELECT
  CASE
    WHEN CAST(Users_productsSold AS INT) = 0 THEN '1. Inactive (0 sold)'
    WHEN CAST(Users_productsSold AS INT) BETWEEN 1 AND 5 THEN '2. Light Seller (1-5)'
    WHEN CAST(Users_productsSold AS INT) BETWEEN 6 AND 20 THEN '3. Moderate (6-20)'
    WHEN CAST(Users_productsSold AS INT) > 20 THEN '4. Power Seller (20+)'
  END AS segment,
  COUNT(*) AS user_count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ecom_db_kyle.default.gold_ecom_users), 1) AS pct
FROM ecom_db_kyle.default.gold_ecom_users
GROUP BY 1
ORDER BY segment
