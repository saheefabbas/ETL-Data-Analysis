-- Question No.3 - Find Month Over Month Growth Comparison For 2022 and 2023 Sales E-g: January 2022 vs january 2023

WITH CTE AS(
SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(sales_price) AS total_sale
FROM df_orders
GROUP BY YEAR(order_date), MONTH(order_date)
--ORDER BY YEAR(order_date), MONTH(order_date)
)
SELECT order_month,
SUM(CASE when order_year = 2022 then total_sale else 0 end) as sales_2022,
SUM(CASE when order_year = 2023 then total_sale else 0 end) as sales_2023
FROM CTE
GROUP BY order_month
ORDER BY order_month
