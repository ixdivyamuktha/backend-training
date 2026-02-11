alter table orders add constraint fk_orders_customers foreign key (customer_id) references customers(customers_id);
select o.order_id, c.customer_name from orders o inner join customers c on o.customer_id = c.customers_id;
insert into orders values (2001,99,101,5000.00,'2024-02-01');
select c.customers_id, c.email, o.order_id from customers c inner join orders o on c.customers_id = o.customer_id where c.email = 'ael@gmail.com';
alter table orders alter column customer_id int not null;
insert into orders(order_id,customer_id,product_id,amount,order_date) values (2002,null,101,3000.00,'2024-02-02');
insert into customers(customers_id,customer_name,city,email) values (11,null,'vizag','xya@gmail.com');
