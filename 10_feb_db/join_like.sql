select c.customers_id, c.customer_name, o.order_id, o.amount from customers c inner join orders o on c.customers_id = o.customer_id where c.customer_name like 'a%';
select e.emp_id, e.emp_name, d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id where e.emp_name like '%i%';
select o.order_id, p.product_id, p.product_name, o.amount from orders o inner join products p on o.product_id = p.product_id where p.product_name like '%top%';
