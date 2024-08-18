-- Question No.5 -Which Sub-Category Had Highest Growth By Profit In 2023 Compared To 2022

WITH CTE AS(
SELECT sub_category, YEAR(order_date) AS order_year, SUM(profit) AS profit
FROM df_orders
GROUP BY sub_category, YEAR(order_date)
),
CTE2 AS(
SELECT sub_category,
SUM(CASE when order_year = 2022 then profit else 0 end) as profit_2022,
SUM(CASE when order_year = 2023 then profit else 0 end) as profit_2023
FROM CTE
GROUP BY sub_category
)
SELECT * ,  (profit_2023 - profit_2022) * 100 / profit_2022 AS growth
FROM CTE2
ORDER BY growth desc