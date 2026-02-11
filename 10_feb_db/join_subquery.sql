use college_db;
select c.customers_id, c.customer_name, o.customer_id from customers c inner join orders o on c.customers_id=o.customer_id where c.customers_id in(select customer_id from orders);
select c.customers_id, c.customer_name, o.customer_id from customers c inner join orders o on c.customers_id=o.customer_id where c.customers_id not in(select customer_id from orders);
select * from customers where customers_id in(select customer_id from orders);
select * from customers where customers_id not in(select customer_id from orders);
select * from orders;
select * from products;
select * from products where product_id not in (select product_id from orders);
select * from employees where dept_id not in (select dept_id  from departments);
select o.amount from orders o join orders p on o.amount= p.amount where o.amount>(select avg(amount) from orders);
select c.customers_id, o.order_id, o.amount from orders o join customers c on o.customer_id= c.customers_id where o.amount>(select avg(amount) from orders);
--select e.salary, d.dept_id, d.dept_name from 
select customers_id from customers where EXISTS ( select customer_id from orders)
select customers_id from customers where not EXISTS ( select customer_id from orders);
--Use correlated subquery with join
--Customers NOT IN cancelled orders list
--Employees earning more than department average (subquery + join)
--Departments IN list of active departments (subquery)
--Customers NOT IN cancelled orders list
--Use subquery inside JOIN condition
--Use subquery as derived table and join it
