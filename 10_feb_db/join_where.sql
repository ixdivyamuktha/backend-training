select o.order_id, o.order_date, o.amount, c.customers_id, c.customer_name, c.city from orders o inner join customers c on o.customer_id = c.customers_id where o.order_date > '2024-01-12';
select e.emp_id, e.emp_name, e.emp_role, e.salary, d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id where d.dept_name = 'it';
select c.customers_id, c.customer_name, c.city, o.order_id, o.amount from customers c inner join orders o on c.customers_id = o.customer_id where c.city = 'hyderabad';
select o.order_id, p.product_id, p.product_name, p.price, o.amount from orders o inner join products p on o.product_id = p.product_id where p.price > 10000;
