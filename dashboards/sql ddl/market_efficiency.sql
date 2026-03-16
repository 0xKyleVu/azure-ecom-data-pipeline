SELECT
  Country,
  COUNT(*) AS users,
  MAX(Buyers_Total) AS buyers,
  MAX(Countries_Sellers) AS sellers,
  ROUND(MAX(Buyers_Total) * 1.0 / NULLIF(MAX(Countries_Sellers), 0), 2) AS buyer_seller_ratio,
  ROUND(SUM(CASE WHEN Users_hasanyapp THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS app_pct,
  ROUND(AVG(CAST(Users_productsSold AS INT)), 2) AS avg_sold
FROM ecom_db_kyle.default.gold_ecom_users
WHERE Countries_Sellers IS NOT NULL AND Buyers_Total IS NOT NULL
GROUP BY Country
ORDER BY users DESC
