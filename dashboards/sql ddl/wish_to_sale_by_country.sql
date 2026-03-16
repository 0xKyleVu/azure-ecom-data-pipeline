SELECT
  Country,
  COUNT(*) AS users,
  ROUND(AVG(CAST(Users_productsWished AS INT)), 2) AS avg_wished,
  ROUND(AVG(CAST(Users_productsSold AS INT)), 2) AS avg_sold,
  ROUND(
    AVG(CAST(Users_productsSold AS INT))
      * 100.0
      / NULLIF(AVG(CAST(Users_productsWished AS INT)), 0),
    1
  ) AS wish_to_sale_pct
FROM
  ecom_db_kyle.default.gold_ecom_users
GROUP BY
  Country
HAVING
  AVG(CAST(Users_productsWished AS INT)) > 0
  AND AVG(CAST(Users_productsSold AS INT)) > 0
  AND COUNT(*) >= 100
ORDER BY
  wish_to_sale_pct DESC