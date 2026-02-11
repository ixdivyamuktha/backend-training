select c.customers_id, c.customer_name, o.order_id, o.amount, o.order_date from customers c left join orders o on c.customers_id = o.customer_id;
select c.customers_id, c.customer_name from customers c left join orders o on c.customers_id = o.customer_id where o.order_id is null;
select d.dept_id, d.dept_name, e.emp_id, e.emp_name from departments d left join employees e on d.dept_id = e.dept_id;
select d.dept_id, d.dept_name from departments d left join employees e on d.dept_id = e.dept_id where e.emp_id is null;
select p.product_id, p.product_name from products p left join orders o on p.product_id = o.product_id where o.order_id is null;
select c.customers_id, c.customer_name, o.order_id, o.amount from customers c left join orders o on c.customers_id = o.customer_id and o.amount > 25000.00;
select c.customers_id, c.customer_name, o.order_id, o.amount from customers c left join orders o on c.customers_id = o.customer_id and c.customer_name like '%a%';

