use college_db;
select c.customers_id, c.customer_name from customers c inner join orders o on c.customers_id = o.customer_id group by c.customers_id, c.customer_name having count(o.order_id) > 3;
select d.dept_id, d.dept_name from departments d inner join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name having count(e.emp_id) > 5;
select p.product_id, p.product_name from products p inner join orders o on p.product_id = o.product_id group by p.product_id, p.product_name having count(o.order_id) > 10;
select c.customers_id, c.customer_name from customers c inner join orders o on c.customers_id = o.customer_id group by c.customers_id, c.customer_name having sum(o.amount) > 25000.00;
	