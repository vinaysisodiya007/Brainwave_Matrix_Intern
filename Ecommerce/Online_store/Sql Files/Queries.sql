-- Switch to the Ecommerce database
USE Ecommerce;

-- Creating the users table to store user information
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each user
    name VARCHAR(255) NOT NULL, -- Name of the user
    email VARCHAR(255) UNIQUE NOT NULL, -- Unique email for each user
    phone VARCHAR(15), -- Contact number
    address TEXT, -- Address details
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the user is created
);

-- Creating the products table to store product details
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each product
    name VARCHAR(255) NOT NULL, -- Product name
    category VARCHAR(100), -- Product category
    price DECIMAL(10,2) NOT NULL, -- Price of the product
    stock INT DEFAULT 0, -- Available stock count
    description TEXT, -- Product description
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the product is added
);

-- Creating the orders table to store order details
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each order
    user_id INT, -- Foreign key linking to the users table
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Order creation timestamp
    total_amount DECIMAL(10,2), -- Total cost of the order
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending', -- Order status
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Foreign key constraint
);

-- Creating the order_items table to store items in each order
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each order item
    order_id INT, -- Foreign key linking to the orders table
    product_id INT, -- Foreign key linking to the products table
    quantity INT, -- Quantity of the product ordered
    subtotal DECIMAL(10,2), -- Subtotal cost of the item(s)
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Foreign key constraint
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Foreign key constraint
);

-- Creating the payments table to store payment details
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each payment
    order_id INT, -- Foreign key linking to the orders table
    payment_method VARCHAR(50), -- Payment method used (e.g., Credit Card, PayPal)
    payment_status ENUM('Pending', 'Completed', 'Failed'), -- Payment status
    transaction_id VARCHAR(100), -- Unique transaction ID
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the payment was made
    FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Foreign key constraint
);

-- Creating the shipping table to store shipping details
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each shipment
    order_id INT, -- Foreign key linking to the orders table
    tracking_number VARCHAR(50), -- Tracking number for shipment
    carrier VARCHAR(100), -- Shipping carrier (e.g., DHL, FedEx)
    shipping_status ENUM('Processing', 'Shipped', 'Out for Delivery', 'Delivered'), -- Shipping status
    estimated_delivery DATE, -- Estimated delivery date
    FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Foreign key constraint
);

-- Creating the reviews table to store product reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each review
    user_id INT, -- Foreign key linking to the users table
    product_id INT, -- Foreign key linking to the products table
    rating INT CHECK (rating BETWEEN 1 AND 5), -- Rating between 1 to 5
    comment TEXT, -- Review comment
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the review was added
    FOREIGN KEY (user_id) REFERENCES users(user_id), -- Foreign key constraint
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Foreign key constraint
);

-- Inserting sample users
INSERT INTO users (name, email, phone, address) VALUES
    ('Vinay', 'Vinay@example.com', '9876543210', 'New York, USA'),
    ('Navin', 'Navin@example.com', '8765432109', 'Los Angeles, USA'),
    ('Brother', 'brother@example.com', '7654321098', 'Chicago, USA');

-- Inserting sample products
INSERT INTO products (name, category, price, stock, description) VALUES
    ('Laptop', 'Electronics', 800.00, 10, 'High-performance laptop with 16GB RAM and 512GB SSD.'),
    ('Smartphone', 'Electronics', 500.00, 15, 'Latest model with a powerful camera and fast processor.'),
    ('Headphones', 'Accessories', 100.00, 30, 'Noise-canceling headphones with deep bass.'),
    ('Gaming Console', 'Entertainment', 400.00, 5, 'Next-gen gaming console with 4K support.');

-- Inserting sample orders
INSERT INTO orders (user_id, total_amount, status) VALUES
    (1, 1300.00, 'Pending'),
    (2, 500.00, 'Shipped');

-- Inserting sample order items
INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES
    (1, 1, 1, 800.00), -- Order 1: 1 Laptop
    (1, 3, 5, 500.00), -- Order 1: 5 Headphones
    (2, 2, 1, 500.00); -- Order 2: 1 Smartphone

-- Inserting sample payments
INSERT INTO payments (order_id, payment_method, payment_status, transaction_id) VALUES
    (1, 'Credit Card', 'Completed', 'TXN123456789'), -- Payment for Order 1
    (2, 'PayPal', 'Completed', 'TXN987654321'); -- Payment for Order 2

-- Inserting sample shipping details
INSERT INTO shipping (order_id, tracking_number, carrier, shipping_status, estimated_delivery) VALUES
    (2, 'TRK12345', 'DHL', 'Shipped', '2025-03-05'); -- Shipping details for Order 2

-- Inserting sample reviews
INSERT INTO reviews (user_id, product_id, rating, comment) VALUES
    (1, 1, 5, 'Excellent laptop with great performance.'), -- Review for Laptop
    (2, 2, 4, 'Good smartphone but battery life could be better.'), -- Review for Smartphone
    (3, 3, 5, 'Best headphones for music lovers.'); -- Review for Headphones
