SELECT DISTINCT
  Country,
  Countries_Sellers,
  Countries_TopSellers,
  Countries_FemaleSellers,
  Countries_MaleSellers,
  Buyers_Total,
  Buyers_Top,
  Buyers_Female,
  Buyers_Male,
  Sellers_Total,
  Sellers_MeanProductsSold,
  Sellers_MeanProductsListed
FROM
  ecom_db_kyle.default.gold_ecom_users
WHERE
  Countries_Sellers IS NOT NULL
  OR Buyers_Total IS NOT NULL
  OR Sellers_Total IS NOT NULL