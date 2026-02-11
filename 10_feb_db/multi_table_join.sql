use college_db;
create table suppliers (supplier_id int primary key, supplier_name varchar(60) not null, city varchar(50));
create table order_items (order_item_id int primary key, order_id int not null, product_id int not null, quantity int not null, foreign key (order_id) references orders(order_id), foreign key (product_id) references products(product_id));

select c.customers_id, c.customer_name, o.order_id, oi.product_id, oi.quantity from customers c inner join orders o on c.customers_id = o.customer_id inner join order_items oi on o.order_id = oi.order_id;
select o.order_id, p.product_id, p.product_name, s.supplier_id, s.supplier_name from orders o inner join products p on o.product_id = p.product_id inner join suppliers s on p.supplier_id = s.supplier_id;
select e.emp_id, e.emp_name, d.dept_id, d.dept_name, l.location_name from employees e inner join departments d on e.dept_id = d.dept_id inner join locations l on d.locale = l.location_code;
select c.customers_id, c.customer_name, o.order_id, oi.product_id, p.product_name, oi.quantity, o.amount from customers c inner join orders o on c.customers_id = o.customer_id inner join order_items oi on o.order_id = oi.order_id inner join products p on oi.product_id = p.product_id;
