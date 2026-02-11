use college_db;
select c.customers_id, c.customer_name, count(o.order_id) as order_count from customers c left join orders o on c.customers_id = o.customer_id group by c.customers_id, c.customer_name;
select c.customers_id, c.customer_name, sum(o.amount) as total_amount from customers c left join orders o on c.customers_id = o.customer_id group by c.customers_id, c.customer_name;
select d.dept_id, d.dept_name, count(e.emp_id) as emp_count from departments d left join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name;
select p.product_id, p.product_name, count(o.order_id) as order_count from products p left join orders o on p.product_id = o.product_id group by p.product_id, p.product_name;
select d.dept_id, d.dept_name, sum(e.salary) as total_salary from departments d left join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name;
