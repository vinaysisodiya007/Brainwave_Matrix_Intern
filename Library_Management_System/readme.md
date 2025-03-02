# Library Management System

## Description
The **Library Management System** is a MySQL-based project that allows users to manage books, issue and return books, and maintain user records. This system provides a simple and efficient way to track book availability and user transactions.

## Features
- **User Management**: Add, view, and manage library users.
- **Book Management**: Add books, categorize them, and check availability.
- **Issuing Books**: Issue books to users with a return date.
- **Returning Books**: Track and manage book returns.
- **Query System**: Retrieve user details, issued books, and book availability.

## Database Schema

### Users Table
```sql
mysql> CREATE TABLE users(
    -> user_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(255) NOT NULL,
    -> email VARCHAR(255) UNIQUE,
    -> phone VARCHAR(15),
    -> user_type ENUM('student','staff') NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)
```
### Books Table
```sql
mysql> CREATE TABLE books(
    -> book_id INT PRIMARY KEY AUTO_INCREMENT,
    -> title VARCHAR(255) NOT NULL,
    -> author VARCHAR(255),
    -> genre VARCHAR(100),
    -> year INT,
    -> total_copies INT,
    -> available INT
    -> );
Query OK, 0 rows affected (0.02 sec)
```
### Issued Books Table
```sql
mysql> CREATE TABLE issuedbooks(
    -> issue_id INT PRIMARY KEY AUTO_INCREMENT,
    -> book_id INT,
    -> user_id INT,
    -> issue_date DATE,
    -> return_date DATE,
    -> status ENUM('issued','returned') DEFAULT 'issued',
    -> FOREIGN KEY (book_id) REFERENCES books(book_id),
    -> FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.03 sec)
```
### fines Table
```
mysql> CREATE TABLE fines(
    -> fine_id INT PRIMARY KEY AUTO_INCREMENT,
    -> user_id INT,
    -> amount DECIMAL(10,2),
    -> paid BOOLEAN DEFAULT FALSE,
    -> FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );
Query OK, 0 rows affected (0.02 sec)
```
### Query Results
### Users Table
```
+---------+--------+-----------------+------------+-----------+
| user_id | name   | email           | phone      | user_type |
+---------+--------+-----------------+------------+-----------+
|       1 | Navin  | navin@gmail.com | 9765485426 | student   |
|       2 | Maruti | sevak@gmail.com | 1019198513 | student   |
+---------+--------+-----------------+------------+-----------+
```
### Books Table
```
+---------+------------------------------+--------------+-----------+------+--------------+-----------+
| book_id | title                        | author       | genre     | year | total_copies | available |
+---------+------------------------------+--------------+-----------+------+--------------+-----------+
|       1 | THE ALCHEMIST                | Paulo Coelho | fiction   | 1988 |            5 |         5 |
|       2 | Ramcharitmanas               | Tulsidas ji  | mythology | 1576 |           10 |         9 |
|       3 | How to get rich in 5 minutes | Vinay        | Self help | 2024 |           15 |        15 |
+---------+------------------------------+--------------+-----------+------+--------------+-----------+
```
### Issued Books Table (After Issuing a Book)
```
+----------+---------+---------+------------+-------------+--------+
| issue_id | book_id | user_id | issue_date | return_date | status |
+----------+---------+---------+------------+-------------+--------+
|        2 |       2 |       2 | 2025-02-27 | 2025-03-16  | issued |
+----------+---------+---------+------------+-------------+--------+
```

### Issued Books Table (After Returning a Book)
```
+----------+---------+---------+------------+-------------+----------+
| issue_id | book_id | user_id | issue_date | return_date | status   |
+----------+---------+---------+------------+-------------+----------+
|        1 |       1 |       1 | 2025-03-02 | 2025-03-16  | returned |
|        2 |       2 |       2 | 2025-02-27 | 2025-03-16  | issued   |
+----------+---------+---------+------------+-------------+----------+
```
### Check Book Availability
```+----------------+-----------+
| title          | available |
+----------------+-----------+
| Ramcharitmanas |         9 |
+----------------+-----------+
```

## 📽️ Implementation 

[![Library Management System Demo](https://img.youtube.com/vi/sr-aMJeE0m8/hqdefault.jpg)](https://youtu.be/sr-aMJeE0m8)  

🔗 [Watch here](https://youtu.be/sr-aMJeE0m8)


#### Author: Vinay Sisodiya

