create database pizza_sales
use pizza_sales
select * from sales 

															--Sales Analysis:

-- 1. What is the total number of order placed ?

SELECT
	count(id) as total_order
FROM
	sales;
    
-- 2. What is the total Revenue generated from pizza sales ?

SELECT 
    ROUND(SUM(price)) AS total_revenue
FROM 
    sales;

-- 3. What are the revenue contribution of each pizza type and size  and their quantity sold?

SELECT 
   type, 
   count(type) as Quantity_sold,
   ROUND(SUM(price)) AS total_revenue,
   ROUND((SUM(price) / (SELECT SUM(price) FROM sales) * 100)) AS revenue_percentage
   FROM 
    sales
group by 
	type
order by
	total_revenue
	desc;
    
SELECT 
   size, 
   count(size) as Quantity_sold,
   ROUND(SUM(price)) AS total_revenue,
   ROUND((SUM(price) / (SELECT SUM(price) FROM sales) * 100),2) AS revenue_percentage
   FROM 
    sales
group by 
	size
order by
	total_revenue
	desc;
    
    
														--Product Performance:
                                                        
select * from sales

-- 4. Identify Top 3 Highest-priced pizzas.

SELECT
	name , (MAX(price)) as Price
FROM
	sales
GROUP BY 
	name
ORDER BY 
	Price
	DESC
LIMIT 3;

-- 5.What are the top best-selling pizza types?

select 
	type, count(*) as best_selling
from 
	sales
group by 
	type
order by best_selling
	DESC;
    
-- 6.What is the Avg. price of Pizzas ?

SELECT 
	ROUND(AVG(price)) as Avg_price
FROM
	sales;

	
														--Customer Behavior:
select * from sales

-- 8.What are the peak hours for pizza orders?

SELECT 
    HOUR(time) AS order_hour,
    COUNT(*) AS order_count
FROM 
	sales
GROUP BY 
    HOUR(time)
ORDER BY 
    order_count DESC;
    
select * from sales

-- 9. What is the average number of Pizza ordered per day ?

SELECT ROUND(AVG(daily_order_count)) AS average_pizzas_per_day
FROM (
    SELECT date, COUNT(*) AS daily_order_count
    FROM sales
    GROUP BY date
) AS daily_counts;


														--Pricing Strategy:

-- 7.Check out the prices of Pizzas & their Sales volume.

SELECT 
    price,
    COUNT(*) AS sales_volume
FROM 
    sales
GROUP BY 
    price
ORDER BY 
    sales_volume DESC;









