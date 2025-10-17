-- Create database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_books_author_id ON Books(author_id);
CREATE INDEX idx_books_title ON Books(title);
CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
CREATE INDEX idx_orders_order_date ON Orders(order_date);
CREATE INDEX idx_order_details_order_id ON Order_Details(order_id);
CREATE INDEX idx_order_details_book_id ON Order_Details(book_id);
CREATE INDEX idx_customers_email ON Customers(email);

-- Insert sample data
INSERT INTO Authors (author_name) VALUES 
('J.K. Rowling'),
('George Orwell'),
('Agatha Christie'),
('Stephen King'),
('J.R.R. Tolkien');

INSERT INTO Customers (customer_name, email, address) VALUES 
('John Smith', 'john.smith@email.com', '123 Main St, New York, NY'),
('Maria Garcia', 'maria.garcia@email.com', '456 Oak Ave, Los Angeles, CA'),
('David Johnson', 'david.johnson@email.com', '789 Pine Rd, Chicago, IL');

INSERT INTO Books (title, author_id, price, publication_date) VALUES 
('Harry Potter and the Philosopher''s Stone', 1, 12.99, '1997-06-26'),
('1984', 2, 9.99, '1949-06-08'),
('Murder on the Orient Express', 3, 8.99, '1934-01-01'),
('The Shining', 4, 11.99, '1977-01-28'),
('The Hobbit', 5, 10.99, '1937-09-21'),
('Harry Potter and the Chamber of Secrets', 1, 13.99, '1998-07-02');

INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2024-01-15'),
(2, '2024-01-16'),
(3, '2024-01-17'),
(1, '2024-01-18');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES 
(1, 1, 2.0),
(1, 3, 1.0),
(2, 2, 1.0),
(2, 4, 1.0),
(3, 5, 3.0),
(4, 6, 1.0),
(4, 2, 2.0);
