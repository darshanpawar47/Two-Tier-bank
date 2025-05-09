-- Create the database
CREATE DATABASE IF NOT EXISTS bankdb;

-- Use the database
USE bankdb;

-- Create the account table
CREATE TABLE IF NOT EXISTS account (
    account_number VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) DEFAULT 0.00
);

-- Create the transactions table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20),
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_number) REFERENCES account(account_number)
);

-- Insert sample data
INSERT INTO account (account_number, customer_name, balance) VALUES
    ('1234567890', 'John Doe', 1000.00),
    ('0987654321', 'Jane Smith', 500.00);

INSERT INTO transactions (account_number, transaction_type, amount) VALUES
    ('1234567890', 'DEPOSIT', 1000.00),
    ('0987654321', 'DEPOSIT', 500.00);