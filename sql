To see available database
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo               |
| information_schema |
| march_crud_db      |
| mysql              |
| performance_schema |
| psadb1             |
| sca_db             |
| student_db         |
| studentcrm         |
| testingcampus      |
+--------------------+

Connect to the required database-> use database_name;
mysql> use testingcampus;
Database changed

To see tables in current database-> show tables;
mysql> show tables;
+-------------------------+
| Tables_in_testingcampus |
+-------------------------+
| employee                |
+-------------------------+

To read the data from table-> select * from table_name;
mysql> select * from employee;
+-----+--------+-----------+--------+
| EID | Ename  | City      | salary |
+-----+--------+-----------+--------+
| 100 | smith  | Bangalore |  10000 |
| 101 | carl   | Bangalore |  12000 |
| 102 | Ram    | Chennai   |  12000 |
| 103 | pankaj | Hyderabad |   5000 |
| 104 | vikram | Pune      |   2000 |
+-----+--------+-----------+--------+

mysql> select eid,ename from employee;
+-----+--------+
| eid | ename  |
+-----+--------+
| 100 | smith  |
| 101 | carl   |
| 102 | Ram    |
| 103 | pankaj |
| 104 | vikram |
+-----+--------+


note:- for filtering data-> where

mysql> select ename from employee where salary=10000;
+-------+
| ename |
+-------+
| smith |
+-------+

Give me the employee name whose salary is greater than equal to 10000

mysql> select ename from employee where salary>=10000;
+-------+
| ename |
+-------+
| smith |
| carl  |
| Ram   |
+-------+

note:- compare more than one data use -> in operator

Give me the employee name whose salary 5000 and 2000

mysql> select ename from employee where salary in(5000,2000);
+--------+
| ename  |
+--------+
| pankaj |
| vikram |
+--------+

Give me employee id whose name are smith and carl

mysql> select eid from employee where ename in("smith","carl");
+-----+
| eid |
+-----+
| 100 |
| 101 |
+-----+


note:- select->from->where->group by->having->order by

note:- for filtering data-> where and having

mysql> select * from employee where salary=10000;
+-----+-------+-----------+--------+
| EID | Ename | City      | salary |
+-----+-------+-----------+--------+
| 100 | smith | Bangalore |  10000 |
+-----+-------+-----------+--------+
1 row in set (0.07 sec)

mysql> select * from employee having salary=10000;
+-----+-------+-----------+--------+
| EID | Ename | City      | salary |
+-----+-------+-----------+--------+
| 100 | smith | Bangalore |  10000 |
+-----+-------+-----------+--------+

WHERE filters rows before grouping.
HAVING filters groups after GROUP BY.

filter the record using where command and give me the employee id whose name is Vikram
mysql> select eid from employee where ename='vikram';
+-----+
| eid |
+-----+
| 104 |
+-----+

Give me the employee id's sorted in descending order
mysql> select eid from employee order by eid desc;
+-----+
| eid |
+-----+
| 104 |
| 103 |
| 102 |
| 101 |
| 100 |
+-----+
note:- in sql to sort data we use order by command

sort the employee names in descending order
mysql> select ename from employee order by ename desc;
+--------+
| ename  |
+--------+
| vikram |
| smith  |
| Ram    |
| pankaj |
| carl   |
+--------+

Give me the employee id's sorted in ascecending order
mysql> select ename from employee order by ename asc;
+--------+
| ename  |
+--------+
| carl   |
| pankaj |
| Ram    |
| smith  |
| vikram |
+--------+

built-in function in sql->(max,min,avg,sum,count/group by,limit)
give me the maximum salary from the table
mysql> select max(salary) from employee;
+-------------+
| max(salary) |
+-------------+
|       12000 |
+-------------+

give me the minimum salary from the table
mysql> select min(salary) from employee;
+-------------+
| min(salary) |
+-------------+
|        2000 |
+-------------+

give me the average salary from the table
mysql> select avg(salary) from employee;
+-------------+
| avg(salary) |
+-------------+
|   8200.0000 |
+-------------+

give me the sum all salary
mysql> select sum(salary) from employee;
+-------------+
| sum(salary) |
+-------------+
|       41000 |
+-------------+

count the numbers of employee in our company
mysql> select count(eid) from employee;
+------------+
| count(eid) |
+------------+
|          5 |
+------------+

count number of employee city wise
mysql> select count(eid) from employee group by city;
+------------+
| count(eid) |
+------------+
|          2 |
|          1 |
|          1 |
|          1 |
+------------+
mysql> select city,count(eid) from employee group by city;
+-----------+------------+
| city      | count(eid) |
+-----------+------------+
| Bangalore |          2 |
| Chennai   |          1 |
| Hyderabad |          1 |
| Pune      |          1 |
+-----------+------------+

"Group the employees by city, count the number of employees in each city, and display the counts in ascending order."
mysql> SELECT city, COUNT(eid) AS employee_count
    -> FROM employee
    -> GROUP BY city
    -> ORDER BY employee_count ASC;
+-----------+----------------+
| city      | employee_count |
+-----------+----------------+
| Chennai   |              1 |
| Hyderabad |              1 |
| Pune      |              1 |
| Bangalore |              2 |
+-----------+----------------+


mysql> select count(eid) from employee group by city order by count(eid);
+------------+
| count(eid) |
+------------+
|          1 |
|          1 |
|          1 |
|          2 |
+------------+

"count number of city and sort the count in ascending order"
mysql> select count(city) from employee group by city order by count(city) asc;
+-------------+
| count(city) |
+-------------+
|           1 |
|           1 |
|           1 |
|           2 |
+-------------+

group the candidates based on age

group the city after counting where the city name is Bangalore
mysql> SELECT COUNT(city)
    -> FROM employee
    -> GROUP BY city
    -> HAVING city = 'Bangalore';
+-------------+
| COUNT(city) |
+-------------+
|           2 |
+-------------+

convert all employee name in uppercase
mysql> select ucase(ename) from employee;
+--------------+
| ucase(ename) |
+--------------+
| SMITH        |
| CARL         |
| RAM          |
| PANKAJ       |
| VIKRAM       |
+--------------+

convert all employee name in lowercase
mysql> select lcase(ename) from employee;
+--------------+
| lcase(ename) |
+--------------+
| smith        |
| carl         |
| ram          |
| pankaj       |
| vikram       |
+--------------+

top record
mysql> select * from employee order by eid asc limit 2;
+-----+-------+-----------+--------+
| EID | Ename | City      | salary |
+-----+-------+-----------+--------+
| 100 | smith | Bangalore |  10000 |
| 101 | carl  | Bangalore |  12000 |
+-----+-------+-----------+--------+

give me first the record from the table
mysql> select * from employee order by eid asc limit 1;
+-----+-------+-----------+--------+
| EID | Ename | City      | salary |
+-----+-------+-----------+--------+
| 100 | smith | Bangalore |  10000 |
+-----+-------+-----------+--------+

last two record from the table
mysql> select * from employee order by eid desc limit 2;
+-----+--------+-----------+--------+
| EID | Ename  | City      | salary |
+-----+--------+-----------+--------+
| 104 | vikram | Pune      |   2000 |
| 103 | pankaj | Hyderabad |   5000 |
+-----+--------+-----------+--------+

give me cities only first three letters
mysql> select mid(city,1,3) from employee;
+---------------+
| mid(city,1,3) |
+---------------+
| Ban           |
| Ban           |
| Che           |
| Hyd           |
| Pun           |
+---------------+


print current system sql
mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-05-31 11:39:58 |
+---------------------+

note:- AS is used to give a temporary name (alias) to a column or table.
mysql> select now() as time;
+---------------------+
| time                |
+---------------------+
| 2026-05-31 11:40:56 |
+---------------------+

change the column ename to name and print the output
mysql> select ename as name from employee;
+--------+
| name   |
+--------+
| smith  |
| carl   |
| Ram    |
| pankaj |
| vikram |
+--------+

wild-card:- like "%letter"
give me the employee end with letter m
mysql> select ename from employee where ename like "%m";
+--------+
| ename  |
+--------+
| Ram    |
| vikram |
+--------+


give me the employees with consist of letter m
mysql> select ename from employee where ename like "%m%";
+--------+
| ename  |
+--------+
| smith  |
| Ram    |
| vikram |
+--------+

give me name of the employee with start letter s
mysql> select ename from employee where ename like "S%";
+-------+
| ename |
+-------+
| smith |
+-------+

give me name of the employee which consist of three letters
mysql> select ename from employee where ename like "_ _ _";
+-------+
| ename |
+-------+
| Ram   |
+-------+

give me name of the employee which consist of five letters
mysql> select ename from employee where ename like "_ _ _ _ _";
+-------+
| ename |
+-------+
| smith |
+-------+

give me name of the employee which end letter m and including three letters
mysql> SELECT ename
    -> FROM employee
    -> WHERE ename LIKE '__m';
+-------+
| ename |
+-------+
| Ram   |
+-------+

delete the record from employee table and eid=101
DELETE FROM employee WHERE eid = 101;

➡️ "Delete the records from the employee table where eid is 101 or 102."
DELETE FROM employee HERE eid IN (101, 102);

➡️ "Delete the record from the employee table where the employee name is 'smith'."
SQL query: ELETE FROM employeeWHERE ename = 'smith';

➡️ "Drop the employee table."
SQL query: DROP TABLE EMPLOYEE;


➡️ "Print only unique city names from the table."
Use DISTINCT: SELECT DISTINCT city FROM employee;
mysql> select distinct city from employee;
+-----------+
| city      |
+-----------+
| Bangalore |
| Chennai   |
| Hyderabad |
| Pune      |
+-----------+

➡️ "Give me the distinct salaries from the employee table."
SQL query: SELECT DISTINCT salary FROM employee;
mysql> SELECT DISTINCT salary FROM employee;
+--------+
| salary |
+--------+
|  10000 |
|  12000 |
|   5000 |
|   2000 |
+--------+

➡️ "Concatenate the employee name and salary."
Use the CONCAT() function: SELECT CONCAT(ename, salary) AS employee_details FROM employee;
mysql> select concat(ename,salary) from employee;
+----------------------+
| concat(ename,salary) |
+----------------------+
| smith10000           |
| carl12000            |
| Ram12000             |
| pankaj5000           |
| vikram2000           |
+----------------------+

➡️ "Separate the employee name and salary and then concatenate the contents of the columns."
mysql> select concat(ename,"_",salary) from employee;
+--------------------------+
| concat(ename,"_",salary) |
+--------------------------+
| smith_10000              |
| carl_12000               |
| Ram_12000                |
| pankaj_5000              |
| vikram_2000              |
+--------------------------+


➡️ "Remove the white spaces from the left side of employee names."
mysql> select ltrim(ename) from employee;
+--------------+
| ltrim(ename) |
+--------------+
| smith        |
| carl         |
| Ram          |
| pankaj       |
| vikram       |
+--------------+

➡️ "Remove the white spaces from the right side of the employee names in the employee table and then display the output."
SQL query: SELECT LTRIM(ename) AS employee_name FROM employee;
mysql> select rtrim(ename) from employee;
+--------------+
| rtrim(ename) |
+--------------+
| smith        |
| carl         |
| Ram          |
| pankaj       |
| vikram       |
+--------------+

➡️ "Remove the leading and trailing spaces from the employee name and salary columns, concatenate them with an underscore (_), and display the output."
mysql> select concat(trim(ename),"_",trim(salary)) from employee;
+--------------------------------------+
| concat(trim(ename),"_",trim(salary)) |
+--------------------------------------+
| smith_10000                          |
| carl_12000                           |
| Ram_12000                            |
| pankaj_5000                          |
| vikram_2000                          |
+--------------------------------------+

concat ename and salary print the output in decending order
mysql> select concat(ename,salary) from employee order by concat(ename,salary);
+----------------------+
| concat(ename,salary) |
+----------------------+
| carl12000            |
| pankaj5000           |
| Ram12000             |
| smith10000           |
| vikram2000           |
+----------------------+
mysql> select concat(ename,salary) from employee order by concat(ename,salary) desc;
+----------------------+
| concat(ename,salary) |
+----------------------+
| vikram2000           |
| smith10000           |
| Ram12000             |
| pankaj5000           |
| carl12000            |
+----------------------+

sort employee name ascending order
mysql> select ename from employee order by ename asc;
+--------+
| ename  |
+--------+
| carl   |
| pankaj |
| Ram    |
| smith  |
| vikram |
+--------+

update the record where employee name is smith to abc
UPDATE employee SET ename = 'ABC' WHERE ename = 'smith';

update the employee name smith to abc where employee id is 101
update employee set ename='ABC' where eid='101';

update the employee id from 101 to 110;
update employee set eid=110 where eid='101';

replace the city name bangalore with benguluru in the table
update employee set city="bangaluru" where city="bangalor";

delete the record from the table wherever you find smith;
delete from employee where ename="smith";

delete the record whosever salary is 10000
delete from employee where salary=10000;

update everyone salary by 200
update employee set salary=salary+200;
mysql> select * from employee;
+-----+--------+-----------+--------+
| EID | Ename  | City      | salary |
+-----+--------+-----------+--------+
| 100 | smith  | Bangalore |  10200 |
| 101 | carl   | Bangalore |  12200 |
| 102 | Ram    | Chennai   |  12200 |
| 103 | pankaj | Hyderabad |   5200 |
| 104 | vikram | Pune      |   2200 |


add column in the table employee at the end
mysql> alter table employee add email varchar(20);
Query OK, 0 rows affected (0.28 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-----+--------+-----------+--------+-------+
| EID | Ename  | City      | salary | email |
+-----+--------+-----------+--------+-------+
| 100 | smith  | Bangalore |  10200 | NULL  |
| 101 | carl   | Bangalore |  12200 | NULL  |
| 102 | Ram    | Chennai   |  12200 | NULL  |
| 103 | pankaj | Hyderabad |   5200 | NULL  |
| 104 | vikram | Pune      |   2200 | NULL  |
+-----+--------+-----------+--------+-------+


add column in the table employee at the first
mysql> alter table employee add eno varchar(10) first;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------+-----+--------+-----------+--------+-------+
| eno  | EID | Ename  | City      | salary | email |
+------+-----+--------+-----------+--------+-------+
| NULL | 100 | smith  | Bangalore |  10200 | NULL  |
| NULL | 101 | carl   | Bangalore |  12200 | NULL  |
| NULL | 102 | Ram    | Chennai   |  12200 | NULL  |
| NULL | 103 | pankaj | Hyderabad |   5200 | NULL  |
| NULL | 104 | vikram | Pune      |   2200 | NULL  |
+------+-----+--------+-----------+--------+-------+

add column after ename
mysql> alter table employee add surname varchar(20) after ename;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------+-----+--------+---------+-----------+--------+-------+
| eno  | EID | Ename  | surname | City      | salary | email |
+------+-----+--------+---------+-----------+--------+-------+
| NULL | 100 | smith  | NULL    | Bangalore |  10200 | NULL  |
| NULL | 101 | carl   | NULL    | Bangalore |  12200 | NULL  |
| NULL | 102 | Ram    | NULL    | Chennai   |  12200 | NULL  |
| NULL | 103 | pankaj | NULL    | Hyderabad |   5200 | NULL  |
| NULL | 104 | vikram | NULL    | Pune      |   2200 | NULL  |
+------+-----+--------+---------+-----------+--------+-------+


delete a column email from table
mysql> alter table employee drop column email;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------+-----+--------+---------+-----------+--------+
| eno  | EID | Ename  | surname | City      | salary |
+------+-----+--------+---------+-----------+--------+
| NULL | 100 | smith  | NULL    | Bangalore |  10200 |
| NULL | 101 | carl   | NULL    | Bangalore |  12200 |
| NULL | 102 | Ram    | NULL    | Chennai   |  12200 |
| NULL | 103 | pankaj | NULL    | Hyderabad |   5200 |
| NULL | 104 | vikram | NULL    | Pune      |   2200 |
+------+-----+--------+---------+-----------+--------+

mysql> select length(ename) from employee;
+---------------+
| length(ename) |
+---------------+
|             5 |
|             4 |
|             3 |
|             6 |
|             6 |
+---------------+


Query1
	(Query2)

Subquery-> query within query is called subquery
*subquery in same table
*if table are then same column should be present in both

A subquery is a query nested inside another query.
The inner query executes first, and its result is used by the outer query.
Subqueries can be written on the same table or different tables.
When using IN or NOT IN, the compared columns should have compatible data types.

give me second maximum salary
mysql> SELECT MAX(salary)
    -> FROM employee
    -> WHERE salary < (
    ->     SELECT MAX(salary)
    ->     FROM employee
    -> );
+-------------+
| MAX(salary) |
+-------------+
|       10200 |
+-------------+


third maximum salary
mysql> SELECT MAX(salary)
    -> FROM employee
    -> WHERE salary < (
    ->     SELECT MAX(salary)
    ->     FROM employee
    ->     WHERE salary < (
    ->         SELECT MAX(salary)
    ->         FROM employee
    ->     )
    -> );
+-------------+
| MAX(salary) |
+-------------+
|        5200 |
+-------------+

give me the employee name who got incative


employee table
| eid | ename  | city      | salary |
| --- | ------ | --------- | ------ |
| 100 | smith  | Bangalore | 10000  |
| 101 | carl   | Bangalore | 12000  |
| 102 | Ram    | Mysore    | 12000  |
| 103 | pankaj | Delhi     | 5000   |
| 104 | vikram | Mumbai    | 2000   |

incentive_list
| eid | incen_amount | incentive_date |
| --- | ------------ | -------------- |
| 100 | 5000         | 2014-02-02     |
| 100 | 3000         | 2014-03-06     |
| 101 | 6000         | 2016-03-09     |
| 102 | 2000         | 2015-02-09     |


mysql> SELECT ename
    -> FROM employee
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM incentive_list
    -> );
+-------+
| ename |
+-------+
| smith |
| carl  |
| Ram   |
+-------+

give the name of employee who are not married
r '="no")' at line 1
mysql> SELECT ename
    -> FROM employee2
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM status
    ->     WHERE marital_status = 'No'
    -> );
+-------+
| ename |
+-------+
| Carl  |
| Rom   |
+-------+


give me the employee of only female candidates and also their salary
mysql> SELECT ename, salary
    -> FROM employee2
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM status
    ->     WHERE gender = 'F'
    -> );
+--------+--------+
| ename  | salary |
+--------+--------+
| Ankita |   5000 |
| Sheela |   2000 |
+--------+--------+

give me the employee name who got an inactive amount greater than or equal to 5000
mysql> SELECT ename
    -> FROM employee2
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM incentive_list
    ->     WHERE incen_amount >= 5000
    -> );
+-------+
| ename |
+-------+
| Smith |
| Carl  |
+-------+

give the employee name who married and has got incentive
mysql> SELECT ename
    -> FROM employee2
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM incentive_list
    ->     WHERE eid IN (
    ->         SELECT eid
    ->         FROM status
    ->         WHERE marital_status = 'yes'
    ->     )
    -> );
+-------+
| ename |
+-------+
| Smith |
+-------+

give me the marital status of the employee whose salary is greater than 10000

SELECT eid, marital_status
FROM status
WHERE eid IN (
    SELECT eid
    FROM employee2
    WHERE salary > 10000
);

+------+----------------+
| eid  | marital_status |
+------+----------------+
|  100 | yes            |
|  101 | No             |
|  102 | No             |
+------+----------------+

give me the employee name who doesn't get incentive
mysql> SELECT ename
    -> FROM employee2
    -> WHERE eid NOT IN (
    ->     SELECT eid
    ->     FROM incentive_list
    -> );
+--------+
| ename  |
+--------+
| Ankita |
| Sheela |
+--------+

employee name containing letter m  who got incentive
mysql> SELECT ename
    -> FROM employee2
    -> WHERE ename LIKE '%m%'
    -> AND eid IN (
    ->     SELECT eid
    ->     FROM incentive_list
    -> );
+-------+
| ename |
+-------+
| Smith |
| Rom   |
+-------+


employee name who is married and male
mysql> SELECT ename
    -> FROM employee2
    -> WHERE eid IN (
    ->     SELECT eid
    ->     FROM status
    ->     WHERE marital_status = 'yes'
    ->       AND gender = 'M'
    -> );
+-------+
| ename |
+-------+
| Smith |
+-------+

data types

Integer Types
-------------
TINYINT
SMALLINT
MEDIUMINT
INT
BIGINT

Character Types
---------------
CHAR
VARCHAR
BLOB

Numeric Types
-------------
FLOAT
DOUBLE

Date/Time Types
---------------
DATE
TIME
YEAR
TIMESTAMP

Special Type
------------
ENUM



1. Integer (Whole Number) Data Types: Used to store whole numbers.
| Data Type | Storage | Range (Signed)                  |
| --------- | ------- | ------------------------------- |
| TINYINT   | 1 Byte  | -128 to 127                     |
| SMALLINT  | 2 Bytes | -32,768 to 32,767               |
| MEDIUMINT | 3 Bytes | -8,388,608 to 8,388,607         |
| INT       | 4 Bytes | -2,147,483,648 to 2,147,483,647 |
| BIGINT    | 8 Bytes | Very large integers             |
Example
CREATE TABLE student (
    sid INT,
    age TINYINT
);

When to Use
Roll numbers
Employee IDs
Age
Quantity

2. Character/String Data Types : Used to store text.
CHAR-Fixed-length string.

CHAR(4)

If you store: 'ABC'
MySQL stores: 'ABC '
(one extra space)

Example: name CHAR(20)
Use Cases
Gender codes
Country codes
Fixed-size values


VARCHAR: Variable-length string.
VARCHAR(20)
Stores only the actual characters.

Example
name VARCHAR(50)
Use Cases
Names
Addresses
Emails
Cities

BLOB : Binary Large Object.
Used to store:
Images
Audio files
Videos
Documents
Example: photo BLOB

3. Numeric Data Types : Used for decimal values.

FLOAT: Stores approximate decimal values.
sql: salary FLOAT
Example: 1234.56

DOUBLE: Stores larger and more precise decimal values.
sql: price DOUBLE
Example: 123456789.12345

4. ENUM Data Type: Used when a column can contain only specific values.

Syntax: ENUM('M','F')
Example: gender ENUM('M','F')

Valid values:
M
F

Invalid values are rejected.

Use Cases
Gender
Status
Department Type
User Role


5. Date and Time Data Types

DATE: Stores only the date.
Format: YYYY-MM-DD
Example:
sql: birth_date DATE
Stored value:2026-06-01


TIME: Stores only time.
Format: HH:MM:SS
Example:
sql: login_time TIME
Stored value: 14:30:45


YEAR: Stores only the year.
Example:
sql: joining_year YEAR
Stored value: 2026


TIMESTAMP: Stores both date and time.
Example:
sql: created_at TIMESTAMP
Stored value: 2026-06-01 14:30:45
Commonly used for:
Record creation time
Login history
Audit logs


----------------------------------------------------------------------------------------------------

mysql> create table pet(
    -> name varchar(20),
    -> owner varchar(20),
    -> birth_date date,
    -> gender enum('F','M'),
    -> pid int(5));

mysql> describe pet;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| name       | varchar(20)   | YES  |     | NULL    |       |
| owner      | varchar(20)   | YES  |     | NULL    |       |
| birth_date | date          | YES  |     | NULL    |       |
| gender     | enum('F','M') | YES  |     | NULL    |       |
| pid        | int           | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+


inserting values into the table
mysql> select * from pet;
+-------+-------+------------+--------+------+
| name  | owner | birth_date | gender | pid  |
+-------+-------+------------+--------+------+
| Rinky | Pinky | 2015-02-23 | F      |  100 |
+-------+-------+------------+--------+------+


mysql> create table registration(
    -> first_name varchar(20),
    -> last_name varchar(20),
    -> dob date,
    -> reg_time timestamp,
    -> location varchar(20),
    -> rid int(5));


mysql> describe registration;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| first_name | varchar(20) | YES  |     | NULL    |       |
| last_name  | varchar(20) | YES  |     | NULL    |       |
| dob        | date        | YES  |     | NULL    |       |
| reg_time   | timestamp   | YES  |     | NULL    |       |
| location   | varchar(20) | YES  |     | NULL    |       |
| rid        | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> INSERT INTO registration
    -> VALUES (
    ->     'Lilly',
    ->     'Silly',
    ->     '2016-02-23',
    ->     NOW(),
    ->     'BA',
    ->     100
    -> );

Constraint :
A constraint is a rule or restriction applied to a table column to ensure the accuracy, validity, and integrity of data.

Simple Definition
A constraint is nothing but a restriction imposed on a column or table.

Constraints
-----------
1. NOT NULL
2. UNIQUE
3. PRIMARY KEY
4. FOREIGN KEY
5. ENUM
6. SET

NOT Null-> if you make a column not null that means it can consist of duplicate record but not null values.
Unique-> it can consist of only unique record and also null value as two null values never can be same.
PK-> it is unique + not null
FK-> one table can have multiple fk.
Enum-> Enum gives us a fixed value to be selected.
Set-> set is group of values and this constraint help us to select any one value from the set or all few values from the set.

NOT NULL  	-> No NULL values allowed.
UNIQUE    	-> No duplicate values allowed.
PRIMARY KEY 	-> UNIQUE + NOT NULL.
FOREIGN KEY 	-> Creates relationship between tables.
ENUM      	-> Select only one value from a fixed list.
SET       	-> Select one, many, or all values from a fixed list.

creating the table student
CREATE TABLE student (
    SID INT(10) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Gender ENUM('F','M'),
    DOB DATE NOT NULL,
    Phone_No VARCHAR(10) UNIQUE,
    Loc VARCHAR(20),
    Certificate SET('QTP','Selenium','J2EE')
);

insert into student value(100,'xyz','F',"1999-02-23",'8827228255','QTP,Selenium');

mysql> INSERT INTO student (sid, name, gender, dob, phone_no, loc) VALUES
    -> (101, 'ABC', 'M', '2001-05-10', '9876543211', 'Mumbai'),
    -> (102, 'AAA', 'F', '2002-08-15', '9876543212', 'Delhi'),
    -> (103, 'XXX', 'F', '2000-11-20', '9876543213', 'Chennai');


mysql> select * from student;
+-----+------+--------+------------+------------+-----------+--------------+
| SID | Name | Gender | DOB        | Phone_No   | Loc       | Certificate  |
+-----+------+--------+------------+------------+-----------+--------------+
| 100 | xyz  | F      | 1999-02-23 | 8827228255 | Bangalore | QTP,Selenium |
+-----+------+--------+------------+------------+-----------+--------------+


mysql> CREATE TABLE student_attendance (
    -> 	  sid INT,
    ->     sub VARCHAR(10),
    ->     att_date DATE,
    ->     FOREIGN KEY (sid) REFERENCES student(sid)
    -> );

mysql> describe student_attendance;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| sid      | int         | YES  | MUL | NULL    |       |
| sub      | varchar(10) | YES  |     | NULL    |       |
| att_date | date        | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> INSERT INTO student_attendance (sid, sub, att_date) VALUES
    -> (100, 'P1', '2026-06-01'),
    -> (100, 'P2', '2026-06-02'),
    -> (100, 'P3', '2026-06-03'),
    -> (101, 'P1', '2026-06-01'),
    -> (101, 'P2', '2026-06-02'),

Subtracting two tables in MySQL(not matching records)
Display the details of students who have no attendance records.
mysql> select * from student where sid not in(select sid from student_attendance);
+-----+------+--------+------------+------------+---------+-------------+
| SID | Name | Gender | DOB        | Phone_No   | Loc     | Certificate |
+-----+------+--------+------------+------------+---------+-------------+
| 102 | AAA  | F      | 2002-08-15 | 9876543212 | Delhi   | NULL        |
| 103 | XXX  | F      | 2000-11-20 | 9876543213 | Chennai | NULL        |
+-----+------+--------+------------+------------+---------+-------------+


DBMS->
RDBMS->

DBMS (Database Management System): A software used to store, manage, and retrieve data.

Examples:
Microsoft Access
dBase
File-based systems

Features:
Data can be stored and managed.
May not support relationships between tables.
Redundancy (duplicate data) can be higher.
Suitable for small applications.


RDBMS (Relational Database Management System): A type of DBMS that stores data in tables (relations) and maintains relationships between them using keys.

Examples:
MySQL
Oracle Database
PostgreSQL
Microsoft SQL Server

Features:
Data is stored in rows and columns.
Supports relationships using Primary Key (PK) and Foreign Key (FK).
Reduces data redundancy through normalization.
Supports SQL queries.
Suitable for large and complex applications.

---------------------------------------------------------------------------------------
| DBMS                                      | RDBMS                                   |
| ----------------------------------------- | --------------------------------------- |
| Stores data as files or simple structures | Stores data in tables                   |
| Relationships are not mandatory           | Relationships are maintained using keys |
| Less secure                               | More secure                             |
| More redundancy                           | Less redundancy                         |
| Suitable for small applications           | Suitable for large applications         |
| Example: Access                           | Example: MySQL, Oracle                  |
---------------------------------------------------------------------------------------


mysql> CREATE TABLE Employee3 (
    ->     EMPID INT AUTO_INCREMENT,
    ->     EName VARCHAR(20) NOT NULL,
    ->     Dept VARCHAR(20) NOT NULL,
    ->     City VARCHAR(20) NOT NULL,
    ->     PRIMARY KEY (EMPID)
    -> );

mysql> CREATE TABLE Attendance (
    ->     EMPID INT NOT NULL,
    ->     EName VARCHAR(20),
    ->     Date VARCHAR(20),
    ->  	  FOREIGN KEY (EMPID) REFERENCES Employee3(EMPID)
    -> );

mysql> select * from employee3;
+-------+-------+------+-----------+
| EMPID | EName | Dept | City      |
+-------+-------+------+-----------+
|     1 | Rohit | IT   | Bangalore |
|     2 | Amit  | HR   | Mumbai    |
+-------+-------+------+-----------+

mysql> select * from attendance;
+-------+-------+------------+
| EMPID | EName | Date       |
+-------+-------+------------+
|     1 | Rohit | 2026-06-01 |
|     1 | Rohit | 2026-06-02 |
|     2 | Amit  | 2026-06-01 |
+-------+-------+------------+

"Display the attendance dates of the employee named 'Rohit'."
mysql> select ename,date from attendance where empid in(select empid from employee3 where ename='Rohit');
+-------+------------+
| ename | date       |
+-------+------------+
| Rohit | 2026-06-01 |
| Rohit | 2026-06-02 |
+-------+------------+

-----------------------------------------------------------------------------------------------------


whenever you want output from both the table

Joins

| Join Type                         | Description                                                                                        |
| --------------------------------- | -------------------------------------------------------------------------------------------------- |
| **INNER JOIN**                    | Returns only matching records from both tables.                                                    |
| **LEFT JOIN (LEFT OUTER JOIN)**   | Returns all records from the left table and matching records from the right table.                 |
| **RIGHT JOIN (RIGHT OUTER JOIN)** | Returns all records from the right table and matching records from the left table.                 |
| **CROSS JOIN**                    | Returns the Cartesian product (every row of one table combined with every row of the other table). |
| **SELF JOIN**                     | A table joined with itself. Uses INNER JOIN or LEFT JOIN syntax on the same table.                 |


->inner join- If you want to display data from two or more columns that belong to different tables, then we use JOIN operations to combine the tables based on a common column.

example:
there are two table t1,t2

t1 table
_______
|A|B|C|
-------
| | | |
-------

t2 table
_______
|A|D|E|
-------
| | | |
-------
_ _ _
|C|D|
-----
| | |
-----

Inner Join -> if matching records from both the tables;
Syntax: SELECT column1, column2, ...
	FROM table1
	INNER JOIN table2
	ON table1.common_column = table2.common_column;

mysql> create database example;

mysql> CREATE TABLE Employee (
    ->     EmpId INT PRIMARY KEY,
    ->     Ename VARCHAR(50),
    ->     Dept VARCHAR(50),
    ->     Location VARCHAR(50)
    -> );

mysql> CREATE TABLE Attendance (
    ->     EmpId INT,
    ->     Att_Date DATE,
    ->     Class VARCHAR(10),
    ->     FOREIGN KEY (EmpId)
    ->     REFERENCES Employee(EmpId)
    -> );

mysql> INSERT INTO Employee VALUES
    -> (100,'Smith','Science','Bangalore'),
    -> (101,'Carl','Social','Chennai'),
    -> (102,'Jimmy','Maths','Bangalore'),
    -> (103,'Dummy','English','Pune'),
    -> (104,'Donjohn','Hindi','Mumbai'),
    -> (105,'KimAlex','Kannada','Chennai');

mysql> INSERT INTO Attendance VALUES
    -> (100,'2016-02-23','I'),
    -> (100,'2016-02-23','II'),
    -> (102,'2016-02-23','I'),
    -> (102,NULL,NULL),
    -> (104,'2016-02-23','I');

mysql> select * from attendance;
+-------+------------+-------+
| EmpId | Att_Date   | Class |
+-------+------------+-------+
|   100 | 2016-02-23 | I     |
|   100 | 2016-02-23 | II    |
|   102 | 2016-02-23 | I     |
|   102 | NULL       | NULL  |
|   104 | 2016-02-23 | I     |
+-------+------------+-------+

mysql> select * from employee;
+-------+---------+---------+-----------+
| EmpId | Ename   | Dept    | Location  |
+-------+---------+---------+-----------+
|   100 | Smith   | Science | Bangalore |
|   101 | Carl    | Social  | Chennai   |
|   102 | Jimmy   | Maths   | Bangalore |
|   103 | Dummy   | English | Pune      |
|   104 | Donjohn | Hindi   | Mumbai    |
|   105 | KimAlex | Kannada | Chennai   |
+-------+---------+---------+-----------+

mysql> select employee.ename,employee.dept, attendance.att_date from employee inner join attendance on employee.empid=attendance.empid;
+---------+---------+------------+
| ename   | dept    | att_date   |
+---------+---------+------------+
| Smith   | Science | 2016-02-23 |
| Smith   | Science | 2016-02-23 |
| Jimmy   | Maths   | 2016-02-23 |
| Jimmy   | Maths   | NULL       |
| Donjohn | Hindi   | 2016-02-23 |
+---------+---------+------------+

mysql> SELECT e.Ename,
    -> e.Dept,
    -> a.Att_Date
    -> FROM Employee e
    -> INNER JOIN Attendance a
    -> ON e.EmpId = a.EmpId;
+---------+---------+------------+
| ename   | dept    | att_date   |
+---------+---------+------------+
| Smith   | Science | 2016-02-23 |
| Smith   | Science | 2016-02-23 |
| Jimmy   | Maths   | 2016-02-23 |
| Jimmy   | Maths   | NULL       |
| Donjohn | Hindi   | 2016-02-23 |
+---------+---------+------------+


give me the matching record between two tables and display location and class and employee id
mysql> SELECT employee.ename,
    ->        employee.dept,
    ->        attendance.att_date
    -> FROM employee
    -> INNER JOIN attendance
    -> ON employee.empid = attendance.empid;
+---------+---------+------------+
| ename   | dept    | att_date   |
+---------+---------+------------+
| Smith   | Science | 2016-02-23 |
| Smith   | Science | 2016-02-23 |
| Jimmy   | Maths   | 2016-02-23 |
| Jimmy   | Maths   | NULL       |
| Donjohn | Hindi   | 2016-02-23 |
| John    | Science | 2016-02-23 |
+---------+---------+------------+


left join- it give all the record from left table and only matching record from right right;

give me employee name department name and attendance date such that all records are display from left table and only matching record are display from the right table.

LEFT JOIN returns all rows from the left table and the matching rows from the right table. If no match exists, NULL values are returned for the right table columns.

mysql> SELECT employee.empid,
    ->        employee.ename,
    ->        employee.dept,
    ->        attendance.att_date
    -> FROM employee
    -> LEFT JOIN attendance
    -> ON employee.empid = attendance.empid;
+-------+---------+---------+------------+
| empid | ename   | dept    | att_date   |
+-------+---------+---------+------------+
|   100 | Smith   | Science | 2016-02-23 |
|   100 | Smith   | Science | 2016-02-23 |
|   101 | Carl    | Social  | NULL       |
|   102 | Jimmy   | Maths   | 2016-02-23 |
|   102 | Jimmy   | Maths   | NULL       |
|   103 | Dummy   | English | NULL       |
|   104 | Donjohn | Hindi   | 2016-02-23 |
|   105 | KimAlex | Kannada | NULL       |
|   106 | John    | Science | 2016-02-23 |
+-------+---------+---------+------------+

"Give employee id, dept and class such that all records are displayed from the left table and any matching records from the right table."
mysql> SELECT employee.empid,
    ->        employee.dept,
    ->        attendance.att_date
    -> FROM employee
    -> LEFT JOIN attendance
    -> ON employee.empid = attendance.empid;


right join-> give me all record from right table and only matching record from left table.

"Give me employee name, dept, attendance date such that all records are picked up from the right table and only matching records from the left table."

mysql> select * from employee;
+-------+---------+---------+-----------+
| EmpId | Ename   | Dept    | Location  |
+-------+---------+---------+-----------+
|   100 | Smith   | Science | Bangalore |
|   101 | Carl    | Social  | Chennai   |
|   102 | Jimmy   | Maths   | Bangalore |
|   103 | Dummy   | English | Pune      |
|   104 | Donjohn | Hindi   | Mumbai    |
|   105 | KimAlex | Kannada | Chennai   |
+-------+---------+---------+-----------+

mysql> select * from attendance;
+-------+------------+-------+
| EmpId | Att_Date   | Class |
+-------+------------+-------+
|   100 | 2016-02-23 | I     |
|   100 | 2016-02-23 | II    |
|   102 | 2016-02-23 | I     |
|   102 | NULL       | NULL  |
|   104 | 2016-02-23 | I     |
|   106 | 2016-02-23 | IV    |
+-------+------------+-------+

mysql> select employee.empid, employee.dept, attendance.att_date from employee right join attendance on employee.empid=attendance.empid;
+-------+---------+------------+
| empid | dept    | att_date   |
+-------+---------+------------+
|   100 | Science | 2016-02-23 |
|   100 | Science | 2016-02-23 |
|   102 | Maths   | 2016-02-23 |
|   102 | Maths   | NULL       |
|   104 | Hindi   | 2016-02-23 |
|  NULL | NULL    | 2016-02-23 |
+-------+---------+------------+

"Give me attendance date, class, employee name such that all the details of attendance should be taken into consideration but only matching records should be picked up."
mysql> SELECT attendance.att_date,
    ->        attendance.class,
    ->        employee.ename
    -> FROM employee
    -> RIGHT JOIN attendance
    -> ON employee.empid = attendance.empid;
+------------+-------+---------+
| att_date   | class | ename   |
+------------+-------+---------+
| 2016-02-23 | I     | Smith   |
| 2016-02-23 | II    | Smith   |
| 2016-02-23 | I     | Jimmy   |
| NULL       | NULL  | Jimmy   |
| 2016-02-23 | I     | Donjohn |
| 2016-02-23 | IV    | NULL    |
+------------+-------+---------+


CROSS JOIN (Cartesian Product): Cartesian Product means every single record from Table 1 is combined with every single record from Table 2, regardless of whether the records match or not.

CROSS JOIN (Cartesian Product) = Every single record of the first table is multiplied (combined) with every single record of the second table.

Cartesian Product means every single record from Table 1 is combined with every single record from Table 2, regardless of whether the records match or not.


mysql> select employee.empid, employee.ename, attendance.class from employee,attendance;
+-------+---------+-------+
| empid | ename   | class |
+-------+---------+-------+
|   105 | KimAlex | I     |
|   104 | Donjohn | I     |
|   103 | Dummy   | I     |
|   102 | Jimmy   | I     |
|   101 | Carl    | I     |
|   100 | Smith   | I     |
|   105 | KimAlex | II    |
|   104 | Donjohn | II    |
|   103 | Dummy   | II    |
|   102 | Jimmy   | II    |
|   101 | Carl    | II    |
|   100 | Smith   | II    |
|   105 | KimAlex | I     |
|   104 | Donjohn | I     |
|   103 | Dummy   | I     |
|   102 | Jimmy   | I     |
|   101 | Carl    | I     |
|   100 | Smith   | I     |
|   105 | KimAlex | NULL  |
|   104 | Donjohn | NULL  |
|   103 | Dummy   | NULL  |
|   102 | Jimmy   | NULL  |
|   101 | Carl    | NULL  |
|   100 | Smith   | NULL  |
|   105 | KimAlex | I     |
|   104 | Donjohn | I     |
|   103 | Dummy   | I     |
|   102 | Jimmy   | I     |
|   101 | Carl    | I     |
|   100 | Smith   | I     |
|   105 | KimAlex | IV    |
|   104 | Donjohn | IV    |
|   103 | Dummy   | IV    |
|   102 | Jimmy   | IV    |
|   101 | Carl    | IV    |
|   100 | Smith   | IV    |
+-------+---------+-------+

give second maximum salary->sub query

give me the name of the employee whose dob is in the year 2000

mysql> SELECT *
    -> FROM Employee2
    -> WHERE YEAR(DOB) = 2000;
+-------+---------+---------+-----------+------------+
| EmpId | Ename   | Dept    | Location  | DOB        |
+-------+---------+---------+-----------+------------+
|   100 | Smith   | Science | Bangalore | 2000-05-15 |
|   102 | Jimmy   | Maths   | Bangalore | 2000-12-10 |
|   105 | KimAlex | Kannada | Chennai   | 2000-11-30 |
+-------+---------+---------+-----------+------------+


mysql> SELECT YEAR(NOW())   AS Year,
    ->        MONTH(NOW())  AS Month,
    ->        DAY(NOW())    AS Day,
    ->        HOUR(NOW())   AS Hour,
    ->        MINUTE(NOW()) AS Minute,
    ->        SECOND(NOW()) AS Second;
+------+-------+------+------+--------+--------+
| Year | Month | Day  | Hour | Minute | Second |
+------+-------+------+------+--------+--------+
| 2026 |     6 |    3 |   11 |     35 |     22 |
+------+-------+------+------+--------+--------+
