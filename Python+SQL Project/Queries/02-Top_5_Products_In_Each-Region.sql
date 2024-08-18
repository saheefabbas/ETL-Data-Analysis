-- Question No. 2 Find Top 5 Highest Selling Products In Each Region

WITH CTE as (
SELECT region, product_id, 
SUM(sales_price) as sales
FROM df_orders
GROUP BY region, product_id)
SELECT * FROM(
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY region ORDER BY sales desc) AS rn
FROM CTE) A
WHERE rn <= 5;


