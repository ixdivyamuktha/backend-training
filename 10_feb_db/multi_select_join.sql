select c.customer_name,o.order_id,o.amount, (select COUNT(*) from ORDERS x where x.customer_id = c.customers_id) as total_orders, (select avg(amount) from orders) as avg_order_amount from customers c join orders o on c.customers_id = o.customer_id;
select c.customer_name as Customer, o.order_id as OrderNo, o.amount as OrderValue ,(select max(amount) from orders) as MaxOrder from customers c join orders o on c.customers_id=o.customer_id;
select c.customer_name as Customer, o.order_id as OrderNo, o.amount*1.18 as OrderValueIncludingTax , (select max(amount) from orders) as MaxOrder from customers c join orders o on c.customers_id=o.customer_id;
 --Use CASE with joins
select c.customer_name,o.order_id,o.amount,
case
when o.amount>(select avg(amount) from orders)
then 'Average'
when o.amount>(select avg(amount)*1.5 from orders)
then 'Very HIGH'
else 'Normal'
end as category
from customers c join orders o on c.customers_id = o.customer_id;