--select * from city;
--select * from products;
--select * from customers;
--select * from sales;

-- Q.1 Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?

select 
        city_name,
        round (
        (population * 0.25)/1000000,
        2)as coffee_consumers_in_millions,
        city_rank
from city
order by 2 desc


-- -- Q.2 Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

select  
      sum(total) as total_revenue
from sales 
where 
      extract(Year from sale_date) = 2023
	  and
	  extract(quarter from sale_date) = 4


select
      ci.city_name,
	  sum(s.total) as total_revenue
from sales as s
join customers as c
on s.customer_id = c.customer_id
join city as ci
on ci.city_id = c.city_id
where 
      extract(year from s.sale_date) = 2023
	  and 
	  extract(quarter from s.sale_date) = 4
group by 1
order by 2 desc
	  

-- Q.3
-- Sales Count for Each Product
-- How many units of each coffee product have been sold?

select 
       p.product_name,
	   count(s.sale_id) as total_orders
      from products as p
      left join
      sales as s
      on s.product_id = p.product_id
group by 1
order by 2 desc


-- Q.4
-- Average Sales Amount per City
-- What is the average sales amount per customer in each city?
-- city abd total sale
-- no cx in each these city

select 
       ci.city_name,
	   sum(s.total) as total_revenue,
	   count(distinct s.customer_id) as total_cx,
	   round(
                   sum(s.total)::numeric/
				                count(distinct s.customer_id)::numeric
								,2) as avg_sale_per_cx
		from sales as s
		join customers as c
		on s.customer_id = c.customer_id
join city as ci
on ci.city_id = c.city_id
		group by 1
		order by 2 desc


-- -- Q.5
-- City Population and Coffee Consumers (25%)
-- Provide a list of cities along with their populations and estimated coffee consumers.
-- return city_name, total current cx, estimated coffee consumers (25%)


    with city_table as 
	  (
          select 
		    city_name,
			round((population * 0.25)/1000000,2) as coffee_consumers
			from city
		 ),

    customers_table as
	     (
           select
		   ci.city_name,
		   count(distinct c.customer_id) as unique_cx
		     from sales as s
			 join customers as c
			 on c.customer_id = s.customer_id
			 join city as ci
			 on ci.city_id = c.city_id
			 group by 1
	  )
      select 
	          customers_table.city_name,
			  city_table.coffee_consumers as coffee_consumer_in_millions,
			  customers_table.unique_cx
	 from city_table
	 join
	 customers_table
	 on city_table.city_name = customers_table.city_name


-- -- Q6
-- Top Selling Products by City
-- What are the top 3 selling products in each city based on sales volume?

 select *
 from
    (
       select 
	   ci.city_name,
	   p.product_name,
	   count(s.sale_id) as total_orders,
	     dense_rank() over(partition by ci.city_name order by count(s.sale_id)desc) as rank
		   from sales as s
		    join products as p
			on s.product_id = p.product_id
			    join customers as c
				on c.customer_id = s.customer_id 
				  join city as ci
				  on ci.city_id = c.city_id
				    group by 1,2
	) as t1
	where rank <=3



-- Q.7
-- Customer Segmentation by City
-- How many unique customers are there in each city who have purchased coffee products?

    select * from products;



 select
	         ci.city_name,
	         count(distinct c.customer_id) as unique_cx
       from city as ci
           left join
              customers as c
               on c.city_id = ci.city_id
                   join sales as s
                   on s.customer_id = c.customer_id
                   where 
	             s.product_id  in(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
                       group by  1
 
		