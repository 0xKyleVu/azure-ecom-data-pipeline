SELECT
  CASE
    WHEN Users_socialnbfollowers = 0 THEN '1. Zero'
    WHEN Users_socialnbfollowers BETWEEN 1 AND 10 THEN '2. Low (1-10)'
    WHEN Users_socialnbfollowers BETWEEN 11 AND 100 THEN '3. Mid (11-100)'
    WHEN Users_socialnbfollowers > 100 THEN '4. High (100+)'
  END AS follower_tier,
  COUNT(*) AS users,
  ROUND(AVG(CAST(Users_productsSold AS INT)), 2) AS avg_products_sold,
  ROUND(AVG(CAST(Users_productsWished AS INT)), 2) AS avg_products_wished
FROM ecom_db_kyle.default.gold_ecom_users
GROUP BY 1
ORDER BY follower_tier
