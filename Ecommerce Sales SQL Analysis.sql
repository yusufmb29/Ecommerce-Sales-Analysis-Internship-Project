select * from ecommerce_data;

--Top 10 profitable products 
select product_name, round(sum(profit),2) as total_profit
from ecommerce_data
group by product_name
order by total_profit desc
limit 10;

--The top profitable products contribute significantly to overall business profitability and should be prioritized in marketing and inventory planning.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Top 10 customers by sales 
select customer_name, segment, round(sum(sales),2) as total_sales
from ecommerce_data
group by customer_name, segment
order by total_sales desc
limit 10;

--A small group of high-value customers contributes a major share of total revenue, indicating opportunities for customer retention programs
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Region-wise total sales 
select region, round(sum(sales),2) as total_sales
from ecommerce_data
group by region
order by total_sales desc;

--Central, South and North regions outperform others significantly in revenue generation, helping identify strong and weak geographical markets.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Category-wise average profit 
select category, round(avg(profit),2) as avg_profit
from ecommerce_data
group by category
order by avg_profit desc;
--Technology-related categories generally show higher average profitability compared to other categories.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Highest discount category 
select 
	category, 
	concat(round(avg(discount) * 100, 2),'%') as avg_discount_per
from ecommerce_data
group by category
order by avg_discount_per desc;
-- Furniture Category has highest discount percentage which leads to lowest profitability of this category as compared to others.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders with negative profit
select 
	order_id,
	product_name,
	sub_category,
	category,
	sales,
	profit
from ecommerce_data
where profit < 0
order by profit asc;
--Some high-revenue products such as Machines and Phones are causing major financial losses, indicating pricing inefficiencies, excessive discounts, or high operational costs.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Monthly sales trend 
select 
	to_char(order_date,'YYYY-MM') as month,
	round(sum(sales),2) as monthly_sales
from ecommerce_data
group by month
order by month;
--The Sales has been significantly increased over the time with sudden decrease in early months of each year.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Market-wise revenue analysis 
select market, round(sum(sales),2) as total_revenue
from ecommerce_data
group by market
order by total_revenue desc;
--APAC generated the highest revenue, followed by EU and US markets. In contrast, Canada and Africa showed comparatively lower performance.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Top-performing sub-categories 
select 
	sub_category,
	round(sum(sales),2) as total_sales
from ecommerce_data
group by sub_category
order by total_sales desc
limit 10;
-- Phones and Copiers contributed more in company's total sales while Accessories and Blinders contributed less.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Ship mode usage analysis
select ship_mode, count(*) as total_orders
from ecommerce_data
group by ship_mode
order by total_orders desc;
--Standard Class is the most preferred shipping mode, accounting for the majority of total orders. In contrast, Same Day delivery had the lowest usage.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Short insights based on SQL Analysis

--1.APAC generated the highest revenue among all markets, making it the company’s strongest performing region. This indicates high customer demand and strong market penetration.
--2.The Technology category generated the highest overall profit, indicating strong profitability and higher-value product sales.
--3.Machines, Phones, and certain Furniture products contributed significantly to negative profits, indicating pricing inefficiencies, high operational costs, or excessive discounting.
--4.Standard Class was the most frequently used shipping mode, showing that customers generally prefer economical delivery options over premium same day delivery.
--5.South, North, and Central regions contributed highly to total sales, while Caribbean and Canada showed comparatively weaker sales performance.
--6.Higher discount were often associated with lower profitability, indicating that accessive discounting negatively impacts profit margins.



































