-- =========================
-- Database: Retail Capstone Project
-- Description: This database is designed to support a retail business.
-- =========================
create database retail_capstone_db;
use retail_capstone_db;

-- =========================
-- Table Creation
-- =========================

create table customers(
    customer_id int primary key,
    customer_name varchar(100),
    city varchar(50),
    state varchar(50),
    gender varchar(10),
    membership_type varchar(30)
);

create table products(
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2)
);

create table orders(
    order_id int primary key,
    customer_id int,
    order_date date,
    order_status varchar(30),
    foreign key (customer_id) references customers(customer_id)
);

create table order_items(
    item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
); 

create table payments(
    payment_id int primary key,
    order_id int,
    payment_mode varchar(30),
    payment_status varchar(30),
    amount decimal(10,2),
    foreign key (order_id) references orders(order_id)
);

create table deliveries(
    delivery_id int primary key,
    order_id int,
    delivery_partner varchar(50),
    delivery_status varchar(30),
    delivery_city varchar(50),
    foreign key (order_id) references orders(order_id)
);

-- =========================
-- Customers
-- =========================
insert into customers values
    (1, 'Arun Kumar', 'Chennai', 'Tamil Nadu', 'Male', 'Gold'),
    (2, 'Priya Sharma', 'Coimbatore', 'Tamil Nadu', 'Female', 'Silver'),
    (3, 'Rahul Verma', 'Bangalore', 'Karnataka', 'Male', 'Platinum'),
    (4, 'Sneha Iyer', 'Chennai', 'Tamil Nadu', 'Female', 'Gold'),
    (5, 'Vikram Singh', 'Hyderabad', 'Telangana', 'Male', 'Silver'),
    (6, 'Aisha Khan', 'Mumbai', 'Maharashtra', 'Female', 'Gold'),
    (7, 'Karan Patel', 'Ahmedabad', 'Gujarat', 'Male', 'Bronze'),
    (8, 'Meena Das', 'Kolkata', 'West Bengal', 'Female', 'Silver'),
    (9, 'Rohit Jain', 'Delhi', 'Delhi', 'Male', 'Gold'),
    (10, 'Divya Nair', 'Coimbatore', 'Tamil Nadu', 'Female', 'Platinum');

-- =========================
-- Products
-- =========================
insert into products values
    (101, 'iPhone 15', 'Electronics', 79999.00),
    (102, 'Samsung Galaxy S24', 'Electronics', 69999.00),
    (103, 'Dell Laptop', 'Electronics', 55000.00),
    (104, 'Nike Shoes', 'Fashion', 4500.00),
    (105, 'Levis Jeans', 'Fashion', 2500.00),
    (106, 'Wooden Table', 'Furniture', 7000.00),
    (107, 'Office Chair', 'Furniture', 5000.00),
    (108, 'Mixer Grinder', 'Home Appliances', 3500.00),
    (109, 'Air Fryer', 'Home Appliances', 6000.00),
    (110, 'Smart Watch', 'Electronics', 12000.00);

-- =========================
-- Orders
-- =========================
insert into orders values
    (1001, 1, '2026-01-05', 'Delivered'),
    (1002, 2, '2026-01-07', 'Delivered'),
    (1003, 3, '2026-01-10', 'Cancelled'),
    (1004, 1, '2026-01-11', 'Delivered'),
    (1005, 4, '2026-01-13', 'Pending'),
    (1006, 5, '2026-01-15', 'Delivered'),
    (1007, 6, '2026-01-18', 'Shipped'),
    (1008, 7, '2026-01-19', 'Cancelled'),
    (1009, 8, '2026-01-20', 'Delivered'),
    (1010, 9, '2026-01-22', 'Pending'),
    (1011, 10, '2026-01-23', 'Delivered'),
    (1012, 2, '2026-01-24', 'Delivered'),
    (1013, 3, '2026-01-25', 'Shipped'),
    (1014, 6, '2026-01-26', 'Pending'),
    (1015, 4, '2026-01-27', 'Delivered');

-- =========================
-- Order Items
-- =========================
insert into order_items values
    (1, 1001, 101, 1),
    (2, 1001, 110, 2),
    (3, 1002, 104, 1),
    (4, 1002, 105, 2),
    (5, 1003, 103, 1),
    (6, 1004, 108, 1),
    (7, 1004, 109, 1),
    (8, 1005, 106, 1),
    (9, 1005, 107, 2),
    (10, 1006, 102, 1),
    (11, 1007, 101, 1),
    (12, 1007, 104, 1),
    (13, 1008, 105, 3),
    (14, 1009, 106, 1),
    (15, 1009, 110, 1),
    (16, 1010, 103, 1),
    (17, 1011, 109, 2),
    (18, 1012, 104, 2),
    (19, 1013, 102, 1),
    (20, 1014, 108, 2),
    (21, 1015, 107, 1),
    (22, 1015, 110, 1);

-- =========================
-- Payments
-- =========================
insert into payments values
    (201, 1001, 'Credit Card', 'Success', 103999.00),
    (202, 1002, 'UPI', 'Success', 9500.00),
    (203, 1003, 'Debit Card', 'Failed', 55000.00),
    (204, 1004, 'Net Banking', 'Success', 9500.00),
    (205, 1005, 'UPI', 'Pending', 17000.00),
    (206, 1006, 'Credit Card', 'Success', 69999.00),
    (207, 1007, 'Debit Card', 'Success', 84499.00),
    (208, 1008, 'UPI', 'Failed', 7500.00),
    (209, 1009, 'Cash on Delivery', 'Success', 19000.00),
    (210, 1010, 'Credit Card', 'Pending', 55000.00),
    (211, 1011, 'UPI', 'Success', 12000.00),
    (212, 1012, 'Net Banking', 'Success', 9000.00),
    (213, 1013, 'Debit Card', 'Success', 69999.00),
    (214, 1014, 'UPI', 'Pending', 7000.00),
    (215, 1015, 'Cash on Delivery', 'Success', 17000.00);

-- =========================
-- Deliveries
-- =========================
insert into deliveries values
    (301, 1001, 'BlueDart', 'Delivered', 'Chennai'),
    (302, 1002, 'DTDC', 'Delivered', 'Coimbatore'),
    (303, 1003, 'Delhivery', 'Cancelled', 'Bangalore'),
    (304, 1004, 'Ekart', 'Delivered', 'Chennai'),
    (305, 1005, 'BlueDart', 'Pending', 'Chennai'),
    (306, 1006, 'DTDC', 'Delivered', 'Hyderabad'),
    (307, 1007, 'Ekart', 'In Transit', 'Mumbai'),
    (308, 1008, 'Delhivery', 'Cancelled', 'Ahmedabad'),
    (309, 1009, 'BlueDart', 'Delivered', 'Kolkata'),
    (310, 1010, 'DTDC', 'Pending', 'Delhi'),
    (311, 1011, 'Ekart', 'Delivered', 'Coimbatore'),
    (312, 1012, 'BlueDart', 'Delivered', 'Coimbatore'),
    (313, 1013, 'Delhivery', 'In Transit', 'Bangalore'),
    (314, 1014, 'DTDC', 'Pending', 'Mumbai'),
    (315, 1015, 'Ekart', 'Delivered', 'Chennai');

-- =========================
-- Basic Queries
-- =========================
select * from customers;
select customer_name, city, membership_type from customers;
select * from products order by price desc;
select * from customers where city = 'Hyderabad';
select * from customers where membership_type = 'Gold';
select * from products where price between 500 and 5000;
select * from products where category in ('Electronics', 'Fashion');
select * from orders where order_date >= '2026-01-01';
select * from payments where payment_mode = 'UPI';
select * from deliveries where delivery_status = 'Pending';

-- =========================
-- Aggregate Queries
-- =========================
select count(*) as total_customers from customers;
select count(*) as total_orders from orders;
select count(*) as total_products from products;
select sum(amount) as total_revenue from payments where payment_status = 'Success';
select avg(amount) as average_payment from payments where payment_status = 'Success';
select max(amount) as max_payment from payments where payment_status = 'Success';
select min(amount) as min_payment from payments where payment_status = 'Success';
select city, count(customer_id) as customers_per_city from customers group by city;
select category, count(product_id) as products_per_category from products group by category;
select order_status, count(order_id) as orders_per_status from orders group by order_status;

-- =========================
-- Join Queries
-- =========================
select o.order_id, c.customer_name, o.order_date from orders o 
    join customers c on o.customer_id = c.customer_id;
select oi.order_id, p.product_name, oi.quantity, p.price from order_items oi
    join products p on oi.product_id = p.product_id;
select c.customer_name, p.product_name, oi.quantity, o.order_date from order_items oi
    join products p on oi.product_id = p.product_id
    join orders o on oi.order_id = o.order_id
    join customers c on o.customer_id = c.customer_id;
select o.order_id, py.payment_mode, py.payment_status, py.amount from orders o
    join payments py on o.order_id = py.order_id;
select o.order_id, d.delivery_partner, d.delivery_status from orders o
    join deliveries d on o.order_id = d.order_id;
select 
    c.customer_name, c.city, o.order_id, o.order_date,
    p.product_name, p.category, oi.quantity, p.price,
    py.payment_status, py.payment_mode, d.delivery_status 
from orders o
    join customers c on o.customer_id = c.customer_id
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    join payments py on o.order_id = py.order_id
    join deliveries d on o.order_id = d.order_id;

-- =========================
-- Group by and having Queries
-- =========================
select c.city, sum(p.price * oi.quantity) as total_revenue from customers c
    join orders o on c.customer_id = o.customer_id
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
group by c.city;

select c.customer_name, sum(p.price * oi.quantity) as total_spent from customers c
    join orders o on c.customer_id = o.customer_id
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
group by c.customer_name;

select p.product_name, sum(oi.quantity) as total_sold from products p
    join order_items oi on p.product_id = oi.product_id
group by p.product_name;

select p.category, sum(oi.quantity * p.price) as revenue_per_category from products p
    join order_items oi on p.product_id = oi.product_id
group by p.category;

select c.customer_name, count(o.order_id) as total_orders from customers c 
    join orders o on c.customer_id = o.customer_id
group by c.customer_name;

select c.customer_name from customers c 
    join orders o on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) > 1;

select p.category from products p
    join order_items oi on p.product_id = oi.product_id
group by p.category
having sum(oi.quantity * p.price) > 10000;

select c.city from customers c 
group by c.city
having count(customer_id) > 2;

select p.product_name from products p 
    join order_items oi on p.product_id = oi.product_id
group by p.product_name
having sum(oi.quantity) > 3;

-- =========================
-- Subqueries
-- =========================
select c.customer_name from customers c 
where c.customer_id in (
    select distinct o.customer_id from orders o
);

select c.customer_name from customers c
where c.customer_id not in (
    select distinct o.customer_id from orders o
);

select p.product_name from products p 
where p.product_id not in (
    select distinct oi.product_id from order_items oi
);

select * from orders o
    join payments py on o.order_id = py.order_id
where py.amount > (
    select avg(amount) from payments where payment_status = 'Success'
);

select * from customers c 
where c.customer_id in (
    select o.customer_id from orders o
        join payments py on o.order_id = py.order_id
    where py.amount = (
        select max(amount) from payments where payment_status = 'Success'
    )
);

select price from products p
where p.price > (
    select avg(price) from products
);

select c.customer_name from customers c 
where c.customer_id in (
    select o.customer_id from orders o
        join order_items oi on o.order_id = oi.order_id
        join products p on oi.product_id = p.product_id
    where p.category = 'Electronics'
);

select * from orders o
where o.order_id in (
    select py.order_id from payments py
    where py.payment_status = 'Success'
);

select * from orders o 
where o.order_id not in (
    select d.order_id from deliveries d
    where d.delivery_status = 'Delivered'
);

select c.customer_name
from customers c
    join orders o on c.customer_id = o.customer_id
    join payments p on o.order_id = p.order_id
where p.amount > (
    select avg(amount)
    from payments
    where payment_status = 'Success'
);

select c.customer_name
from customers c
    join orders o on c.customer_id = o.customer_id
    join payments p on o.order_id = p.order_id
where p.payment_status = 'Success'
group by c.customer_id, c.customer_name
having sum(p.amount) > (
    select avg(total_spending)
    from (
        select sum(p2.amount) as total_spending
        from orders o2
        join payments p2 on o2.order_id = p2.order_id
        where p2.payment_status = 'Success'
        group by o2.customer_id
    ) as avg_table
);

-- =========================
-- Data Integrity Checks
-- =========================
select * from orders o 
where o.order_id not in (
    select distinct py.order_id from payments py
);

select * from orders o
where o.order_id not in (
    select distinct d.order_id from deliveries d
);

select * from payments py 
where py.amount = 0 or py.amount is null;

select * from orders o 
where o.order_status = 'Cancelled' and o.order_id in (
    select distinct py.order_id from payments py
    where py.payment_status = 'Success'
);

select * from orders o
    join deliveries d on o.order_id = d.order_id
    join payments py on o.order_id = py.order_id
where d.delivery_status = 'Delivered' and py.payment_status = 'Failed';

select * from orders o 
    join order_items oi on o.order_id = oi.order_id
where oi.product_id not in (
    select distinct product_id from products
);

select * from orders o
where o.customer_id not in (
    select distinct c.customer_id from customers c
);
