SELECT
  Country,
  COUNT(*) AS user_count,
  SUM(
    CASE
      WHEN Users_hasanyapp = true THEN 1
      ELSE 0
    END
  ) AS app_users,
  AVG(Users_socialnbfollowers) AS avg_followers
FROM
  ecom_db_kyle.default.gold_ecom_users
GROUP BY
  Country
ORDER BY
  user_count DESC