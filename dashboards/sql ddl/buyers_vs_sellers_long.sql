SELECT DISTINCT Country, 'Buyers' AS Metric, Buyers_Total AS Value
FROM ecom_db_kyle.default.gold_ecom_users
WHERE Buyers_Total IS NOT NULL
UNION ALL
SELECT DISTINCT Country, 'Sellers' AS Metric, CAST(Sellers_Total AS INT) AS Value
FROM ecom_db_kyle.default.gold_ecom_users
WHERE Sellers_Total IS NOT NULL
