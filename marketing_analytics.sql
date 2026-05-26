-- =========================================================
-- DATABASE SCHEMA & MARKETING ANALYTICS QUERIES
-- Project: Glamping Saccargia Relational Infrastructure
-- =========================================================

-- 1. ACCOMMODATION SCHEMA
CREATE TABLE Accommodation_Types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    base_price_per_night DECIMAL(10,2) NOT NULL,
    max_capacity INT NOT NULL
);

-- 2. CUSTOMER REGISTRY (CRM HUB)
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    acquisition_channel VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. RESERVATION SYSTEM MATRIX
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    type_id INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount_paid DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Accommodation_Types(type_id)
);

-- 4. CUSTOMER LIFETIME VALUE (CLV) & CHANNEL PERFORMANCE AUDIT
SELECT 
    c.acquisition_channel AS marketing_channel,
    COUNT(DISTINCT c.customer_id) AS total_customers_acquired,
    COUNT(b.booking_id) AS total_bookings_generated,
    SUM(b.total_amount_paid) AS total_revenue,
    ROUND(AVG(b.total_amount_paid), 2) AS average_order_value,
    ROUND(SUM(b.total_amount_paid) / COUNT(DISTINCT c.customer_id), 2) AS customer_lifetime_value
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.booking_status = 'Confirmed'
GROUP c.acquisition_channel
ORDER BY total_revenue DESC;
