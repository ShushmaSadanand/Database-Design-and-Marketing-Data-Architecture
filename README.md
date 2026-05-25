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
