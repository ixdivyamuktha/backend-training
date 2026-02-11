create table customers (customers_id int primary key, customer_name varchar(50) not null, city varchar(50) not null, email varchar(100) unique);
create table orders (
    order_id int primary key, 
    customer_id int not null,
    product_id int not null, 
    amount decimal(10,2) not null, 
    order_date date not null, 
    foreign key (customer_id) references customers(customers_id), 
    foreign key (product_id) references products(product_id)
);
create table products (product_id int primary key, product_name varchar(70) not null, price decimal(10,2));
create table departments(dept_id int primary key, dept_name varchar(40), locale varchar(50));
create table employees(emp_id int primary key, emp_name varchar(40), dept_id int, emp_role varchar(30), manager int);
alter table employees add salary int;
insert into customers values
(1,'ael','hyderabad','ael@gmail.com'),
(2,'bri','kochi','bri@gmail.com'),
(3,'cyn','delhi','cyn@gmail.com'),
(4,'dex','mumbai','dex@gmail.com'),
(5,'eli','pune','eli@gmail.com'),
(6,'fay','chennai','fay@gmail.com'),
(7,'gio','bhopal','gio@gmail.com'),
(8,'han','jaipur','han@gmail.com'),
(9,'ivy','ahmedabad','ivy@gmail.com'),
(10,'jax','kolkata','jax@gmail.com');

insert into employees values
(201,'kim',2,'developer',null,60000),
(202,'leo',2,'tester',201,45000),
(203,'max',1,'hr executive',null,40000),
(204,'nia',3,'accountant',null,50000),
(205,'oli',4,'sales manager',null,55000),
(206,'pia',5,'seo analyst',205,42000),
(207,'rex',6,'support engineer',null,38000),
(208,'sky',7,'admin officer',null,46000),
(209,'tom',8,'researcher',null,62000),
(210,'una',9,'operations lead',null,58000);

insert into departments values
(1,'hr','hyderabad'),
(2,'it','bangalore'),
(3,'finance','mumbai'),
(4,'sales','delhi'),
(5,'marketing','pune'),
(6,'support','chennai'),
(7,'admin','kolkata'),
(8,'research','hyderabad'),
(9,'operations','noida'),
(10,'training','kochi');

insert into products values
(101,'laptop',55000.00),
(102,'mobile',25000.00),
(103,'tablet',18000.00),
(104,'keyboard',1200.00),
(105,'mouse',800.00),
(106,'monitor',15000.00),
(107,'printer',22000.00),
(108,'headphones',3000.00),
(109,'webcam',4500.00),
(110,'router',2800.00);

insert into orders values
(1001,1,101,55000.00,'2024-01-10'),
(1002,2,102,25000.00,'2024-01-11'),
(1003,3,103,18000.00,'2024-01-12'),
(1004,4,104,1200.00,'2024-01-13'),
(1005,5,105,800.00,'2024-01-14'),
(1006,6,106,15000.00,'2024-01-15'),
(1007,7,107,22000.00,'2024-01-16'),
(1008,8,108,3000.00,'2024-01-17'),
(1009,9,109,4500.00,'2024-01-18'),
(1010,10,110,2800.00,'2024-01-19');

select * from orders;