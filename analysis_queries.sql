---monthly revenue
select 
	DATE_TRUNC('month',transaction_date)as month,
	sum(total_amount)as revenue
from transactions
group by month
order by month

---Top customer
select 
	c.name,
	sum(t.total_Amount)as total_spent
from transactions t
join customers c on t.customer_id = c.customer_id
group by c.name
order by total_spent desc
limit 5;

---category performance
select
	p.category,
	sum(t.total_amount)as revenue
from transactions t 
join products p on t.product_id = p.product_id
group by p.category
order by revenue desc;

--- customer who never purchased
select c.name
from customers c
left join transactions t 
on c.customer_id = t.customer_id
where t.customer_id is null

--- average order value
select avg(total_amount)As average_order
from transactions

---Total quantity sold per product
select p.product_name,
sum(t.quantity)as total_quantity
from transactions t 
join products p
on t.product_id = p.product_id
group by  p.product_name
order by total_quantity desc

--- Top 3 cities by revenue
select c.city,
sum(t.total_amount)as revenue
from customers c
join transactions t 
on c.customer_id = t.customer_id
group by c.city
order by revenue desc
limit 3;

---repeat customers
select c.name
from customers c
join transactions t 
on c.customer_id = t.customer_id
group by c.name
having count(*)>1

---Discount impact
select sum(t.total_amount)As revenue_after_discount,
sum(t.quantity*p.price)as revenue_before_discount,
sum(t.quantity*p.price)-sum(t.total_amount)as discount_loss
from transactions t
join products p
on t.product_id = p.product_id

--monthly revnue growth
with monthly_revnue as (
	select 
		DATE_TRUNC('month',transaction_date)as month,
		sum(total_Amount)as revenue
	from transactions
	group by 1
)
select month,revenue,
LAG(revenue)over(order by month)as prev_revenue,
ROUND(
	 ((revenue - LAG(revenue)over(order by month))
	/LAG(revenue)over(order by month)*100)::numeric,2 
)as growth_percentage
from monthly_revnue

---most popular category per month
with category_revenue as (
	select 
		DATE_TRUNC('month',t.transaction_date)As month,
		p.category,
		sum(t.total_amount)as revenue
	from transactions t
	join products p 
	on p.product_id = t.product_id
	group by 1,2
),ranked_categories as (
	select 
		month,
		category,
		revenue,
	ROW_NUMBER()OVER(PARTITION BY month ORDER BY revenue desc)as rn
	from category_revenue
)
select
	month,
	category,
	revenue
from ranked_categories
where rn = 1
order by month;

--- customer life time value(CLTV)
with customer_spending as (
	select customer_id,
	sum(total_amount)As total_lifetime_value
	from transactions
	group by customer_id
),
ranked_spend as (
select 
	customer_id,
	total_lifetime_value,
	RANK() OVER (ORDER BY total_lifetime_value desc)as rank
from customer_spending
)
select
	customer_id,
	total_lifetime_value
from ranked_spend
where rank<=5
order by rank


