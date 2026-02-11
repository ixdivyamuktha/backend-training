select c.customers_id, c.customer_name, p.product_id, p.product_name from customers c cross join products p;
select e.emp_id, e.emp_name, r.emp_role from employees e cross join (select distinct emp_role from employees) r;
select d.dept_id, d.dept_name, e.emp_id, e.emp_name from departments d cross join employees e;
