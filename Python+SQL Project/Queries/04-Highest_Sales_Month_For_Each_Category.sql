-- Question No.4 - For Each Category, Which Month Has The Highest Sales

WITH CTE AS ( 
SELECT category, YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(sales_price) AS sale
FROM df_orders
GROUP BY category, YEAR(order_date), MONTH(order_date)
)
SELECT * FROM 
(
SELECT *, ROW_NUMBER() OVER(Partition By category order by sale desc) AS rnk
FROM CTE 
) A
WHERE rnk = '1';
