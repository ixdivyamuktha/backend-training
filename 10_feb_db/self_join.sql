select e.emp_id, e.emp_name, m.emp_name as manager_name from employees e self join employees m on e.manager = m.emp_id;
select e1.emp_id, e1.emp_name, e1.manager from employees e1 self join employees e2 on e1.manager = e2.manager and e1.emp_id <> e2.emp_id;
select distinct m.emp_id, m.emp_name from employees e self join employees m on e.manager = m.emp_id;
select e.emp_id, e.emp_name, m.emp_id as mentor_id, m.emp_name as mentor_name from employees e self join employees m on e.manager = m.emp_id;
select e.emp_id as employee_id, e.emp_name as employee_name, m.emp_id as manager_id, m.emp_name as manager_name from employees e  join employees m on e.manager = m.emp_id;
