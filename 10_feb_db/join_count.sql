select c.customers_id, c.customer_name, count(o.order_id) as order_count from customers c left join orders o on c.customers_id = o.customer_id group by c.customers_id, c.customer_name;
select d.dept_id, d.dept_name, count(e.emp_id) as emp_count from departments d left join employees e on d.dept_id = e.dept_id group by d.dept_id, d.dept_name;
select p.product_name, count(p.product_id) as product_count from products p group by p.product_name;
select c.city, count(o.order_id) as order_count from customers c left join orders o on c.customers_id = o.customer_id group by c.city;

