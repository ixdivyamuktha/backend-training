select o.order_id, o.product_id, o.amount, o.order_date, c.customers_id, c.customer_name, c.city from customers c right join orders o on c.customers_id = o.customer_id;
select o.order_id, o.product_id, o.amount, o.order_date from customers c right join orders o on c.customers_id = o.customer_id where c.customers_id !=o.customer_id;
select d.dept_id, d.dept_name, e.emp_id, e.emp_name from departments d right join employees e on d.dept_id = e.dept_id;
select d.dept_id, d.dept_name, e.emp_id, e.emp_name from employees e right join departments d on e.dept_id = d.dept_id where d.dept_name like '%i%';
select d.dept_id, d.dept_name, count(e.emp_id) as emp_count from employees e right join departments d on e.dept_id = d.dept_id group by d.dept_id, d.dept_name;
