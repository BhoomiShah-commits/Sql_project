SQL QUERIES

1. Supplier(SID, Sname, branch, city, phone) Part(PID, Pname, color, price) Supplies(SID, PID, qty, date_supplied)
     Create the tables.
IN SQL : 
show Databases;
+--------------------+
| Database |
+--------------------+
| information_schema |
| mysql |
| performance_schema |
| sakila |
| sybca_practice |
| sys |
| world |
+--------------------+
7 rows in set (0.12 sec)
mysql> use sybca_practice;
Database changed
mysql> show tables;
+--------------------------+
| Tables_in_sybca_practice |
+--------------------------+
| courses |
| enrolls |
| student |
+--------------------------+
3 rows in set (0.00 sec)
mysql> create table Supplier
-> (
-> SID int,
-> Sname varchar(30),
-> branch varchar(20),
-> city varchar(20),
-> phone varchar(10)
-> );
Query OK, 0 rows affected (0.11 sec)
mysql> create table Part
-> (
-> PID int,
-> Pname varchar(30),
-> Color varchar(20),
-> Price varchar(30)
-> );
Query OK, 0 rows affected (0.06 sec)
mysql> create table Supplies
-> (
-> SID int,
-> PID int,
-> Qty varchar(100),
-> Date_supplied Date
-> );
Query OK, 0 rows affected (0.04 sec)

(1.1)  Add a new attribute state in supplier table 
(1.2) Remove attribute city from supplier table 
(1.3) Modify the data type of phone attribute 
(1.4) Change the name of attribute city to address 
(1.5) Change a table’s name, supplier to sup 
(1.6) Use truncate to delete the contents of supplies table 
(1.7) Remove the part table from database
 IN SQL :
ALTER table Supplier add State varchar(20);
Query OK, 0 rows affected (0.14 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> AlTER table Supplier drop City;
Query OK, 0 rows affected (0.06 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> AlTER table Supplier modify phone varchar(15);
Query OK, 0 rows affected (0.03 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> ALTER table Supplier add Address varchar(100);
Query OK, 0 rows affected (0.10 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> RENAME Table Supplier to Sup;
Query OK, 0 rows affected (0.06 sec)
mysql> AlTER Table Sup RENAME TO Supplier;
Query OK, 0 rows affected (0.04 sec)
mysql> describe Supplier;
+---------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| SID | int | YES | | NULL | |
| Sname | varchar(30) | YES | | NULL | |
| branch | varchar(20) | YES | | NULL | |
| phone | varchar(15) | YES | | NULL | |
| State | varchar(20) | YES | | NULL | |
| Address | varchar(100) | YES | | NULL | |
+---------+--------------+------+-----+---------+-------+
6 rows in set (0.07 sec)
mysql> insert into Supplies (SID, PID, Qty, Date_supplied)
-> values('1', '254', '5', '2025-05-22');
Query OK, 1 row affected (0.04 sec)
mysql> select * from Supplies;
+------+------+------+---------------+
| SID | PID | Qty | Date_supplied |
+------+------+------+---------------+
| 1 | 254 | 5 | 2025-05-22 |
+------+------+------+---------------+
1 row in set (0.01 sec)
mysql> TRUNCATE table Supplies;
Query OK, 0 rows affected (0.05 sec)
mysql> select * from Supplies;
Empty set (0.01 sec)
drop table Part;
Query OK, 0 rows affected (0.20 sec)
mysql> show tables;
+--------------------------+
| Tables_in_sybca_practice |
+--------------------------+
| courses |
| enrolls |
| student |
| supplier |
| supplies |
+--------------------------+
5 rows in set (0.03 sec)

2. Queries on TCL 
     (2.1) Create Savepoints 
     (2.2) Rollback to SavePoints 
     (2.3) Use Commit to save on 
IN SQL:
mysql> select * from Supplier;
+-----+----------+--------+------------+-------------+---------+
| SID | Sname | branch | phone | State | Address |
+-----+----------+--------+------------+-------------+---------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
+-----+----------+--------+------------+-------------+---------+
6 rows in set (0.17 sec)
mysql> begin;
Query OK, 0 rows affected (0.00 sec)
mysql> insert into Supplier(SID, Sname, branch, phone, Address)
-> values('7', 'Samsung' ,'Main', '8759641236', 'Nashik');
Query OK, 1 row affected (0.03 sec)
mysql> Savepoint s1;
Query OK, 0 rows affected (0.01 sec)
mysql> insert into Supplier(SID, Sname, branch, phone, Address)
-> values('8', 'Apple' ,'Main', '8759641236', 'Nashik');
Query OK, 1 row affected (0.00 sec)
mysql> Savepoint s2;
Query OK, 0 rows affected (0.00 sec)
mysql> select * from Supplier;
+-----+----------+--------+------------+-------------+---------+
| SID | Sname | branch | phone | State | Address |
+-----+----------+--------+------------+-------------+---------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| 8 | Apple | Main | 8759641236 | MAHARASHTRA | Nashik |
+-----+----------+--------+------------+-------------+---------+
8 rows in set (0.00 sec)
mysql> rollback to s1;
Query OK, 0 rows affected (0.01 sec)
mysql> select * from Supplier;
+-----+----------+--------+------------+-------------+---------+
| SID | Sname | branch | phone | State | Address |
+-----+----------+--------+------------+-------------+---------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
+-----+----------+--------+------------+-------------+---------+
7 rows in set (0.00 sec)
mysql> commit;
Query OK, 0 rows affected (0.02 sec)

3. Aggregate Functions: 
   (3.1) Find the minimum, maximum, average and sum of costs of parts 
   (3.2) Count the total number of parts present 
   (3.3) Retrieve the average cost of all parts supplied by ‘Mike’
   (3.4) Find all parts sorted by pname in ascending order and cost in descending order 
IN SQL :
mysql> select * from Part;
+-----+-----------+--------+-------+
| PID | Pname | Color | Price |
+-----+-----------+--------+-------+
| 101 | Bolt | Silver | 5000 |
| 102 | Chain | Bronze | 2000 |
| 103 | Motor | Red | 5500 |
| 104 | Screw kit | silver | 1000 |
| 105 | Wheels | black | 6000 |
+-----+-----------+--------+-------+
5 rows in set (0.00 sec)
mysql> select MIN(Price) from Part;
+------------+
| MIN(Price) |
+------------+
| 1000 |
+------------+
1 row in set (0.02 sec)
mysql> select MAX(Price) from Part;
+------------+
| MAX(Price) |
+------------+
| 6000 |
+------------+
1 row in set (0.00 sec)
mysql> select AVG(Price) from Part;
+------------+
| AVG(Price) |
+------------+
| 3900 |
+------------+
1 row in set (0.01 sec)
mysql> select SUM(Price) from Part WHERE PID = 101;
+------------+
| SUM(Price) |
+------------+
| 5000 |
+------------+
1 row in set (0.01 sec)
mysql> select SUM(Price) from Part;
+------------+
| SUM(Price) |
+------------+
| 19500 |
+------------+
1 row in set (0.00 sec)
mysql> select COUNT(*) from Part;
+----------+
| COUNT(*) |
+----------+
| 5 |
+----------+
1 row in set (0.00 sec)
mysql> select * from Part ORDER BY Pname ASC, Price DESC;
+-----+-----------+--------+-------+
| PID | Pname | Color | Price |
+-----+-----------+--------+-------+
| 101 | Bolt | Silver | 5000 |
| 102 | Chain | Bronze | 2000 |
| 103 | Motor | Red | 5500 |
| 104 | Screw kit | silver | 1000 |
| 105 | Wheels | black | 6000 |
+-----+-----------+--------+-------+
5 rows in set (0.02 sec)
mysql> select * from Part ORDER BY Pname ASC;
+-----+-----------+--------+-------+
| PID | Pname | Color | Price |
+-----+-----------+--------+-------+
| 101 | Bolt | Silver | 5000 |
| 102 | Chain | Bronze | 2000 |
| 103 | Motor | Red | 5500 |
| 104 | Screw kit | silver | 1000 |
| 105 | Wheels | black | 6000 |
+-----+-----------+--------+-------+
5 rows in set (0.00 sec)
mysql> select * from Part ORDER BY Pname DESC;
+-----+-----------+--------+-------+
| PID | Pname | Color | Price |
+-----+-----------+--------+-------+
| 105 | Wheels | black | 6000 |
| 104 | Screw kit | silver | 1000 |
| 103 | Motor | Red | 5500 |
| 102 | Chain | Bronze | 2000 |
| 101 | Bolt | Silver | 5000 |
+-----+-----------+--------+-------+
5 rows in set (0.00 sec)

4. Join Operators 
    (4.1) Perform Inner join on two tables 
    (4.2) Perform Natural Join on two tables 
    (4.3) Perform Left Outer Join on tables 
    (4.4)Perform Right Outer join on tables 
    (4.5) Perform Full Outer Join on tables
IN SQL:
mysql> select * from Supplier
-> ;
+-----+----------+--------+------------+-------------+---------+
| SID | Sname | branch | phone | State | Address |
+-----+----------+--------+------------+-------------+---------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
+-----+----------+--------+------------+-------------+---------+
7 rows in set (0.02 sec)
mysql> select * from Supplies;
+------+------+------+---------------+
| SID | PID | Qty | Date_supplied |
+------+------+------+---------------+
| 1 | 101 | 500 | 2025-09-01 |
| 2 | 102 | 1000 | 2025-09-03 |
| 3 | 103 | 150 | 2025-09-07 |
| 4 | 104 | 700 | 2025-09-02 |
+------+------+------+---------------+
4 rows in set (0.01 sec)
mysql> select * from part;
+-----+-----------+--------+-------+
| PID | Pname | Color | Price |
+-----+-----------+--------+-------+
| 101 | Bolt | Silver | 5000 |
| 102 | Chain | Bronze | 2000 |
| 103 | Motor | Red | 5500 |
| 104 | Screw kit | silver | 1000 |
| 105 | Wheels | black | 6000 |
+-----+-----------+--------+-------+
5 rows in set (0.01 sec)
mysql> select * from Supplier
-> INNER JOIN supplies ON supplier.SID = supplies.SID
-> INNER JOIN part On supplies.PID = part.PID;
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+-----+-----------+--------+-------+
| SID | Sname | branch | phone | State | Address | SID | PID | Qty | Date_supplied | PID | Pname | Color | Price |
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+-----+-----------+--------+-------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY | 1 | 101 | 500 | 2025-09-01 | 101 | Bolt | Silver | 5000 |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY | 2 | 102 | 1000 | 2025-09-03 | 102 | Chain | Bronze | 2000 |
| 3 | Infosys | East | 5489612377 | Bihar | GOA | 3 | 103 | 150 | 2025-09-07 | 103 | Motor | Red | 5500 |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY | 4 | 104 | 700 | 2025-09-02 | 104 | Screw kit | silver | 1000 |
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+-----+-----------+--------+-------+
4 rows in set (0.01 sec)
mysql> select Sname, Pname, Qty FROM supplier
-> INNER JOIN supplies ON supplier.SID = supplies.SID
-> INNER JOIN part ON supplies.PID = part.PID;
+----------+-----------+------+
| Sname | Pname | Qty |
+----------+-----------+------+
| Reliance | Bolt | 500 |
| Tata | Chain | 1000 |
| Infosys | Motor | 150 |
| Wipro | Screw kit | 700 |
+----------+-----------+------+
4 rows in set (0.01 sec)
mysql> select * from Supplies NATURAL JOIN Part;
+------+------+------+---------------+-----------+--------+-------+
| PID | SID | Qty | Date_supplied | Pname | Color | Price |
+------+------+------+---------------+-----------+--------+-------+
| 101 | 1 | 500 | 2025-09-01 | Bolt | Silver | 5000 |
| 102 | 2 | 1000 | 2025-09-03 | Chain | Bronze | 2000 |
| 103 | 3 | 150 | 2025-09-07 | Motor | Red | 5500 |
| 104 | 4 | 700 | 2025-09-02 | Screw kit | silver | 1000 |
+------+------+------+---------------+-----------+--------+-------+
4 rows in set (0.01 sec)
mysql> select * from Supplier NATURAL JOIN supplies;
+-----+----------+--------+------------+-------------+---------+------+------+---------------+
| SID | Sname | branch | phone | State | Address | PID | Qty | Date_supplied |
+-----+----------+--------+------------+-------------+---------+------+------+---------------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY | 101 | 500 | 2025-09-01 |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY | 102 | 1000 | 2025-09-03 |
| 3 | Infosys | East | 5489612377 | Bihar | GOA | 103 | 150 | 2025-09-07 |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY | 104 | 700 | 2025-09-02 |
+-----+----------+--------+------------+-------------+---------+------+------+---------------+
4 rows in set (0.00 sec)
mysql> select * from Supplier LEFT JOIN supplies ON supplier.SID = supplies.SID;
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+
| SID | Sname | branch | phone | State | Address | SID | PID | Qty | Date_supplied |
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY | 1 | 101 | 500 | 2025-09-01 |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY | 2 | 102 | 1000 | 2025-09-03 |
| 3 | Infosys | East | 5489612377 | Bihar | GOA | 3 | 103 | 150 | 2025-09-07 |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY | 4 | 104 | 700 | 2025-09-02 |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE | NULL | NULL | NULL | NULL |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik | NULL | NULL | NULL | NULL |
| 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik | NULL | NULL | NULL | NULL |
+-----+----------+--------+------------+-------------+---------+------+------+------+---------------+
7 rows in set (0.01 sec)
mysql> select * from Supplies RIGHT JOIN supplier ON supplies.SID = supplier.SID;
+------+------+------+---------------+-----+----------+--------+------------+-------------+---------+
| SID | PID | Qty | Date_supplied | SID | Sname | branch | phone | State | Address |
+------+------+------+---------------+-----+----------+--------+------------+-------------+---------+
| 1 | 101 | 500 | 2025-09-01 | 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | 102 | 1000 | 2025-09-03 | 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | 103 | 150 | 2025-09-07 | 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | 104 | 700 | 2025-09-02 | 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| NULL | NULL | NULL | NULL | 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| NULL | NULL | NULL | NULL | 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| NULL | NULL | NULL | NULL | 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
+------+------+------+---------------+-----+----------+--------+------------+-------------+---------+
7 rows in set (0.00 sec)
mysql> select * from Supplier LEFT JOIN supplies ON supplier.SID = supplies.SID
-> UNION
-> select * from Supplies RIGHT JOIN supplier ON supplies.SID = supplier.SID;
+------+----------+--------+------------+-------------+----------+------+------------+-------------+---------------+
| SID | Sname | branch | phone | State | Address | SID | PID | Qty | Date_supplied |
+------+----------+--------+------------+-------------+----------+------+------------+-------------+---------------+
| 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY | 1 | 101 | 500 | 2025-09-01 |
| 2 | Tata | West | 5489612377 | Gujarat | BOMBAY | 2 | 102 | 1000 | 2025-09-03 |
| 3 | Infosys | East | 5489612377 | Bihar | GOA | 3 | 103 | 150 | 2025-09-07 |
| 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY | 4 | 104 | 700 | 2025-09-02 |
| 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE | NULL | NULL | NULL | NULL |
| 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik | NULL | NULL | NULL | NULL |
| 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik | NULL | NULL | NULL | NULL |
| 1 | 101 | 500 | 2025-09-01 | 1 | Reliance | Main | 4587123698 | Maharashtra | BOMBAY |
| 2 | 102 | 1000 | 2025-09-03 | 2 | Tata | West | 5489612377 | Gujarat | BOMBAY |
| 3 | 103 | 150 | 2025-09-07 | 3 | Infosys | East | 5489612377 | Bihar | GOA |
| 4 | 104 | 700 | 2025-09-02 | 4 | Wipro | Main | 9845612357 | Maharashtra | BOMBAY |
| NULL | NULL | NULL | NULL | 5 | H&M | Main | 4589612789 | MAHARASHTRA | PUNE |
| NULL | NULL | NULL | NULL | 6 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
| NULL | NULL | NULL | NULL | 7 | Samsung | Main | 8759641236 | MAHARASHTRA | Nashik |
+------+----------+--------+------------+-------------+----------+------+------------+-------------+---------------+
14 rows in set (0.03 sec)



