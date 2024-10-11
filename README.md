# Hospital-Database-System-with-Interactive-Dashboard-Oracle-APEX-SQL
This project involves the design and implementation of a scalable hospital database system using Oracle APEX, with SQL used for database creation and data management. The system includes an interactive dashboard providing real-time insights into hospital operations, such as patient distribution and doctor availability, enhancing resource management and decision-making for hospital administration. The project was originally developed as part of a group academic assignment, and the dashboard was built using Oracle APEX's back-end SQL functionality to support data-driven decision-making.

Due to the discontinuation of Oracle APEX access, this repository includes SQL scripts for creating the database, screenshots of the SQL code used for generating various reports, and visualizations from the dashboard.
***
# Features
## Hospital Database Design & Development:
+ **Requirement Analysis:** Conducted an in-depth study of the hospital’s operational needs, including patient management, doctor availability, ward/bed occupancy, and treatment tracking.
+ **Extended Entity Relationship Diagram (EERD):** Followed Gould's (2015) six-step database development lifecycle to create an Extended Entity Relationship Model (EERM) that models complex relationships with subclasses, superclasses, inheritance, and specialization.
+ **Conceptual, Logical, and Physical Design:** Completed all stages of database design, including the conceptual (EERD), logical (attribute definition), and physical (table creation and optimization) phases. This process ensured comprehensive planning before database implementation.
+ **Normalization:** Applied normalization (1NF, 2NF, and 3NF) to eliminate redundancy and optimize data integrity.
+ **Partitioning and Indexing:** Designed the physical database to improve query performance through partitioning and indexing. Tables were partitioned based on columns like `treatment_type`, and indexing was used to enhance retrieval efficiency.

***
# Database Implementation with Oracle APEX:
+ **Master-Detail Pages:** Developed two master-detail pages—one for managing care centers, patients, and doctors, and another for tracking room availability and waiting lists. These pages provided real-time access to critical information for hospital administrators.
+ **Interactive Dashboard:** Designed an interactive dashboard that displays real-time insights into patient distribution, doctor availability, room occupancy, and care center rankings, enabling effective hospital management.
+ **Custom Reports and Charts:** Implemented various SQL-driven reports, including:
    + **Patients by Gender per Care Center:** A bar chart displaying the number of male and female patients at each care center.
    + **Doctor Availability by Speciality:** A report showing available doctors by specialty, helping manage resource allocation.
    + **Room Availability:** A chart displaying available rooms and their capacities in each residential block.
    + **Patient Volume Ranking by Care Center:** A ranked list of care centers based on patient load.
    + **High-Bed Priority Patients:** A report highlighting patients in need of immediate care, based on bed priority.

## Optimized System Performance: 
+ **Performance Improvements:** Improved system performance by 20% through database partitioning and query optimization techniques. Cached smaller tables for faster joins and reduced the use of multiple OR operators in SQL queries to enhance performance.
+ **Dynamic Data Updates:** Used sequences to automatically generate primary keys and dynamic actions to update data across the system efficiently.

***
# SQL Scripts
The `hospital_database.sql` file in the `SQL/` folder contains the SQL scripts used to create and populate the main database tables. Out of the 29 tables designed in the Extended Entity Relationship Diagram (EERD), the following six tables were my responsibility, which form the core structure of the hospital's operational data:
+ **DOCTOR:** Stores detailed information about each doctor, including specialization and contact details.
+ **CARE_CENTRE:** Manages the information for different care centers, including their address, contact information, and patient capacity.
+ **RESIDENTIAL_WING::** Tracks the residential blocks where long-term patients are housed, including total room capacity.
+ **ROOM:** Details about individual rooms within the residential wing, including occupancy status and room type.
+ **WAITING_LIST:** Maintains the list of patients awaiting room assignments, along with bed priority.
+ **PATIENT:** Contains information about all the hospital patients, both inpatients and outpatients, and their related care details.

Other tables, such as `Salaried_emp`, `Shift`, and `Treatment`, were developed by other team members to complete the overall database system.

## Highlights of the SQL file: 
+ **Table Creation:** The script uses `CREATE TABLE` statements to define the structure of each table, with foreign key relationships linking entities such as patients, doctors, and care centers.
+ **Data Insertion:** `INSERT INTO` statements populate the tables with sample data for testing and demonstrating the hospital’s operations.
+ **Constraints and Integrity:** The database ensures referential integrity using foreign keys and constraints to maintain accurate relationships between entities.

```
These SQL scripts can be executed in any SQL environment that supports relational database creation, such as Oracle SQL Developer.
```
***
# Oracle APEX Back-end Logic
Since the live Oracle APEX application is no longer available, the screenshots in the **Screenshots**/ folder showcase the various SQL queries and charts generated in Oracle APEX:
+ **Patients by Gender per Care Center:** SQL query and bar chart that visualizes the number of male and female patients per care center.
+ **Doctor Availability:** SQL query to count available doctors by specialty, visualized using a bar chart.
+ **Room Availability:** SQL query retrieving available rooms by residential block and their capacities.
+ **Care Center Ranking by Patient Volume:** SQL query ranking care centers based on the number of patients.
Each screenshot includes the SQL code used and the resulting visualizations from the Oracle APEX dashboard.

# Additional Back-end Functionality
In addition to the SQL scripts and the interactive dashboard, the project includes several important back-end features in Oracle APEX, which are documented through screenshots in the **Screenshots**/ folder:
+ **Primary Key Generation:** A dynamic action was created to automatically generate primary keys (e.g., `PATIENT_NO`) using PL/SQL sequences. The primary key field is hidden from the user interface to maintain data integrity.
+ **Input Validations:** Validations were implemented to ensure accurate data input, such as checking for valid contact numbers in the `PATIENT` table. Error messages are triggered if invalid phone numbers are entered, ensuring data consistency.
+ **Master-Detail Pages:**
+ **Dynamic Forms and Actions:**
    + **Care Center Details:** Displays the `CARE_CENTRE` table with `DOCTOR` and `PATIENT` tables, providing users a complete overview of the number of doctors and patients in each care center.
    +  **Room & Waiting List:** Shows `ROOM` as the master table and `WAITING_LIST` as the detail table, allowing the hospital administration to manage patient waiting lists by room.
+ **CSS and Custom Styling:** The application's interface was enhanced with custom inline CSS and static application files, which included background styling and additional visual improvements.
+ **Drill-Down Functionality** Interactive reports were enhanced with drill-down functionality, allowing users to click through to more detailed information, such as room-specific data or patients in waiting lists.

***

# Documentation
The full project report is available in the **Documentation**/ folder. This PDF includes:

+ Detailed descriptions of the database design.
+ Extended Entity Relationship Diagram (EERD).
+ Oracle APEX dashboard and its various components.
+ Screenshots of SQL queries and resulting charts.

***

# Notes
```
+ The project was originally built in Oracle APEX, and the SQL scripts used to generate charts and reports are no longer accessible as live files, but screenshots are provided for reference.
+ For further details about the project, refer to the project report in the **Documentation**/ folder.
```
