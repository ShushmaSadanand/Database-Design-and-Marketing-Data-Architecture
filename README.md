# Database Design & Marketing Data Architecture Portfolio

Welcome to the data infrastructure section of my portfolio. This space showcases relational database engineering, data modeling pipelines, and architecture solutions designed to capture omnichannel customer interactions, structure transactional loops, and drive localized economic ecosystems.

---

## Project: Relational Database System (RDBMS) & Tour Architecture (Glamping Saccargia)
**File:** `DBMS fro Glamping Sccargia.pdf` (Data Modeling & Structural Schema Deck)

An enterprise-ready relational database architecture designed from scratch for **Glamping Saccargia** in Sardinia, Italy. The database re-engineers the customer journey—transforming passive, single-stop historical site visitors (the Basilica di Saccargia) into multi-day eco-tourists by systematically mapping localized tour bookings, local business promotional assets, and on-demand transit networks.

### Core Data Engineering & Architectural Insights
* **Entity-Relationship (ER) System Modeling:** Architected a robust conceptual data schema modeling the complete tourist lifecycle. The system orchestrates core physical and transactional entities, including `Tourists`, `Bookings`, `Attractions`, `Local_Businesses`, `Guides`, and `Shuttle_Schedules`.
* **Relational Normalization & Constraints Integrity:** Mapped rigorous candidate keys, structural constraints, and strict cardinality rules to prevent duplicate anomalies and enforce referential integrity across tables:
  * **`Shuttle_Schedule` Table:** Enforces an absolute `PK [Shuttle_ID]` coupled with an auto-increment flag. Integrates a foreign key `FK [Route_ID]` referencing the path matrix to dynamically handle real-time logistical updates.
  * **`Shuttle_Route` Table:** Implements a localized `PK [Route_ID]` with predefined character constraints (`Route_name VARCHAR(30)`, `Start_point VARCHAR(50)`, `End_point VARCHAR(50)`) to standardize geographic validation.
* **Customer Journey Retention Loops:** Designed the structural schema to link accommodation reservations directly to dynamic package IDs and specialized local vendor lookup tables. This empowers marketing automation tools to deliver hyper-targeted, personalized location-based notifications and cross-selling workflows.
* **Data-Driven Sustainable Impact:** Engineered the database to serve as a centralized system that tracks tourism distribution metrics, enabling local operators to shift demand away from oversaturated areas toward minor, under-visited regional archeological sites and small cultural businesses.

### Key Competencies Demonstrated
* Relational Database Management Systems (RDBMS) Design & Normalization
* Conceptual Data Modeling & Entity-Relationship Diagramming (ERDs)
* Schema Structural Engineering (Primary Keys, Foreign Keys, Constraints, Data Types)
* Analytics Engineering, Customer Data Architecture, & Data-Driven Personalization


---

## Relational Schema & Analytical SQL Engine
**Database Paradigm:** Relational Database Management System (RDBMS)  
**Core Objective:** Translate physical business requirements (The Glamping Saccargia Project) into normalized tables and run high-value marketing queries.

### 1. Data Definition Language (DDL) Schema
This normalized schema enforces referential integrity across your customer records, accommodation types, bookings, and platform marketing interactions:

```sql
-- 1. Accommodation Categories
CREATE TABLE Accommodation_Types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL, -- e.g., Luxury Tent, Eco-Pod, Suite Dome
    base_price_per_night DECIMAL(10,2) NOT NULL,
    max_capacity INT NOT NULL
);

-- 2. Customer Registry (CRM Hub)
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    acquisition_channel VARCHAR(50), -- e.g., Instagram Ads, Google SEO, Direct
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Reservation System Matrix
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    type_id INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount_paid DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'Confirmed', -- Confirmed, Cancelled
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Accommodation_Types(type_id)
);

### 2. Marketing Analytics Queries (DML & Select)
These advanced multi-table relational joins, data aggregations, and filtering clauses extract actionable consumer behavior trends:

A. Customer Lifetime Value (CLV) & Channel Performance Audit
Business Purpose: Identifies which digital marketing channels bring in the highest-spending customers to optimize budget allocation.

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
GROUP BY c.acquisition_channel
ORDER BY total_revenue DESC;

B. High-Value Asset Utilization & Revenue Run-Rate
Business Purpose: Evaluates which accommodation models generate the highest occupancy turnover to drive dynamic seasonal pricing adjustments.

SELECT 
    a.category_name AS accommodation_style,
    COUNT(b.booking_id) AS total_reservations,
    SUM(DATEDIFF(b.check_out_date, b.check_in_date)) AS total_nights_occupied,
    SUM(b.total_amount_paid) AS gross_revenue_contribution,
    ROUND(AVG(DATEDIFF(b.check_out_date, b.check_in_date)), 1) AS average_stay_duration
FROM Accommodation_Types a
JOIN Bookings b ON a.type_id = b.type_id
WHERE b.booking_status = 'Confirmed'
GROUP BY a.type_id, a.category_name
ORDER BY gross_revenue_contribution DESC;
