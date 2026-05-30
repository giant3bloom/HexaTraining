create database training_sql_db;
use training_sql_db;

create table books(
	book_id int primary key,
    book_title varchar(100),
    category varchar(50),
    author varchar(50),
    price decimal(10, 2),
    stock int,
    published_year int
);

insert into books
values 
	(1, 'Python Basics', 'Programming', 'Ravi Kumar', 550, 30, 2021), 
	(2, 'Advanced SQL', 'Database', 'Priya Sharma', 750, 15, 2020), 
	(3, 'Data Engineering Guide', 'Data', 'Amit Verma', 1200, 10, 2023), 
	(4, 'Machine Learning Start', 'AI', 'Neha Reddy', 950, 8, 2022), 
	(5, 'Excel for Business', 'Business', 'Kiran Rao', 400, 50, 2019), 
	(6, 'Power BI Reports', 'Data', 'Sneha Patel', 850, 12, 2021), 
	(7, 'Java Fundamentals', 'Programming', 'Arjun Mehta', 600, 20, 2018), 
	(8, 'Cloud Basics', 'Cloud', 'Rahul Nair', 700, 18, 2022), 
	(9, 'SQL Interview Prep', 'Database', 'Farhan Ali', 500, 25, 2024), 
	(10, 'AI for Beginners', 'AI', 'Meera Singh', 650, 5, 2023);
    
select * from books;
select book_title, category, price from books;
select distinct category from books;
select * from books where category = 'Programming';
select * from books where price > 700.00;
select * from books where stock < 15;
select * from books where category in ('Programming', 'Database', 'AI');
select * from books where price between 500 and 900;
select * from books where book_title like '%SQL%';
select * from books where book_title like 'Data%';
select * from books order by price desc;
select * from books order by category asc, price desc;

select count(*) count from books;
select max(price) highest_price from books;
select min(price) lowest_price from books;
select avg(price) avg_price from books;
select sum(stock) total_stock from books;
select category, count(*) no_of_books from books
group by category;
select category, avg(price) avg_price from books
group by category;
select category, sum(stock) stock from books
group by category;
select category from books
group by category having sum(stock) > 1;
select category from books
group by category having avg(price) > 700;

create table departments(
	department_id int primary key,
    department_name varchar(50),
    location varchar(50)
);

create table employees(
	employee_id int primary key,
    employee_name varchar(50),
    department_id int,
    salary decimal(10,2),
    city varchar(50),
    manager_id int
);

insert into departments
values 
	(10, 'IT', 'Hyderabad'), 
	(20, 'HR', 'Bangalore'), 
	(30, 'Finance', 'Mumbai'), 
	(40, 'Sales', 'Delhi'), 
	(50, 'Marketing', NULL); 
    
insert into employees
values 
	(101, 'Rahul Sharma', 10, 75000, 'Hyderabad', 201), 
	(102, 'Priya Reddy', 10, 85000, 'Bangalore', 201), 
	(103, 'Amit Kumar', 20, 55000, NULL, 202), 
	(104, 'Sneha Patel', 30, 65000, 'Mumbai', 203), 
	(105, 'Arjun Verma', NULL, 60000, 'Chennai', 204), 
	(106, 'Neha Singh', 60, 50000, 'Delhi', NULL), 
	(107, 'Farhan Ali', 40, NULL, 'Hyderabad', 205), 
	(108, 'Meera Nair', 10, 90000, 'Pune', 201); 
    
select 
	e.employee_name,
    e.salary,
    d.department_name,
    d.location 
from employees e 
inner join departments d
on e.department_id = d.department_id;

select * from employees e
left join departments d
on e.department_id = d.department_id;

select employee_name from employees e
where not exists 
( select 1 from departments d where e.department_id = d.department_id);

select * from departments d
right join employees e
on d.department_id = e.department_id;

select d.department_name from departments d
right join employees e
on d.department_id = e.department_id 
group by d.department_id having count(e.employee_id)<1;

select * from employees where salary is null;
select * from employees where city is null;
select * from departments where location is null;
select d.department_name, count(e.employee_id) employee from departments d 
right join employees e on d.department_id = e.department_id
group by d.department_name;

select d.department_name, avg(e.salary) from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name;

select d.department_name from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name having count(e.employee_id) > 2;

select d.department_name, max(e.salary) from departments d 
left join employees e on d.department_id = e.department_id 
group by d.department_name;

create table customers_new(
	customer_id int primary key,
    customer_name varchar(50),
    city varchar(50),
    membership_type varchar(30)
);

create table payments(
	payment_id int primary key,
    customer_id int,
    amount decimal(10,2),
    payment_mode varchar(30),
    payment_status varchar(30)
);

insert into customers_new 
values
	(1, 'Ramesh Gupta', 'Hyderabad', 'Gold'), 
	(2, 'Sana Khan', 'Bangalore', 'Silver'), 
	(3, 'John Mathew', 'Mumbai', 'Gold'), 
	(4, 'Ayesha Begum', 'Chennai', 'Bronze'), 
	(5, 'Vikram Rao', 'Delhi', 'Silver'), 
	(6, 'Divya Sharma', 'Pune', NULL); 
    
insert into payments 
values 
	(1001, 1, 15000, 'UPI', 'Success'), 
	(1002, 1, 8000, 'Card', 'Success'), 
	(1003, 2, 5000, 'Cash', 'Pending'), 
	(1004, 3, 22000, 'UPI', 'Success'), 
	(1005, 7, 12000, 'Card', 'Failed'), 
	(1006, NULL, 3000, 'Cash', 'Pending'), 
	(1007, 4, NULL, 'UPI', 'Success'), 
	(1008, 5, 7000, NULL, 'Success'); 
    
select * from customers_new
where customer_id in 
(select distinct customer_id from payments);

select * from customers_new
where customer_id not in 
(select distinct customer_id from payments);

select * from payments
where amount > (select avg(amount) from payments);

select * from customers_new c
inner join payments p on c.customer_id = p.customer_id
where p.amount = (select max(amount) from payments);

select * from customers_new c 
inner join payments p on c.customer_id = p.customer_id
where c.membership_type = 'Gold';

select * from customers_new c
where c.customer_id in 
(
    select p.customer_id
    from payments p
    group by p.customer_id
    having sum(p.amount) > 10000
);

select payment_id from payments 
where customer_id not in 
(select customer_id from customers_new);

select exists
( select 1 from customers_new where customer_id = 1 );

select not exists
( select 1 from customers_new where customer_id = 2 );

select * from payments
where amount >
( select sum(amount) from payments where customer_id = 2 );




