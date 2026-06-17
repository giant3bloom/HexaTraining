CREATE DATABASE customer_order_tracker;
USE customer_order_tracker;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    product_name VARCHAR(100),
    quantity INT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE delivery_status (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status VARCHAR(50),
    expected_delivery DATE,
    actual_delivery DATE,
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

INSERT INTO customers(customer_name,email,phone)
VALUES
('Rahul','rahul@gmail.com','9876543210'),
('Priya','priya@gmail.com','9876543211');

INSERT INTO orders(customer_id,order_date,product_name,quantity)
VALUES
(1,'2026-06-01','Laptop',1),
(2,'2026-06-02','Mobile',2);

INSERT INTO delivery_status(order_id,status,expected_delivery,actual_delivery)
VALUES
(1,'Delivered','2026-06-05','2026-06-07'),
(2,'In Transit','2026-06-06',NULL);

INSERT INTO orders(customer_id,order_date,product_name,quantity)
VALUES (1,CURDATE(),'Headphones',1);

SELECT * FROM orders;

UPDATE orders
SET quantity = 3
WHERE order_id = 2;

DELETE FROM orders
WHERE order_id = 3;

DELIMITER $$

CREATE PROCEDURE GetDelayedDeliveries(
    IN p_customer_id INT
)
BEGIN
    SELECT
        c.customer_name,
        o.order_id,
        o.product_name,
        d.expected_delivery,
        d.actual_delivery
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN delivery_status d
        ON o.order_id = d.order_id
    WHERE c.customer_id = p_customer_id
    AND d.actual_delivery > d.expected_delivery;
END$$

DELIMITER ;

CALL GetDelayedDeliveries(1);

