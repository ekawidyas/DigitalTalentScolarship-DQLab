-- Overall Performance by Year
SELECT YEAR(order_date) years,
       SUM(sales) sales,
       COUNT(order_status) number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY 1;

-- Overall Performance by Product Sub Category
SELECT YEAR(order_date) years,
	   product_sub_category,
	   SUM(sales) sales
FROM dqlab_sales_store
WHERE YEAR(order_date) BETWEEN 2011 AND 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category
ORDER BY years, sales DESC;

-- Promotion Effectiveness and Efficiency by Years
SELECT YEAR(order_date) years,
	   SUM(sales) sales,
	   SUM(discount_value) promotion_value,
	   ROUND((SUM(discount_value) / SUM(sales)) * 100, 2) burn_rate_percentage
from dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY 1;

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT YEAR(order_date) years,
	   product_sub_category,
	   product_category,
       SUM(sales) sales,
	   SUM(discount_value) promotion_value,
	   ROUND((SUM(discount_value)/SUM(sales))* 100, 2) burn_rate_percentage
from dqlab_sales_store
WHERE YEAR(order_date) = 2012 AND order_status = 'Order Finished'
GROUP BY years,product_sub_category, product_category
ORDER BY sales DESC;

-- Customers Transactions per Year
SELECT YEAR(order_date) years,
	   COUNT(DISTINCT customer) number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;