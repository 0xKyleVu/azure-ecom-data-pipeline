SELECT
  COUNT(*) AS total_users,
  ROUND(AVG(CAST(Users_productsWished AS INT)), 2) AS avg_wished,
  ROUND(AVG(CAST(Users_productsSold AS INT)), 2) AS avg_sold,
  ROUND(AVG(CAST(Users_productsSold AS INT)) / NULLIF(AVG(CAST(Users_productsWished AS INT)), 0) * 100, 1) AS wish_to_sale_pct,
  SUM(CASE WHEN CAST(Users_productsSold AS INT) > 0 THEN 1 ELSE 0 END) AS active_sellers,
  ROUND(SUM(CASE WHEN CAST(Users_productsSold AS INT) > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS active_seller_pct,
  ROUND(AVG(Users_socialnbfollowers), 1) AS avg_followers
FROM ecom_db_kyle.default.gold_ecom_users
