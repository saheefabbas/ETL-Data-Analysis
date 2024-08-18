-- Question No. 1 Find Top 10 Highest Revenue Generating Products

SELECT Top 10 product_id, 
SUM(sales_price) AS revenue 
FROM df_orders
GROUP BY product_id
ORDER BY SUM(sales_price) DESC;
