select *from dbo.[pizza_sales]


select sum(total_price )as total_revenue 
from dbo.[pizza_sales]

select (sum(total_price )/count(distinct order_id)) as average_order_value 
from dbo.[pizza_sales]

select sum(quantity) as total_pizza_sold
from dbo.[pizza_sales]

select count (distinct order_id )as total_order 
from dbo.[pizza_sales]

select  cast(sum(quantity) as decimal(10,2)) /cast (count(distinct order_id) as decimal (10,2)) as average_pizza_per_order from pizza_sales 

--1.Daily Trend for Total Orders:

select DATENAME(DW,order_date)as order_day,count (distinct order_id )as total_orders
from pizza_sales 
group by  DATENAME(DW,order_date)

--2.Monthly Trend for Total Orders:

select DATENAME(month ,order_date)as order_month ,count (distinct order_id )as total_orders
from pizza_sales 
group by  DATENAME(month ,order_date)
order by total_orders desc;

--Percentage of Sales by Pizza Category:
select
  pizza_category,
  cast(sum(total_price) as decimal (10,2) )as total_revune ,
  cast(sum (total_price *100)/(select sum(total_price) from pizza_sales)  as decimal (10,2))as pct
from dbo.[pizza_sales]
group by pizza_category

select *from dbo.[pizza_sales]

--.Percentage of Sales by Pizza Size:

select 
  pizza_size,
  cast(sum(total_price) as decimal (10,2) )as total_revune ,
  cast (sum(total_price *100)/(select sum(total_price)from pizza_sales  )as decimal(10,2))as pct

from dbo.[pizza_sales]
group by pizza_size
ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category:
select  
   pizza_category,
   sum(quantity)as total_quantity
from pizza_sales 
--where month(order_date)=2
group by pizza_category
order by total_quantity desc;

--6.Top 5 Best Sellers by Revenue
select 
 top 5 pizza_name,
 sum(total_price)as total_revenue
from pizza_sales
group by pizza_name 
ORDER BY total_revenue DESC;

---Top 5 Best Sellers by  Total Quantity
select 
 top 5 pizza_name,
 sum(Quantity)as Total_Quantity
from pizza_sales
group by pizza_name 
ORDER BY Total_Quantity DESC;

--6.Top 5 Best Sellers by  Total Orders
select 
 top 5 pizza_name,
 sum(order_id)as Total_Orders
from pizza_sales
group by pizza_name 
ORDER BY Total_Orders DESC;
-- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
select 
 top 5 pizza_name,
 sum(total_price)as total_revenue
from pizza_sales
group by pizza_name 
ORDER BY total_revenue ASC;
-- Bottom 5 Best Sellers by  Total Quantity 

select 
 top 5 pizza_name,
 sum(Quantity)as Total_Quantity
from pizza_sales
group by pizza_name 
ORDER BY Total_Quantity ASC;
-- Bottom 5 Best Sellers by Total Orders
select 
 top 5 pizza_name,
  sum(order_id)as Total_Orders
from pizza_sales
group by pizza_name 
ORDER BY Total_Orders ASC;