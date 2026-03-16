SELECT DISTINCT Country, 'Female' AS Gender, Countries_FemaleSellers AS Count
FROM ecom_db_kyle.default.gold_ecom_users
WHERE Countries_FemaleSellers IS NOT NULL
UNION ALL
SELECT DISTINCT Country, 'Male' AS Gender, Countries_MaleSellers AS Count
FROM ecom_db_kyle.default.gold_ecom_users
WHERE Countries_MaleSellers IS NOT NULL