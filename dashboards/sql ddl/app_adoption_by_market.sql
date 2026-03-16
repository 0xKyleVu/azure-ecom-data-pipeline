SELECT
  Country,
  COUNT(*) AS total_users,
  SUM(CASE WHEN Users_hasanyapp THEN 1 ELSE 0 END) AS app_users,
  ROUND(SUM(CASE WHEN Users_hasanyapp THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS app_adoption_pct
FROM ecom_db_kyle.default.gold_ecom_users
GROUP BY Country
HAVING COUNT(*) >= 500
ORDER BY app_adoption_pct DESC
