use college_db;
select c.customers_id, c.customer_name, o.order_id, o.product_id, o.amount, o.order_date from customers c inner join orders o on c.customers_id = o.customer_id;
select o.order_id ,c.customer_name, c.city from orders o inner join customers c on c.customers_id = o.customer_id;
select e.emp_id, e.emp_name, d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id;
select o.order_id, c.customer_name, p.product_name, o.amount, o.order_date from orders o inner join customers c on o.customer_id = c.customers_id inner join products p on o.product_id = p.product_id;
select o.order_id, c.customer_name, c.city, p.product_name, p.price, o.amount, o.order_date from orders o inner join customers c on o.customer_id = c.customers_id inner join products p on o.product_id = p.product_id;
select o.order_id, c.customer_name, c.city, p.product_name, o.amount, o.order_date from orders o inner join customers c on o.customer_id = c.customers_id inner join products p on o.product_id = p.product_id where o.amount > 25000.00;
select o.order_id, c.customer_name, c.city, p.product_name, o.amount, o.order_date from orders o inner join customers c on o.customer_id = c.customers_id inner join products p on o.product_id = p.product_id where c.customer_name like '%a%';


