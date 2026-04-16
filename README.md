Supplier System (SQL)

----Description
This project demonstrates SQL database operations using a Supplier-Parts-Supplies system. 
It covers table creation, modification, and query execution.

-----Tables created and used :
- Supplier (SID, Sname, branch, state, phone)
- Part (PID, Pname, color, price)
- Supplies (SID, PID, qty, date_supplied)

-----Queries that implemented on database
1. Data Definition Language (DDL)
- Created tables for Supplier, Part, and Supplies
- Altered table structure:
  - Added new attribute (state)
  - Removed attribute (city)
  - Modified data type of phone
  - Renamed attributes and tables
- Dropped tables
- Used TRUNCATE to remove table data

2. Data Manipulation (DML)
- Inserted records into tables
- Updated existing data
- Deleted specific records

3. Transaction Control (TCL)
- Used SAVEPOINT
- Performed ROLLBACK operations
- Used COMMIT to save changes

4. Aggregate Functions
- Calculated MIN, MAX, AVG, SUM of part prices
- total number of parts
- average cost of parts by supplier
- ORDER BY

5. Join Operations
- INNER JOIN
- NATURAL JOIN
- LEFT OUTER JOIN
- RIGHT OUTER JOIN
- FULL OUTER JOIN

------Software used:
- MySQL 8.0 command line 

-------Implemented By
 - Bhoomi Shah
