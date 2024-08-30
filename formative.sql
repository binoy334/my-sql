create  database global_store_db;
use global_store_db;
create table products(
product_id int auto_increment primary key,
name char(100),
price decimal(10, 2),
quantity int );

create table orders (order_id int auto_increment PRIMARY KEY,
 product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id));
  #2  
ALTER TABLE products
ADD COLUMN category CHAR(50) AFTER price;
#3
ALTER TABLE products
RENAME TO inventory;

#4

INSERT INTO inventory (name, price, quantity, category) VALUES
('Product 1', 110.00, 15, 'Electronics'),
('Product 2', 250.00, 10, 'Wood'),
('Product 3', 175.00, 30, 'Book'),
('Product 4', 270.00, 8, 'Furniture'),
('Product 5', 80.00, 12, 'Toys'),
('Product 6', 190.00, 2, 'Appliances'),
('Product 7', 120.00, 30, 'Electronics'),
('Product 8', 50.00, 7, 'Books'),
('Product 9', 140.00, 3, 'Toys'),
('Product 10', 350.00, 1, 'Furniture');


INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES
(4, 2, '2024-08-19'),
(6, 3, '2024-08-22'),
(1, 4, '2024-08-25'),
(5, 2, '2024-08-27'),
(8, 7, '2024-08-31');

SELECT * FROM inventory;
SELECT * FROM orders;
#5a
SELECT DISTINCT category FROM inventory;
#5b
SELECT * FROM inventory
ORDER BY price DESC
LIMIT 5;
#5c
select name from inventory where quantity > 10;
#5d
SELECT SUM(price * quantity) AS total_inventory_value FROM inventory;
#5e
SELECT category, COUNT(*) AS product_count FROM inventory GROUP BY category;
#5f
SELECT name, price FROM inventory where quantity = 0;
#6
CREATE VIEW expensive_products AS
SELECT * FROM inventory
WHERE price > (SELECT AVG(price) FROM inventory);
#7
SELECT inventory.name, orders.quantity_ordered 
FROM inventory
JOIN orders ON inventory.product_id = orders.product_id;
