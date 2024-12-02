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

--1.3 Composite primary key
CREATE TABLE student_course_enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);

-- 2. Foreign Key

CREATE TABLE student_marks (
    roll INT,
    marks INT,
    FOREIGN KEY (roll) REFERENCES student_data(roll)
);
-- Foreign key use
SELECT student_data.name, student_marks.marks
FROM student_data, student_marks
ON student_data.roll = student_marks.roll;

-- 3. Insertion

-- 3.1 Single Row
INSERT INTO cust VALUES (3, 'Raj', 23);

-- 3.2 Multiple Rows - Method 1
INSERT INTO cust VALUES 
(3, 'Raj', 23),
(100, 'Patil', 22);

-- 3.3 Multiple Rows - Method 2
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

-- 4. Grouping

-- 4.1 Group By Single Column
SELECT name, SUM(age)
FROM cust
GROUP BY name;

-- 4.2 Group By Multiple Columns
SELECT name, SUM(age)
FROM cust
GROUP BY name, age;

-- 4.3 Grouping with a Condition
SELECT department, SUM(salary)
FROM employees
WHERE age >= 30
GROUP BY department;

-- 4.4 Group By with HAVING Clause
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING department = 'HR';

-- 5. COUNT Functions

-- 5.1 COUNT()
SELECT COUNT(salary) AS non_null_salaries
FROM employees;

-- 5.2 COUNT(*)
SELECT COUNT(*) AS total_rows
FROM employees;

-- 6. Replace Function
-- REPLACE(): Replaces occurrences of a substring in a string with another substring.
SELECT REPLACE('DATA MANAGEMENT', 'DATA', 'DATABASE') FROM DUAL; 
-- Output: DATABASE MANAGEMENT

-- 7. Aggregate Functions

-- 7.1 AVG(): Returns the average of a column
SELECT AVG(salary) FROM employees;

-- 7.2 MAX(): Returns the maximum value
SELECT MAX(salary) FROM employees;

-- 7.3 MIN(): Returns the minimum value
SELECT MIN(salary) FROM employees;

-- 7.4 SUM(): Returns the sum of a column
SELECT SUM(salary) FROM employees;

-- 7.5 COUNT(): Returns the count of non-NULL values
SELECT COUNT(salary) FROM employees;

-- 7.6 COUNT(*): Returns the total number of rows
SELECT COUNT(*) FROM employees;

-- 8. Numeric Functions

-- 8.1 ABS(): Returns the absolute value
SELECT ABS(-15); -- Output: 15

-- 8.2 MOD(): Returns the remainder
SELECT MOD(18, 4); -- Output: 2

-- 8.3 SQRT(): Returns the square root
SELECT SQRT(16); -- Output: 4

-- 8.4 LOG10(): Returns base-10 logarithm
SELECT LOG10(100); -- Output: 2

-- 8.5 PI(): Returns the value of PI
SELECT PI(); -- Output: 3.141593

-- 9. String Functions

-- 9.1 UPPER(): Converts to uppercase
SELECT UPPER('hello'); -- Output: HELLO

-- 9.2 LOWER(): Converts to lowercase
SELECT LOWER('HELLO'); -- Output: hello

-- 9.3 INITCAP(): Converts to initial caps
SELECT INITCAP('hello world'); -- Output: Hello World

-- 9.4 RTRIM(): Removes spaces from the right
SELECT RTRIM('hello   '); -- Output: 'hello'

-- 9.5 LTRIM(): Removes spaces from the left
SELECT LTRIM('   hello'); -- Output: 'hello'

-- 9.6 CONCAT(): Concatenates two strings
SELECT CONCAT('Hello', ' World'); -- Output: Hello World

-- 9.7 SUBSTR(): Returns a substring
SELECT SUBSTR('Hello World', 1, 5); -- Output: Hello

-- 9.8 INSTR(): Returns the position of a substring
SELECT INSTR('Hello World', 'World'); -- Output: 7

-- 9.9 FORMAT(): Formats a number according to specified decimal places and uses grouping separators.
SELECT FORMAT(1234567.89, 2); -- Output: 1,234,567.89

-- 10. Subqueries

-- 10.1 Subqueries with SELECT Statement
SELECT name 
FROM student_data
WHERE roll IN (SELECT roll
               FROM student_marks
               WHERE dept = 'CSE');

-- 10.2 Subqueries with INSERT Statement
INSERT INTO stuz
SELECT roll, marks
FROM student_marks
WHERE roll IN (SELECT order_id
               FROM Orders);

-- 10.3 Subqueries with UPDATE Statement
UPDATE student_data
SET age = 20
WHERE roll IN (SELECT roll
               FROM student_marks);

-- 10.4 Subqueries with DELETE Statement
DELETE FROM stuz
WHERE roll IN (SELECT roll
               FROM student_marks
               WHERE marks = 90);



-- -- Table 1: stu (students)
-- CREATE TABLE stu (
--     id INT PRIMARY KEY, -- Unique identifier for each student
--     name VARCHAR(50) NOT NULL, -- Name of the student
--     class VARCHAR(10) NOT NULL -- Class of the student
-- );

-- -- Insert sample data into stu table
-- INSERT INTO stu (id, name, class) VALUES
-- (1, 'Alice', '10A'),
-- (2, 'Bob', '10B'),
-- (3, 'Charlie', '10A'),
-- (4, 'Diana', '10C'),
-- (5, 'Eve', '10D'); -- Added entry for student_id 5 to resolve foreign key constraint

-- -- Table 2: res (results)
-- CREATE TABLE res (
--     stu_id INT, -- Identifier for the student (foreign key to stu table)
--     subject VARCHAR(50) NOT NULL, -- Subject name
--     marks INT CHECK (marks BETWEEN 0 AND 100), -- Marks obtained, should be between 0 and 100
--     FOREIGN KEY (stu_id) REFERENCES stu(id) -- Foreign key constraint
-- );

-- -- Insert sample data into res table
-- INSERT INTO res (stu_id, subject, marks) VALUES
-- (1, 'Math', 85),
-- (2, 'Science', 90),
-- (3, 'Math', 78),
-- (5, 'History', 88); -- This entry now works because student_id 5 exists in the stu table


--Set Operations with These Tables
--UNION
--Combines rows from both tables, removing duplicates.
SELECT id FROM stu
UNION
SELECT stu_id FROM res;


--UNION ALL
--Combines rows from both tables, including duplicates.
SELECT id FROM stu
UNION ALL
SELECT stu_id FROM res;


--INTERSECT
--Returns common rows from both tables.
SELECT id FROM stu
INTERSECT
SELECT stu_id FROM res;


--MINUS (or EXCEPT)
--Returns rows from stu that are not in res.
SELECT id FROM stu
EXCEPT
SELECT stu_id FROM res;
