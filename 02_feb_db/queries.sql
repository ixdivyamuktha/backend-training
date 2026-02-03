--Task 1
use college_db;
create table students(student_id bigint primary key,name varchar(20), email varchar(20) unique, age int, join_date date, active_flag bit default 1);
create table courses (course_id int primary key, course_name varchar(20) not null, fees decimal);
create table enrollments (enroll_id BIGINT PRIMARY KEY,student_id BIGINT,course_id INT,enroll_timestamp DATETIME2 );

exec sp_help students;
exec sp_help courses;
--Task 2
insert into enrollments values  
(50001, 1001, 201, '2024-07-01 10:30:00'),
(50002, 1001, 202, '2024-07-01 10:45:00'),
(50003, 1002, 201, '2024-07-02 11:00:00'),
(50004, 1002, 203, '2024-07-02 11:15:00'),
(50005, 1003, 204, '2024-07-03 09:30:00'),
(50006, 1003, 202, '2024-07-03 09:45:00'),
(50007, 1004, 205, '2024-07-04 12:00:00'),
(50008, 1004, 201, '2024-07-04 12:15:00'),
(50009, 1005, 203, '2024-07-05 10:00:00'),
(50010, 1005, 204, '2024-07-05 10:20:00'),
(50011, 1006, 202, '2024-07-06 11:30:00'),
(50012, 1007, 201, '2024-07-07 09:00:00'),
(50013, 1008, 205, '2024-07-08 14:00:00'),
(50014, 1009, 204, '2024-07-09 15:30:00'),
(50015, 1010, 203, '2024-07-10 16:00:00');
--Task 3
insert into students (student_id, name, email, age, join_date, active_flag)
values  
(1011, 'pqr', 'pqr@gmail.com', 21, '2024-07-01', 1),
(1012, 'stu', 'stu@gmail.com', 20, '2024-07-02', 1),
(10013, 'Vwx', 'vwx@gmail.com', 22, '2024-07-03', 1);

insert into courses (course_id, course_name, fees)
values  
(206, 'AI', 150000.00);
insert into enrollments (enroll_id, student_id, course_id, enroll_timestamp)
values   
(50016, 1011, 206, '2024-07-15 10:00:00'),
(50017, 1012, 206, '2024-07-15 10:05:00'),
(50018, 1013, 201, '2024-07-16 11:30:00'),
(50019, 1013, 202, '2024-07-16 11:45:00');
select  * from students;
select  name, email from students;
select  * from students order by age desc;
select  top 5 * from students ORDER BY join_date;
select  distinct course_name from courses;
update students set age=19 where student_id=1007;
update students set active_flag=0 where student_id in (1004 ,1005);
update courses set fees=fees*1.10;

delete from students where student_id=1013;
delete from courses where fees<1000;
delete from enrollments where enroll_timestamp<'2024-07-16';

alter table courses alter column course_name varchar(100);
exec sp_rename 'students.registeration_date', 'registration_date', 'COLUMN';
alter table students add phone_no varchar(15);
--Task 4
select * from students where age>21;
select * from students where active_flag=1;
select * from courses where fees between 1000 and 5000;
select * from students where age in(20,22,25);

select * from students where age>20 and active_flag=1;
select * from students where age<20 or active_flag=0;
select * from courses where fees>2000 and course_name like '%Data%';

select * from students where email like '%gmail.com';
select * from courses where course_name like 'Data%';
select * from students where name like '%d%';

insert into students values  (1013, 'zyx','zyx@gmail.com', null, '2020-01-07', 1,null);
select  * from students where age is  null;
select  * from students where age is not null;
--Task 5
select  count(*) from  students;
select  count(*) from  students where active_flag=1;

select  sum(fees) AS sum_fee, avg(fees) as avg_fee from courses where fees > 2000;

select  min(age) AS min_age from students ;
select  max(fees) AS max_fee from courses ;
select  min(registration_date) AS oldest from students ;
select  max(registration_date) AS latest from students ;

select  count(*) from  students group by active_flag;
select  count(*) from  students group by age;
select  count(*) from  courses group by fees;

select  course_id from enrollments group by course_id having count(course_id) > 3;
select  age from students group by age having avg(age)>21;
select  course_id from enrollments group by course_id having count(course_id)>2;
--Task 6
select  * from students where age>20 order by age ;
select  count(*) from students where name like '%a%';
select  * from courses where fees between 1000 and 5000  order by fees ;
select  * from students where active_flag=0 and age is not null;
select  student_id from enrollments group by student_id having count(student_id)>1;
