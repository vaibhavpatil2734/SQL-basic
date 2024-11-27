-- 1. Primary Key

-- 1.1 Single Primary Key
CREATE TABLE employees (
    emp_id INT PRIMARY KEY, -- Only one column is the primary key
    name VARCHAR(50),
    department VARCHAR(50)
);

-- 1.2 Primary Key with a Range Constraint
CREATE TABLE employees (
    emp_id INT PRIMARY KEY CHECK (emp_id BETWEEN 1 AND 9999), -- Primary key with a range constraint
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50)
);

-- 2. Insertion

-- 2.1 Single Row
INSERT INTO cust VALUES (3, 'Raj', 23);

-- 2.2 Multiple Rows - Method 1
INSERT INTO cust VALUES 
(3, 'Raj', 23),
(100, 'Patil', 22);

-- 2.3 Multiple Rows - Method 2
INSERT INTO customers (id, name, age) VALUES
(1, 'John Doe', 28),
(2, 'Jane Smith', 34),
(3, 'Alice Johnson', 22),
(4, 'Bob Brown', 45),
(5, 'Charlie Davis', 31),
(6, 'Emily Clark', 29),
(7, 'Franklin White', 40),
(8, 'Grace Hill', 27),
(9, 'Henry Adams', 50),
(10, 'Ivy Wilson', 35);

-- 3. Grouping

-- 3.1 Group By Single Column
SELECT name, SUM(age)
FROM cust
GROUP BY name;

-- 3.2 Group By Multiple Columns
SELECT name, SUM(age)
FROM cust
GROUP BY name, age;

-- 3.3 Grouping with a Condition
SELECT department, SUM(salary)
FROM employees
WHERE age >= 30
GROUP BY department;

-- 3.4 Group By with HAVING Clause
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING department = 'HR';

-- 4. COUNT Functions

-- 4.1 COUNT()
SELECT COUNT(salary) AS non_null_salaries
FROM employees;

-- 4.2 COUNT(*)
SELECT COUNT(*) AS total_rows
FROM employees;

-- 5. Replace Function
-- REPLACE(): Replaces occurrences of a substring in a string with another substring.
SELECT REPLACE('DATA MANAGEMENT', 'DATA', 'DATABASE') FROM DUAL; 
-- Output: DATABASE MANAGEMENT

-- 6. Aggregate Functions

-- 6.1 AVG(): Returns the average of a column
SELECT AVG(salary) FROM employees;

-- 6.2 MAX(): Returns the maximum value
SELECT MAX(salary) FROM employees;

-- 6.3 MIN(): Returns the minimum value
SELECT MIN(salary) FROM employees;

-- 6.4 SUM(): Returns the sum of a column
SELECT SUM(salary) FROM employees;

-- 6.5 COUNT(): Returns the count of non-NULL values
SELECT COUNT(salary) FROM employees;

-- 6.6 COUNT(*): Returns the total number of rows
SELECT COUNT(*) FROM employees;

-- 7. Numeric Functions

-- 7.1 ABS(): Returns the absolute value
SELECT ABS(-15); -- Output: 15

-- 7.2 MOD(): Returns the remainder
SELECT MOD(18, 4); -- Output: 2

-- 7.3 SQRT(): Returns the square root
SELECT SQRT(16); -- Output: 4

-- 7.4 LOG10(): Returns base-10 logarithm
SELECT LOG10(100); -- Output: 2

-- 7.5 PI(): Returns the value of PI
SELECT PI(); -- Output: 3.141593

-- 8. String Functions

-- 8.1 UPPER(): Converts to uppercase
SELECT UPPER('hello'); -- Output: HELLO

-- 8.2 LOWER(): Converts to lowercase
SELECT LOWER('HELLO'); -- Output: hello

-- 8.3 INITCAP(): Converts to initial caps
SELECT INITCAP('hello world'); -- Output: Hello World

-- 8.4 RTRIM(): Removes spaces from the right
SELECT RTRIM('hello   '); -- Output: 'hello'

-- 8.5 LTRIM(): Removes spaces from the left
SELECT LTRIM('   hello'); -- Output: 'hello'

-- 8.6 CONCAT(): Concatenates two strings
SELECT CONCAT('Hello', ' World'); -- Output: Hello World

-- 8.7 SUBSTR(): Returns a substring
SELECT SUBSTR('Hello World', 1, 5); -- Output: Hello

-- 8.8 INSTR(): Returns the position of a substring
SELECT INSTR('Hello World', 'World'); -- Output: 7

-- 8.9 FORMAT(): Formats a number according to specified decimal places and uses grouping separators.

-- Example:
SELECT FORMAT(1234567.89, 2);
-- Output: 1,234,567.89

