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
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);
```
### Products Table
```
sql

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);
```
### Orders Table
```
sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```
### Payments Table
```
sql
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status ENUM('Pending', 'Completed', 'Failed'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```
### Query Results
🔹Users Table
```
+---------+-------+-------------------+------------+-----------------+
| user_id | name  | email             | phone      | address         |
+---------+-------+-------------------+------------+-----------------+
| 1       | Vinay | Vinay@gmail.com   | 9876543210 |     Germany     |
+---------+-------+-------------------+------------+-----------------+
```
🔹 Products Table
```
pgsql

+------------+----------------+----------+-------+-------+
| product_id | name           | category | price | stock |
+------------+----------------+----------+-------+-------+
| 1          | Laptop         | Electronics | 500.00 | 10 |
+------------+----------------+----------+-------+-------+
```
🔹 Orders Table (After Placing an Order)
```
+---------+---------+------------+-------------+
| order_id| user_id | order_date | total_amount|
+---------+---------+------------+-------------+
| 1       | 1       | 2025-02-27 | 80000.00      |
+---------+---------+------------+-------------+
```
🔹 Payments Table (After Successful Payment)
```
+------------+---------+--------------+----------------+
| payment_id | order_id | payment_method | payment_status |
+------------+---------+--------------+----------------+
| 1          | 1       | Credit Card    | Completed     |
+------------+---------+--------------+----------------+
```
📽️ Demo Video


🔗 Watch on YouTube
