CREATE DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    reorder_level INT NOT NULL,
    supplier_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    order_quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
);

INSERT INTO suppliers
(supplier_name, contact_person, phone, email, address)
VALUES
('ABC Suppliers', 'John Smith', '9876543210',
 'john@abc.com', 'Chennai'),
('Global Traders', 'David Lee', '9876543211',
 'david@global.com', 'Coimbatore');
 
 INSERT INTO inventory
(item_name, quantity, reorder_level, supplier_id, unit_price)
VALUES
('Laptop', 50, 20, 1, 45000.00),
('Mouse', 15, 25, 2, 500.00),
('Keyboard', 40, 15, 2, 1200.00);

INSERT INTO inventory
(item_name, quantity, reorder_level, supplier_id, unit_price)
VALUES
('Monitor', 30, 10, 1, 12000.00);

SELECT * FROM inventory;

SELECT i.item_name,
       i.quantity,
       s.supplier_name
FROM inventory i
JOIN suppliers s
ON i.supplier_id = s.supplier_id;

UPDATE inventory
SET quantity = 60
WHERE item_id = 1;

DELETE FROM inventory
WHERE item_id = 4;

DELIMITER $$

CREATE PROCEDURE AutoReorder()
BEGIN
    INSERT INTO orders (item_id, order_quantity, status)
    SELECT
        item_id,
        (reorder_level * 2) - quantity,
        'Auto-Reordered'
    FROM inventory
    WHERE quantity < reorder_level;
END $$

DELIMITER ;

CALL AutoReorder();

DELIMITER $$

CREATE TRIGGER trg_auto_reorder
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    IF NEW.quantity < NEW.reorder_level THEN

        INSERT INTO orders
        (
            item_id,
            order_quantity,
            status
        )
        VALUES
        (
            NEW.item_id,
            (NEW.reorder_level * 2) - NEW.quantity,
            'Triggered Reorder'
        );

    END IF;
END $$

DELIMITER ;

SELECT * FROM orders;