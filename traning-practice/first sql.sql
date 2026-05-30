create database retail_db;

use retail_db;

create table customers(
	customer_id int,
    customer_name varchar(100),
    city varchar(50)
);

insert into customers
values
	(1, 'Rahul', 'Hyderabad'),
    (2, 'Priya', 'Bangalore'),
    (3, 'Amit', 'Mumbai');
    
select * from customers;

-- ctrl + / to command

set sql_safe_updates = 0;
-- set SQL_SAFE_UPDATES = 0;
update customers
set city = 'chennai'
where customer_id = 1;
-- set SQL_SAFE_UPDATES = 1;
set sql_safe_updates = 1;

set sql_safe_updates = 0;
delete from customers 
where city = 'Bangalore';
set sql_safe_updates = 1;

create table products(
	product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10, 2),
    stock_quantity int,
    supplier_city varchar(50)
);
insert into products
values
	(1, 'Laptop', 'Electronics', 55000, 10, 'Hyderabad'),
    (2, 'washing-machine', 'Electronics', 42500, 24, 'Chennai');
update products 
set stock_quantity = 9
where product_id = 1;
delete from products where product_id = 2;

select * from products;