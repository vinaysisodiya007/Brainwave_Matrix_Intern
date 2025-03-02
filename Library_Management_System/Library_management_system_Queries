
-- Create Database
mysql> CREATE DATABASE LibraryDB;
mysql> USE LibraryDB;

-- Create Users Table

mysql> CREATE TABLE users(
    -> user_id INT PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(255) NOT NULL,
    -> email VARCHAR(255) UNIQUE,
    -> phone VARCHAR(15),
    -> user_type ENUM('student','staff') NOT NULL
    -> );

-- Create Books Table

mysql> CREATE TABLE books(
    -> book_id INT PRIMARY KEY AUTO_INCREMENT,
    -> title VARCHAR(255) NOT NULL,
    -> author VARCHAR(255),
    -> genre VARCHAR(100),
    -> year INT,
    -> total_copies INT,
    -> available INT
    -> );

-- Create Issued Books Table

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

-- Create fine Table

mysql> CREATE TABLE fines(
    -> fine_id INT PRIMARY KEY AUTO_INCREMENT,
    -> user_id INT,
    -> amount DECIMAL(10,2),
    -> paid BOOLEAN DEFAULT FALSE,
    -> FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );

-- Insert Sample Data

mysql> INSERT INTO books(title,author,genre,year,total_copies,available)
    -> VALUES ('THE ALCHEMIST','Paulo Coelho','fiction',1988,5,5);

mysql> INSERT INTO books(title,author,genre,year,total_copies,available)
    -> VALUES ('Ramcharitmanas','Tulsidas ji','mythology',1576,10,10);

mysql> INSERT INTO books(title,author,genre,year,total_copies,available)
    -> VALUES('How to get rich in 5 minutes','Vinay','Self help',2024,15,15);

mysql> INSERT INTO users (name,email,phone,user_type)
    -> VALUES ('Navin','navin@gmail.com','9765485426','student');

mysql> INSERT INTO users(name,email,phone,user_type)
    -> VALUES ('Maruti','sevak@gmail.com','1019198513','student');

-- Issue a Book

mysql> INSERT INTO issuedbooks(book_id,user_id,issue_date,return_date)
    -> VALUES (1,1,CURDATE(),DATE_ADD(CURDATE(),INTERVAL 14 DAY));

-- Return a Book
mysql> UPDATE issuedbooks SET status = 'returned' WHERE issue_id = 1;

mysql> UPDATE books SET available = available + 1 WHERE book_id = 1;

-- View Issued Books
SELECT * FROM issuedbooks;

-- Check Book Availability
SELECT available FROM books WHERE title = 'book_name';


