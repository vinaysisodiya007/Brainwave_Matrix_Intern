# Online Store Database  

## Description  
The **Online Store Database** is a MySQL-based project designed to manage an e-commerce store. It includes tables for users, products, orders, and payments, providing a structured approach to handling an online shopping system.

## Features  
- **User Management**: Register, update, and manage users.  
- **Product Management**: Add, update, and categorize products.  
- **Order Processing**: Track purchases and order details.  
- **Payment System**: Store payment transaction details.  
- **Stock Management**: Monitor product availability.  

## Database Schema  

### Users Table  
```sql
mysql> CREATE TABLE users (
    ->     user_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(255) NOT NULL,
    ->     email VARCHAR(255) UNIQUE NOT NULL,
    ->     phone VARCHAR(15),
    ->     address TEXT,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.06 sec)
```

### Products Table

```
sql
mysql> CREATE TABLE products (
    ->     product_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(255) NOT NULL,
    ->     category VARCHAR(100),
    ->     price DECIMAL(10,2) NOT NULL,
    ->     stock INT DEFAULT 0,
    ->     description TEXT,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.04 sec)
```
### Orders Table
```
mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     user_id INT,
    ->     order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     total_amount DECIMAL(10,2),
    ->     status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    ->     FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.07 sec)
```
### Order items table
```
mysql> CREATE TABLE order_items (
    ->     order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     order_id INT,
    ->     product_id INT,
    ->     quantity INT,
    ->     subtotal DECIMAL(10,2),
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.05 sec)
````
### Payments Table
```
mysql> CREATE TABLE payments (
    ->     payment_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     order_id INT,
    ->     payment_method VARCHAR(50),
    ->     payment_status ENUM('Pending', 'Completed', 'Failed'),
    ->     transaction_id VARCHAR(100),
    ->     payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id)
    -> );
Query OK, 0 rows affected (0.04 sec)
```
### Shipping Table
```
mysql> CREATE TABLE shipping (
    ->     shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     order_id INT,
    ->     tracking_number VARCHAR(50),
    ->     carrier VARCHAR(100),
    ->     shipping_status ENUM('Processing', 'Shipped', 'Out for Delivery', 'Delivered'),
    ->     estimated_delivery DATE,
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id)
    -> );
Query OK, 0 rows affected (0.05 sec)
```
### Review Table
```
mysql> CREATE TABLE reviews (
    ->     review_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     user_id INT,
    ->     product_id INT,
    ->     rating INT CHECK (rating BETWEEN 1 AND 5),
    ->     comment TEXT,
    ->     review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (user_id) REFERENCES users(user_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.04 sec)
```
### Query Results
🔹Users Table
```
+---------+---------+---------------------+------------+------------------+---------------------+
| user_id | name    | email               | phone      | address          | created_at          |
+---------+---------+---------------------+------------+------------------+---------------------+
|       1 | Vinay   | Vinay@example.com   | 9876543210 | New York, USA    | 2025-03-08 22:36:26 |
|       2 | Navin   | Navin@example.com   | 8765432109 | Los Angeles, USA | 2025-03-08 22:36:26 |
|       3 | brother | brother@example.com | 7654321098 | Chicago, USA     | 2025-03-08 22:36:26 |
+---------+---------+---------------------+------------+------------------+---------------------+
```
🔹 Products Table
```
pgsql

+------------+----------------+---------------+--------+-------+---------------------------------------------------------+---------------------+
| product_id | name           | category      | price  | stock | description                                             | created_at          |
+------------+----------------+---------------+--------+-------+---------------------------------------------------------+---------------------+
|          1 | Laptop         | Electronics   | 800.00 |    10 | High-performance laptop with 16GB RAM and 512GB SSD.    | 2025-03-08 22:36:34 |
|          2 | Smartphone     | Electronics   | 500.00 |    15 | Latest model with a powerful camera and fast processor. | 2025-03-08 22:36:34 |
|          3 | Headphones     | Accessories   | 100.00 |    30 | Noise-canceling headphones with deep bass.              | 2025-03-08 22:36:34 |
|          4 | Gaming Console | Entertainment | 400.00 |     5 | Next-gen gaming console with 4K support.                | 2025-03-08 22:36:34 |
+------------+----------------+---------------+--------+-------+---------------------------------------------------------+---------------------+
```
🔹 Orders items (After Placing an Order)
```
+---------------+----------+------------+----------+----------+
| order_item_id | order_id | product_id | quantity | subtotal |
+---------------+----------+------------+----------+----------+
|             1 |        1 |          1 |        1 |   800.00 |
|             2 |        1 |          3 |        5 |   500.00 |
|             3 |        2 |          2 |        1 |   500.00 |
+---------------+----------+------------+----------+----------+
```
🔹 Payments Table (After Successful Payment)
```
+------------+----------+----------------+----------------+----------------+---------------------+
| payment_id | order_id | payment_method | payment_status | transaction_id | payment_date        |
+------------+----------+----------------+----------------+----------------+---------------------+
|          1 |        1 | Credit Card    | Completed      | TXN123456789   | 2025-03-08 22:36:53 |
|          2 |        2 | PayPal         | Completed      | TXN987654321   | 2025-03-08 22:36:53 |
+------------+----------+----------------+----------------+----------------+
```
🔹 Shipping Table 
```
+-------------+----------+-----------------+---------+-----------------+--------------------+
| shipping_id | order_id | tracking_number | carrier | shipping_status | estimated_delivery |
+-------------+----------+-----------------+---------+-----------------+--------------------+
|           1 |        2 | TRK12345        | DHL     | Shipped         | 2025-03-05         |
+-------------+----------+-----------------+---------+-----------------+--------------------+
```
🔹 Review Table
```
+-----------+---------+------------+--------+---------------------------------------------------+---------------------+
| review_id | user_id | product_id | rating | comment                                           | review_date         |
+-----------+---------+------------+--------+---------------------------------------------------+---------------------+
|         1 |       1 |          1 |      5 | Excellent laptop with great performance.          | 2025-03-08 22:37:04 |
|         2 |       2 |          2 |      4 | Good smartphone but battery life could be better. | 2025-03-08 22:37:04 |
|         3 |       3 |          3 |      5 | Best headphones for music lovers.                 | 2025-03-08 22:37:04 |
+-----------+---------+------------+--------+---------------------------------------------------+---------------------+
```
## Implementation 

[![Watch the video](https://img.youtube.com/vi/zOMe8Q1SnG0/hqdefault.jpg)](https://youtu.be/zOMe8Q1SnG0)  

Click on the image above to watch the full video on YouTube! 
