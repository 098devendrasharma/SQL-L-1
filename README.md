# MySQL 8.0 CE Notes

**Table of Contents:**  
\- [SELECT Statement](#bookmark=id.sdt088ihdaby)  
\- [WHERE Clause](#bookmark=id.sseoia2rra4a)  
\- [LIKE Operator](#bookmark=id.xvhqovbf1s2j)  
\- [ORDER BY Clause](#bookmark=id.736f6vha7uop)  
\- [Aggregate Functions](#bookmark=id.s8zt5mm2674a)  
\- [String Functions](#bookmark=id.lg8xhlaepek7)  
\- [Numeric Functions](#bookmark=id.42lzulamf0yg)  
\- [Date Functions](#bookmark=id.17dqdqs1blwb)  
\- [Joins](#bookmark=id.1z81oiijadpj)  
\- [Subqueries](#bookmark=id.wxziv29rmkf9)  
\- [Normalization](#bookmark=id.v30wnm7kpoci)  
\- [Constraints](#bookmark=id.xpy4du4k02nx)  
\- [DDL (Data Definition Language)](#bookmark=id.supruo8v98to)  
\- [DML (Data Manipulation Language)](#bookmark=id.rutmwik964x9)  
\- [Data Types](#bookmark=id.sqauxugknd9p)  
\- [Window Functions](#bookmark=id.1mpj4ov1uydh)

## SELECT Statement

**Definition:** The SELECT statement is the fundamental query used to retrieve data from a database. It specifies the columns to return and the table from which to fetch them. In MySQL, the SELECT statement “is used to select data from a database” and returns the results as a result-set[\[1\]](https://www.w3schools.com/mysql/mysql_select.asp#:~:text=The%20,select%20data%20from%20a%20database).

**Syntax:**

SELECT column1, column2, ...   
FROM table\_name   
\[WHERE condition\]  
\[ORDER BY column \[ASC|DESC\]\]  
\[LIMIT count\];

\- SELECT \* can be used to retrieve all columns.  
\- Clauses such as WHERE, GROUP BY, HAVING, and ORDER BY can refine the query (see respective sections).

**Example:**

SELECT actor\_id, first\_name, last\_name   
FROM actor;

*Output:* A result table with columns actor\_id, first\_name, last\_name for each actor. For example:

| actor\_id | first\_name | last\_name |
| ----: | :---- | :---- |
| 1 | PENELOPE | GUINESS |
| 2 | NICK | WAHLBERG |
| 3 | ED | CHASE |
| ... more rows ... |  |  |

**Explanation:** This query selects the actor\_id, first\_name, and last\_name from the actor table. The actor table’s rows are returned exactly as stored, in no particular order by default. You can use SELECT \* to get all columns. Each returned row appears once in the result-set, as defined by the columns in the SELECT clause[\[1\]](https://www.w3schools.com/mysql/mysql_select.asp#:~:text=The%20,select%20data%20from%20a%20database).

**Practice Question:** Write a query to retrieve the first and last names of all employees from an employees table.

* **Solution:**

* SELECT first\_name, last\_name FROM employees;

* **Output (example):**

| first\_name | last\_name |
| :---- | :---- |
| Alice | Smith |
| Bob | Johnson |
| Carol | Lee |
| ... | ... |

## WHERE Clause

**Definition:** The WHERE clause filters rows returned by a SELECT (or UPDATE/DELETE) to include only those that meet a specified condition. The WHERE clause “is used to filter records. It is used to extract only those records that fulfill a specified condition”[\[2\]](https://www.w3schools.com/sql/sql_where.asp#:~:text=The%20,to%20filter%20records).

**Syntax:**

SELECT columns   
FROM table\_name   
WHERE condition;

\- Conditions can use comparison operators (\=, \>, \<, \>=, \<=, \<\>), logical operators (AND, OR, NOT), pattern matching (LIKE), range (BETWEEN), set membership (IN), etc.

**Example:**

SELECT actor\_id, first\_name, last\_name   
FROM actor   
WHERE last\_name \= 'WAHLBERG';

*Output:* Only actors with the last name “WAHLBERG”. For example:

| actor\_id | first\_name | last\_name |
| ----: | :---- | :---- |
| 2 | NICK | WAHLBERG |
| 5 | JULIA | WAHLBERG |

**Explanation:** This query selects the actor ID, first name, and last name from actor, but only for rows where the last\_name equals 'WAHLBERG'. The WHERE clause filters out any rows that do not meet this condition[\[2\]](https://www.w3schools.com/sql/sql_where.asp#:~:text=The%20,to%20filter%20records). Without WHERE, all rows would be returned.

**Practice Question:** From a table customers with columns (customer\_id, name, age, city), find all customers older than 30\.

* **Solution:**

* SELECT customer\_id, name, age, city  
  FROM customers  
  WHERE age \> 30;

* **Output (example):**

| customer\_id | name | age | city |
| :---- | :---- | :---- | :---- |
| 12 | Diana | 45 | Miami |
| 15 | Ethan | 38 | Seattle |
| ... | ... | ... | ... |

## LIKE Operator

**Definition:** The LIKE operator, used within a WHERE clause, performs pattern matching on string data. It allows searching for a specified pattern with wildcards. W3Schools notes that “the LIKE operator is used in a WHERE clause to search for a specified pattern in a column”[\[3\]](https://www.w3schools.com/mysql/mysql_like.asp#:~:text=The%20MySQL%20LIKE%20Operator). % matches zero or more characters, and \_ matches exactly one character.

**Syntax:**

SELECT columns   
FROM table\_name   
WHERE column LIKE 'pattern';

\- Common patterns:  
\- 'A%' matches any value starting with 'A'.  
\- '%xyz%' matches any value containing 'xyz'.  
\- '\_\_\_\_' (four underscores) matches any four-character string.

**Example:**

SELECT first\_name   
FROM actor   
WHERE first\_name LIKE 'P%';

*Output:* Actors whose first names start with "P":

| first\_name |
| :---- |
| PENELOPE |
| PRESTON |

**Explanation:** The pattern 'P%' means any string starting with 'P'. The query returns first names beginning with 'P' by matching the first\_name column against the pattern[\[4\]](https://www.w3schools.com/mysql/mysql_like.asp#:~:text=The%20,specified%20pattern%20in%20a%20column). You can use % at the beginning, end, or both to match substrings, and \_ to match a single character.

**Practice Question:** In a products table (product\_id, product\_name), find products whose names end with “Pro”.

* **Solution:**

* SELECT product\_id, product\_name  
  FROM products  
  WHERE product\_name LIKE '%Pro';

* **Output (example):**

| product\_id | product\_name |
| ----: | :---- |
| 7 | Laptop Pro |
| 13 | Camera Pro |
| ... | ... |

## ORDER BY Clause

**Definition:** The ORDER BY clause sorts the result set by one or more columns. By default, it sorts in ascending order. W3Schools states: “The ORDER BY keyword is used to sort the result-set in ascending or descending order”[\[5\]](https://www.w3schools.com/sql/sql_orderby.asp#:~:text=The%20SQL%20ORDER%20BY).

**Syntax:**

SELECT columns   
FROM table\_name   
\[WHERE condition\]   
ORDER BY column1 \[ASC|DESC\], column2 \[ASC|DESC\], ...;

\- Use ASC for ascending (default) or DESC for descending order.  
\- You can sort by one or multiple columns (priority left to right).

**Example:**

SELECT actor\_id, first\_name, last\_name   
FROM actor   
ORDER BY last\_name ASC;

*Output:* Actors sorted alphabetically by last name:

| actor\_id | first\_name | last\_name |
| ----: | :---- | :---- |
| 8 | YOSHIO | ICHIROU |
| 19 | JOEL | SMITH |
| 5 | JULIA | WAHLBERG |
| ... more rows ... | ... | ... |

**Explanation:** This query selects from actor and orders the result by last\_name in ascending order[\[5\]](https://www.w3schools.com/sql/sql_orderby.asp#:~:text=The%20SQL%20ORDER%20BY). If two actors share the same last name, their relative order is arbitrary unless a second column is specified. To reverse the order, one would add DESC after the column name.

**Practice Question:** List all customers from a customers table sorted by city in descending order.

* **Solution:**

* SELECT customer\_id, name, city  
  FROM customers  
  ORDER BY city DESC;

* **Output (example):**

| customer\_id | name | city |
| ----: | :---- | :---- |
| 22 | Olivia | Warsaw |
| 14 | Michael | Tokyo |
| ... | ... | ... |

## Aggregate Functions

**Definition:** Aggregate functions compute a single result from multiple rows. Common ones include COUNT, AVG, SUM, MIN, and MAX. These functions summarize or aggregate data over rows. For example, COUNT() returns the number of matching rows, AVG() computes the average, and SUM() adds values[\[6\]](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp#:~:text=The%20,that%20matches%20a%20specified%20criterion). Likewise, MIN() and MAX() return the smallest and largest values in a column[\[7\]](https://www.w3schools.com/sql/sql_min_max.asp#:~:text=The%20SQL%20MIN,Functions). Aggregate functions often accompany a GROUP BY clause, though basic uses do not require it.

**Syntax:**

SELECT   
  COUNT(column) AS count\_col,   
  AVG(column) AS avg\_col,   
  SUM(column) AS sum\_col,   
  MIN(column) AS min\_col,   
  MAX(column) AS max\_col  
FROM table\_name  
\[WHERE condition\];

**Example:**

SELECT   
  COUNT(actor\_id) AS actor\_count,  
  AVG(age) AS avg\_age,  
  SUM(salary) AS total\_salary  
FROM employees  
WHERE department \= 'Sales';

*Output:* A single row with summary values, e.g.:

| actor\_count | avg\_age | total\_salary |
| ----: | :---- | :---- |
| 120 | 35.4 | 4500000 |

**Explanation:**  
\- COUNT(actor\_id) counts the number of rows where actor\_id is not NULL.  
\- AVG(age) calculates the average of the age column.  
\- SUM(salary) adds up all salary values for Sales employees.  
Each aggregate returns one value summarizing the matching rows[\[6\]](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp#:~:text=The%20,that%20matches%20a%20specified%20criterion)[\[7\]](https://www.w3schools.com/sql/sql_min_max.asp#:~:text=The%20SQL%20MIN,Functions). Note that WHERE filters rows before aggregation.

**Practice Question:** Given a table orders(order\_id, amount, order\_date), find the total number of orders and average order amount for all orders in 2025\.

* **Solution:**

* SELECT   
    COUNT(order\_id) AS total\_orders,  
    AVG(amount) AS avg\_amount  
  FROM orders  
  WHERE order\_date BETWEEN '2025-01-01' AND '2025-12-31';

* **Output (example):**

| total\_orders | avg\_amount |
| ----: | ----: |
| 250 | 123.45 |

## String Functions

**Definition:** MySQL provides many built-in string functions to manipulate text. Examples include CHAR\_LENGTH() (returns string length), CONCAT() (concatenates strings), LOWER()/UPPER() (convert case), TRIM() (remove whitespace), SUBSTR()/SUBSTRING() (extract substring), REPLACE(), and others. These functions operate on text data types (CHAR, VARCHAR, TEXT, etc.).

**Syntax Examples:**  
\- CHAR\_LENGTH(str) – returns the number of characters in str.  
\- CONCAT(str1, str2, ...) – returns the concatenation of the arguments.  
\- LOWER(str) / UPPER(str) – convert case of str.  
\- SUBSTR(str, pos, len) – returns len characters from str starting at pos.  
\- TRIM(str) – removes leading/trailing spaces from str.

**Example:**

SELECT   
  first\_name,   
  CHAR\_LENGTH(first\_name) AS name\_length,  
  CONCAT(first\_name, ' ', last\_name) AS full\_name,  
  UPPER(last\_name) AS last\_upper  
FROM actor;

*Output:* Each actor’s first name, its length, their full name, and last name in uppercase. For example:

| first\_name | name\_length | full\_name | last\_upper |
| :---- | :---- | :---- | :---- |
| PENELOPE | 8 | PENELOPE GUINESS | GUINESS |
| NICK | 4 | NICK WAHLBERG | WAHLBERG |
| ED | 2 | ED CHASE | CHASE |
| ... | ... | ... | ... |

**Explanation:**  
\- CHAR\_LENGTH(first\_name) returns the length of the first name string (e.g. “PENELOPE” has length 8).  
\- CONCAT(first\_name, ' ', last\_name) joins first and last name with a space.  
\- UPPER(last\_name) converts the last name to uppercase.  
These functions process each row’s data and return new values based on string manipulation.

**Practice Question:** In a table books(title, author), write a query to list each title and author in the format "Title by Author" (e.g. The Hobbit by Tolkien).

* **Solution:**

* SELECT CONCAT(title, ' by ', author) AS book\_info  
  FROM books;

* **Output (example):**

| book\_info |
| :---- |
| The Hobbit by Tolkien |
| 1984 by Orwell |
| ... |

## Numeric Functions

**Definition:** Numeric functions perform arithmetic or mathematical operations on numbers. MySQL provides many, including ROUND(), FLOOR(), CEIL() (or CEILING()), MOD(), POW()/POWER(), ABS(), etc. These functions help manipulate numeric data, such as rounding values or computing remainders.

**Syntax Examples:**  
\- ROUND(x, d) – rounds x to d decimal places.  
\- FLOOR(x) / CEIL(x) – round x down/up to the nearest integer.  
\- MOD(a, b) – returns a modulo b (remainder after division).  
\- ABS(x) – absolute value of x.  
\- POWER(x, y) – x raised to the power y.

**Example:**

SELECT   
  price,   
  ROUND(price, 2\) AS price\_rounded,  
  MOD(price, 10\) AS price\_mod\_10  
FROM products;

*Output:* Each product’s price, rounded to two decimals, and its remainder when divided by 10\. For example:

| price | price\_rounded | price\_mod\_10 |
| :---- | :---- | :---- |
| 123.456 | 123.46 | 3 |
| 50.0 | 50.00 | 0 |
| 99.9 | 99.90 | 9 |

**Explanation:**  
\- ROUND(price, 2\) rounds the price value to two decimal places (e.g. 123.456 becomes 123.46).  
\- MOD(price, 10\) returns the remainder of dividing price by 10 (e.g. 123.456 mod 10 is 3.456 truncated to 3 in integer context).  
These functions are applied to numeric columns to transform or analyze numeric values.

**Practice Question:** For a table measurements(val) with numeric values, return each value and its integer part using FLOOR().

* **Solution:**

* SELECT val, FLOOR(val) AS int\_part  
  FROM measurements;

* **Output (example):**

| val | int\_part |
| :---- | :---- |
| 12.34 | 12 |
| 7.99 | 7 |
| \-3.5 | \-4 |

## Date Functions

**Definition:** MySQL offers built-in date and time functions to manipulate date/time data. Common functions include NOW() (current date-time), CURDATE() (current date), YEAR(date), MONTH(date), DAY(date), DATE\_ADD(date, INTERVAL), DATEDIFF(), DATE\_FORMAT(), and many others. These functions let you extract parts of dates or perform date arithmetic.

**Syntax Examples:**  
\- NOW() – returns current timestamp.  
\- CURDATE() – returns current date.  
\- YEAR(date) – extracts the year from a date.  
\- DATEDIFF(date1, date2) – returns the difference in days between two dates.  
\- DATE\_ADD(date, INTERVAL n DAY) – adds days to a date.  
\- DATE\_FORMAT(date, '%Y-%m-%d') – formats date as string.

**Example:**

SELECT   
  CURDATE() AS today,  
  YEAR(CURDATE()) AS this\_year,  
  DATE\_FORMAT(NOW(), '%d-%b-%Y %H:%i:%s') AS formatted\_now;

*Output:* The current date and derived values, for example:

| today | this\_year | formatted\_now |
| :---- | :---- | :---- |
| 2025-11-05 | 2025 | 05-Nov-2025 08:51:17 |

**Explanation:**  
\- CURDATE() returned the current date (e.g. 2025-11-05).  
\- YEAR(CURDATE()) extracted the year (2025).  
\- DATE\_FORMAT(NOW(), ...) formatted the current timestamp into a custom string (day-month-year hours:minutes:seconds).  
These date functions help manipulate and extract data from date/time columns or return the current system date/time.

**Practice Question:** Given a table events(event\_date), find the number of days between each event date and today.

* **Solution:**

* SELECT   
    event\_date,  
    DATEDIFF(CURDATE(), event\_date) AS days\_since\_event  
  FROM events;

* **Output (example):**

| event\_date | days\_since\_event |
| :---- | :---- |
| 2025-01-01 | 308 |
| 2025-10-15 | 21 |
| ... | ... |

## Joins

**Definition:** Joins combine rows from two or more tables based on related columns. The most common types are:

* **INNER JOIN:** Returns only rows with matching values in both tables. (Records present in both sides of the join.)

* **LEFT JOIN (Left Outer Join):** Returns all rows from the left (first) table, and the matched rows from the right table. Non-matching right-side rows yield NULL for right columns.

* **RIGHT JOIN (Right Outer Join):** Returns all rows from the right table, and matched rows from the left table. Non-matches from left appear as NULL on the left side.

* **CROSS JOIN:** Returns the Cartesian product of two tables (every combination of rows). Rarely used without a join condition.

(Note: MySQL does not support FULL OUTER JOIN directly, but it can be emulated with UNION of left and right joins.)

**Syntax Examples:**

SELECT a.col1, b.col2  
FROM tableA AS a  
INNER JOIN tableB AS b ON a.key \= b.key;

SELECT a.col1, b.col2  
FROM tableA AS a  
LEFT JOIN tableB AS b ON a.key \= b.key;

SELECT a.col1, b.col2  
FROM tableA AS a  
RIGHT JOIN tableB AS b ON a.key \= b.key;

SELECT \*  
FROM tableA  
CROSS JOIN tableB;

**Example (Inner Join):** Suppose product(id, name) and orders(id, product\_id, qty). To list each order with its product name:

SELECT o.id AS order\_id, p.name AS product\_name, o.qty  
FROM orders AS o  
INNER JOIN product AS p   
  ON o.product\_id \= p.id;

*Output:* A table of order\_id, product\_name, and qty only for orders that have a matching product:

| order\_id | product\_name | qty |
| ----: | :---- | ----- |
| 994 | iphone | 10 |
| 995 | fridge | 5 |
| ... more rows ... |  |  |

**Explanation:**  
\- The INNER JOIN matched orders.product\_id with product.id, returning only those orders where the product exists.  
\- A LEFT JOIN on the same tables would include all orders, showing NULL for product\_name if an order’s product\_id had no match.  
\- A CROSS JOIN of product and orders would return every combination of product and order (usually not needed).

**Practice Question:** Given employees(emp\_id, dept\_id) and departments(dept\_id, dept\_name), write a query to list each employee’s ID and department name. Include all employees, even if their dept\_id has no matching department.

* **Solution:**

* SELECT e.emp\_id, d.dept\_name  
  FROM employees AS e  
  LEFT JOIN departments AS d   
    ON e.dept\_id \= d.dept\_id;

* **Output (example):**

| emp\_id | dept\_name |
| :---- | :---- |
| 1 | Sales |
| 2 | Marketing |
| 3 | NULL (if dept\_id missing) |

## Subqueries

**Definition:** A subquery (or nested query) is a query within another query. The inner query executes first, and its result is used by the outer query. Subqueries can appear in SELECT, FROM, WHERE, and other clauses. They are often used to filter results based on aggregated or conditional logic from another query[\[8\]](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/#:~:text=A%20nested%20query%20,easier%20to%20read%20and%20maintain).

**Syntax:**

SELECT columns  
FROM table1  
WHERE column \[operator\] (SELECT column FROM table2 WHERE condition);

Examples include \= ANY (subquery), IN (subquery), EXISTS (subquery), or simple comparison with the subquery result.

**Example:** Find customers in the same country as customer ‘David’:

SELECT \*   
FROM customers  
WHERE country \= (  
  SELECT country   
  FROM customers   
  WHERE first\_name \= 'David'  
);

*Output:* All customers whose country equals the country of the customer named David.

**Explanation:** The inner subquery

SELECT country FROM customers WHERE first\_name \= 'David';

finds David’s country. The outer query then retrieves all customers with that country. The inner query runs first and returns a value used by the outer WHERE clause[\[8\]](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/#:~:text=A%20nested%20query%20,easier%20to%20read%20and%20maintain). If the inner query returns multiple rows, you can use operators like IN, ANY, or ALL (e.g. country IN (subquery)).

**Practice Question:** In a table salaries(emp\_id, salary), find employees whose salary is above the average salary.

* **Solution:**

* SELECT emp\_id, salary  
  FROM salaries  
  WHERE salary \> (SELECT AVG(salary) FROM salaries);

* **Output (example):**

| emp\_id | salary |
| :---- | :---- |
| 7 | 120000 |
| 15 | 95000 |
| ... | ... |

## Normalization

**Definition:** **Database normalization** is the design principle of organizing data to minimize redundancy and improve data integrity. It typically involves dividing data into multiple related tables and defining relationships between them. As freeCodeCamp describes: normalization “entails organizing a database into several tables in order to reduce redundancy” and helps avoid duplicates and maintain integrity[\[9\]](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/#:~:text=Database%20normalization%20is%20a%20database,an%20organized%20and%20consistent%20way).

* **1NF (First Normal Form):** Each table cell must hold atomic (indivisible) values, and each record must be unique. No repeating groups or multiple values in a single field.

* **2NF (Second Normal Form):** Table is in 1NF and all non-key attributes are fully functionally dependent on the primary key (no partial dependencies on part of a composite key).

* **3NF (Third Normal Form):** Table is in 2NF and all the attributes are only dependent on the primary key (no transitive dependencies).

**Example:** A Student table with fields (StudentId, Name, Course) where Course contains comma-separated values (e.g. Math,Science) is not in 1NF. Splitting into multiple rows so each row has only one course value achieves 1NF. Further splitting courses into a separate StudentCourse table (with StudentId and Course) can be needed for 2NF/3NF to remove redundancy.

**Practice Question:** Given a table sales(order\_id, product, quantity, product\_price), what changes would you make to normalize the data?

* **Solution:** One step is to ensure 1NF by not storing multiple products per row. Then separate into a products table (product, product\_price) and an orders table with (order\_id, product, quantity) referencing products. This removes redundancy of storing price with each order and avoids partial dependencies, moving towards 2NF/3NF.

## Constraints

**Definition:** Constraints enforce rules on data in a table to maintain accuracy and integrity. Common constraints include: \- PRIMARY KEY: A combination of NOT NULL and UNIQUE that uniquely identifies each row[\[10\]](https://www.w3schools.com/mysql/mysql_constraints.asp#:~:text=%2A%20%60PRIMARY%20KEY%20%60%20,would%20destroy%20links%20between%20tables).  
\- FOREIGN KEY: Ensures that a column (or set of columns) matches a primary (or unique) key in another table. It “prevents actions that would destroy links between tables”[\[10\]](https://www.w3schools.com/mysql/mysql_constraints.asp#:~:text=%2A%20%60PRIMARY%20KEY%20%60%20,would%20destroy%20links%20between%20tables), maintaining referential integrity.  
\- UNIQUE: Ensures all values in a column are distinct.  
\- NOT NULL: Ensures a column cannot have NULL (empty) values.  
\- CHECK: Enforces that values in a column satisfy a specific condition (e.g. CHECK (age \>= 0\)).  
\- DEFAULT: Specifies a default value for a column if none is provided on insert (e.g. DEFAULT 'N/A').

**Syntax Examples:**

CREATE TABLE employees (  
  emp\_id INT PRIMARY KEY,  
  email VARCHAR(100) UNIQUE,  
  age INT NOT NULL,  
  salary DECIMAL(10,2) CHECK (salary \>= 0\) DEFAULT 0  
);

\- PRIMARY KEY (emp\_id) uniquely identifies each employee.  
\- UNIQUE (email) prevents duplicate email addresses.  
\- NOT NULL on age means age must be provided.  
\- CHECK (salary \>= 0\) ensures negative salaries cannot be inserted.

**Practice Question:** Create a table users with an integer primary key id, a username that must be unique and not null, and an email that has a default value of 'unknown'.

* **Solution:**

* CREATE TABLE users (  
    id INT PRIMARY KEY,  
    username VARCHAR(50) NOT NULL UNIQUE,  
    email VARCHAR(100) DEFAULT 'unknown'  
  );

* **Output:** Describing the table (DESCRIBE users;) would show the constraints on each column.

## DDL (Data Definition Language)

**Definition:** DDL commands define or modify the database schema and structure. They include **CREATE**, **ALTER**, **DROP**, **TRUNCATE**, **COMMENT**, and **RENAME** operations for databases, tables, columns, indexes, etc. DDL commands deal with descriptions of the database schema and are used to create or modify database objects[\[11\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=DDL%C2%A0,database%20objects%20in%20the%20database).

**Common Commands:**  
\- CREATE DATABASE dbname; – creates a new database.  
\- DROP TABLE table\_name; – deletes a table and its data.  
\- CREATE TABLE: defines a new table and its columns.  
\- ALTER TABLE: adds, drops, or modifies columns in an existing table.  
\- TRUNCATE TABLE table\_name; – removes all data from a table (faster than DELETE) but keeps the table structure.

**Example:**

CREATE TABLE products (  
  product\_id INT PRIMARY KEY,  
  product\_name VARCHAR(50),  
  price DECIMAL(8,2)  
);

*Output:* The table products is created. (No row output; to verify, one might use DESCRIBE products; to see its schema.)

**Explanation:** The CREATE TABLE command defines a new table structure. The DROP command would remove the table. DDL commands do not typically return row results but affect the schema.

**Practice Question:** Write a DDL command to create a table departments(dept\_id INT PRIMARY KEY, dept\_name VARCHAR(100)).

* **Solution:**

* CREATE TABLE departments (  
    dept\_id INT PRIMARY KEY,  
    dept\_name VARCHAR(100)  
  );

* **Output:** No direct output, but DESCRIBE departments; would show the two columns with dept\_id as primary key.

## DML (Data Manipulation Language)

**Definition:** DML commands manipulate the data within existing tables. They include **INSERT**, **UPDATE**, **DELETE**, and also **SELECT** (sometimes classified as DQL, but it retrieves data). DML is used to query and modify the data stored in tables[\[12\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=3.%20DML%20,Language).

**Common Commands:**  
\- INSERT INTO table (columns) VALUES (...) – adds new rows.  
\- UPDATE table SET col=value, ... WHERE condition; – modifies existing rows.  
\- DELETE FROM table WHERE condition; – removes rows.  
\- SELECT is used to retrieve data.

**Example (INSERT and UPDATE):**

INSERT INTO employees (emp\_id, name, dept\_id) VALUES (101, 'Alice', 1);

UPDATE employees   
SET dept\_id \= 2   
WHERE emp\_id \= 101;

SELECT emp\_id, name, dept\_id FROM employees WHERE emp\_id \= 101;

*Output:*  
After the SELECT, one would see:

| emp\_id | name | dept\_id |
| :---- | :---- | :---- |
| 101 | Alice | 2 |

**Explanation:**  
\- The INSERT command added a new employee.  
\- The UPDATE changed Alice’s department from 1 to 2\.  
\- The SELECT then retrieves Alice’s record showing the updated department.

**Practice Question:** Given a table inventory(item\_id, stock), write a command to reduce the stock of item 5 by 10\.

* **Solution:**

* UPDATE inventory  
  SET stock \= stock \- 10  
  WHERE item\_id \= 5;

* **Output:** No output, but verifying with SELECT stock FROM inventory WHERE item\_id \= 5; would show the decreased stock.

## Data Types

**Definition:** MySQL data types specify the kind of data a column can hold. There are three main categories: **string (text)**, **numeric**, and **date/time** types[\[13\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=In%20MySQL%20there%20are%20three,numeric%2C%20and%20date%20and%20time). Within these:

* **String types:** CHAR, VARCHAR, TEXT, BLOB, ENUM, SET, etc. For example, VARCHAR(50) holds variable-length text up to 50 characters[\[14\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Data%20type%20Description%20CHAR,Default%20is%201).

* **Numeric types:** TINYINT, INT, BIGINT, DECIMAL, FLOAT, etc. For example, INT for whole numbers and DECIMAL(10,2) for fixed-point precision.

* **Date/time types:** DATE, DATETIME, TIMESTAMP, TIME, YEAR, etc. For example, DATE stores a date in YYYY-MM-DD format and DATETIME stores full date and time[\[15\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Date%20and%20Time%20Data%20Types).

Each type has specific range and storage requirements. For example, INT is a 4-byte integer, CHAR(n) is a fixed-length text of n characters, and DATE ranges from year 1000 to 9999[\[16\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Data%20type%20Description%20DATE%20A,DD%20hh%3Amm%3Ass). Choosing appropriate types is crucial for efficiency and correctness.

**Example:**

CREATE TABLE sample (  
  id INT,                \-- numeric integer  
  name VARCHAR(100),     \-- variable-length string  
  price DECIMAL(7,2),    \-- numeric with 2 decimal places  
  created\_at DATETIME    \-- date and time  
);

This defines id as an integer, name as text up to 100 chars, price as a decimal number, and created\_at as a date-time stamp.

**Practice Question:** In a table for products, which data type would you use for a serial product number (prod\_no) and for a product description?

* **Solution:**

* prod\_no could be an integer type (INT or BIGINT) if numeric, or VARCHAR if it includes letters.

* description should be a text type, e.g. TEXT or a large VARCHAR.

## Window Functions

**Definition:** Window (analytic) functions perform calculations across a set of rows that are related to the current row, without collapsing them. They use the OVER() clause to define a window (range/partition) of rows. As explained by MySQL docs, a window function computes an aggregate for each row while still returning each row[\[17\]](https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/#:~:text=Similar%20to%20grouped%20aggregate%20functions%2C,each%20row%20retain%20its%20identity). For example, ROW\_NUMBER(), RANK(), DENSE\_RANK(), LAG(), LEAD(), and aggregate functions can all be used as window functions.

**Syntax Example:**

SELECT   
  employee\_id,  
  salary,  
  ROW\_NUMBER() OVER (ORDER BY salary DESC) AS salary\_rank,  
  AVG(salary) OVER () AS avg\_salary  
FROM employees;

\- ROW\_NUMBER() OVER (ORDER BY salary DESC) assigns a rank 1,2,3… based on descending salary.  
\- AVG(salary) OVER () computes the overall average salary for every row.

**Example:**

SELECT   
  emp\_id,   
  salary,   
  RANK() OVER (PARTITION BY dept\_id ORDER BY salary DESC) AS dept\_rank  
FROM employees;

*Output:* Each employee with their salary and rank within their department:

| emp\_id | salary | dept\_rank |
| :---- | :---- | :---- |
| 5 | 120000 | 1 |
| 12 | 115000 | 2 |
| 7 | 98000 | 3 |
| ... | ... | ... |

**Explanation:** The RANK() OVER (PARTITION BY dept\_id ORDER BY salary DESC) calculates the rank of each employee’s salary within their department. Every row is returned along with its computed rank. The window (partition by department) defines which rows are compared for each result row. Window functions let each row “see” other rows in its partition. In contrast to GROUP BY aggregates, window functions do not reduce the number of rows[\[17\]](https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/#:~:text=Similar%20to%20grouped%20aggregate%20functions%2C,each%20row%20retain%20its%20identity); they only add calculated columns.

**Practice Question:** In a table sales(emp\_id, sale\_amount), produce each emp\_id, sale\_amount, and the cumulative sum of sale\_amount ordered by sale\_amount descending.

* **Solution:**

* SELECT   
    emp\_id,   
    sale\_amount,  
    SUM(sale\_amount) OVER (ORDER BY sale\_amount DESC) AS cumulative\_sales  
  FROM sales;

* **Output (example):**

| emp\_id | sale\_amount | cumulative\_sales |
| :---- | :---- | :---- |
| 10 | 5000 | 5000 |
| 3 | 3000 | 8000 |
| 7 | 1000 | 9000 |
| ... | ... | ... |

**Sources:** Authoritative SQL tutorials and MySQL documentation were used for definitions and syntax[\[1\]](https://www.w3schools.com/mysql/mysql_select.asp#:~:text=The%20,select%20data%20from%20a%20database)[\[2\]](https://www.w3schools.com/sql/sql_where.asp#:~:text=The%20,to%20filter%20records)[\[3\]](https://www.w3schools.com/mysql/mysql_like.asp#:~:text=The%20MySQL%20LIKE%20Operator)[\[5\]](https://www.w3schools.com/sql/sql_orderby.asp#:~:text=The%20SQL%20ORDER%20BY)[\[6\]](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp#:~:text=The%20,that%20matches%20a%20specified%20criterion)[\[7\]](https://www.w3schools.com/sql/sql_min_max.asp#:~:text=The%20SQL%20MIN,Functions)[\[9\]](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/#:~:text=Database%20normalization%20is%20a%20database,an%20organized%20and%20consistent%20way)[\[10\]](https://www.w3schools.com/mysql/mysql_constraints.asp#:~:text=%2A%20%60PRIMARY%20KEY%20%60%20,would%20destroy%20links%20between%20tables)[\[11\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=DDL%C2%A0,database%20objects%20in%20the%20database)[\[12\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=3.%20DML%20,Language)[\[13\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=In%20MySQL%20there%20are%20three,numeric%2C%20and%20date%20and%20time)[\[17\]](https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/#:~:text=Similar%20to%20grouped%20aggregate%20functions%2C,each%20row%20retain%20its%20identity).

---

[\[1\]](https://www.w3schools.com/mysql/mysql_select.asp#:~:text=The%20,select%20data%20from%20a%20database) MySQL SELECT Statement

[https://www.w3schools.com/mysql/mysql\_select.asp](https://www.w3schools.com/mysql/mysql_select.asp)

[\[2\]](https://www.w3schools.com/sql/sql_where.asp#:~:text=The%20,to%20filter%20records) SQL WHERE Clause

[https://www.w3schools.com/sql/sql\_where.asp](https://www.w3schools.com/sql/sql_where.asp)

[\[3\]](https://www.w3schools.com/mysql/mysql_like.asp#:~:text=The%20MySQL%20LIKE%20Operator) [\[4\]](https://www.w3schools.com/mysql/mysql_like.asp#:~:text=The%20,specified%20pattern%20in%20a%20column) MySQL LIKE Operator

[https://www.w3schools.com/mysql/mysql\_like.asp](https://www.w3schools.com/mysql/mysql_like.asp)

[\[5\]](https://www.w3schools.com/sql/sql_orderby.asp#:~:text=The%20SQL%20ORDER%20BY) SQL ORDER BY Keyword

[https://www.w3schools.com/sql/sql\_orderby.asp](https://www.w3schools.com/sql/sql_orderby.asp)

[\[6\]](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp#:~:text=The%20,that%20matches%20a%20specified%20criterion) MySQL COUNT(), AVG() and SUM() Functions

[https://www.w3schools.com/mysql/mysql\_count\_avg\_sum.asp](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp)

[\[7\]](https://www.w3schools.com/sql/sql_min_max.asp#:~:text=The%20SQL%20MIN,Functions) SQL MIN() and MAX() Functions

[https://www.w3schools.com/sql/sql\_min\_max.asp](https://www.w3schools.com/sql/sql_min_max.asp)

[\[8\]](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/#:~:text=A%20nested%20query%20,easier%20to%20read%20and%20maintain) SQL Nested Queries \- GeeksforGeeks

[https://www.geeksforgeeks.org/sql/nested-queries-in-sql/](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/)

[\[9\]](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/#:~:text=Database%20normalization%20is%20a%20database,an%20organized%20and%20consistent%20way) Database Normalization – Normal Forms 1nf 2nf 3nf Table Examples

[https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/)

[\[10\]](https://www.w3schools.com/mysql/mysql_constraints.asp#:~:text=%2A%20%60PRIMARY%20KEY%20%60%20,would%20destroy%20links%20between%20tables) MySQL Constraints

[https://www.w3schools.com/mysql/mysql\_constraints.asp](https://www.w3schools.com/mysql/mysql_constraints.asp)

[\[11\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=DDL%C2%A0,database%20objects%20in%20the%20database) [\[12\]](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/#:~:text=3.%20DML%20,Language) SQL Commands | DDL, DQL, DML, DCL and TCL Commands \- GeeksforGeeks

[https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/](https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/)

[\[13\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=In%20MySQL%20there%20are%20three,numeric%2C%20and%20date%20and%20time) [\[14\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Data%20type%20Description%20CHAR,Default%20is%201) [\[15\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Date%20and%20Time%20Data%20Types) [\[16\]](https://www.w3schools.com/mysql/mysql_datatypes.asp#:~:text=Data%20type%20Description%20DATE%20A,DD%20hh%3Amm%3Ass) MySQL Data Types

[https://www.w3schools.com/mysql/mysql\_datatypes.asp](https://www.w3schools.com/mysql/mysql_datatypes.asp)

[\[17\]](https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/#:~:text=Similar%20to%20grouped%20aggregate%20functions%2C,each%20row%20retain%20its%20identity) MySQL :: MySQL 8.0.2: Introducing Window Functions

[https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/](https://dev.mysql.com/blog-archive/mysql-8-0-2-introducing-window-functions/)
