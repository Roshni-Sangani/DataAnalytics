create database Assigment ;

use Assigment ;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(40),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Zip VARCHAR(10)
);

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Email VARCHAR(45),
    MailOk BOOLEAN,
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(8,2),
    HireDate DATE,
    JobTitle VARCHAR(45),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Company VALUES 
(1, 'Urban Outfitters, Inc.', '123 Main St', 'New York', 'NY', '10001'),
(2, 'TechWorld Inc.', '45 Tech Ave', 'San Jose', 'CA', '95131'),
(3, 'GreenMart', '78 Forest Rd', 'Denver', 'CO', '80220'),
(4, 'Foodies', '99 Tasty Ln', 'Austin', 'TX', '73301'),
(5, 'EduCore', '12 Study Blvd', 'Boston', 'MA', '02101'),
(6, 'StyleHub', '300 Fashion Dr', 'Chicago', 'IL', '60616'),
(7, 'PetZone', '221 Animal Rd', 'Seattle', 'WA', '98101');


INSERT INTO Contact VALUES 
(101, 1, 'Alice', 'Smith', '111 A St', 'New York', 'NY', 'alice@uo.com', TRUE, '212-111-1111'),
(102, 2, 'Bob', 'Johnson', '222 B Ave', 'San Jose', 'CA', 'bob@tech.com', FALSE, '408-222-2222'),
(103, 3, 'Carol', 'White', '333 C Dr', 'Denver', 'CO', 'carol@green.com', TRUE, '303-333-3333'),
(104, 4, 'David', 'Brown', '444 D Ln', 'Austin', 'TX', 'david@food.com', TRUE, '512-444-4444'),
(105, 5, 'Eve', 'Davis', '555 E Blvd', 'Boston', 'MA', 'eve@edu.com', FALSE, '617-555-5555'),
(106, 6, 'Frank', 'Wilson', '666 F Ct', 'Chicago', 'IL', 'frank@style.com', TRUE, '312-666-6666'),
(107, 7, 'Grace', 'Lee', '777 G Way', 'Seattle', 'WA', 'grace@pet.com', FALSE, '206-777-7777');

INSERT INTO Employee VALUES 
(201, 'Lesley', 'Bland', 75000.00, '2020-01-15', 'Manager', 'lesley@uo.com', '215-555-1234'),
(202, 'Henry', 'Nguyen', 65000.00, '2019-03-22', 'Sales Rep', 'henry@tech.com', '408-555-5678'),
(203, 'Irene', 'Khan', 72000.00, '2018-11-05', 'Coordinator', 'irene@green.com', '303-555-3344'),
(204, 'Jack', 'Wright', 58000.00, '2021-06-30', 'HR', 'jack@food.com', '512-555-9090'),
(205, 'Karen', 'Moore', 90000.00, '2017-08-19', 'Director', 'karen@edu.com', '617-555-2211'),
(206, 'Leo', 'Walker', 61000.00, '2023-02-01', 'Analyst', 'leo@style.com', '312-555-7654'),
(207, 'Mona', 'Singh', 69500.00, '2022-10-10', 'Consultant', 'mona@pet.com', '206-555-3498');

INSERT INTO ContactEmployee VALUES 
(301, 101, 201, '2024-01-10', 'Initial meeting'),
(302, 102, 202, '2023-12-15', 'Product inquiry'),
(303, 103, 203, '2024-02-01', 'Follow-up call'),
(304, 104, 204, '2024-03-20', 'Issue resolution'),
(305, 105, 205, '2024-04-05', 'Partnership talk'),
(306, 106, 206, '2024-04-22', 'Demo arranged'),
(307, 107, 207, '2024-05-01', 'New lead');

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number
-- to 215-555-8800 

UPDATE Employee SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

-- 5) In the Company table, the statement that changes the name of 
-- “Urban Outfitters, Inc.” to “Urban Outfitters” . 

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

/* 6) In ContactEmployee table, the statement that removes Dianne 
Connor’s contact event with Jack Lee (one statement).
HINT: Use the primary key of the ContactEmployee table to specify 
the correct record to remove */

DELETE FROM ContactEmployee
WHERE ContactID = (
    SELECT ContactID FROM Contact WHERE FirstName = 'Alice' AND LastName = 'Smith'
) AND EmployeeID = (
    SELECT EmployeeID FROM Employee WHERE FirstName = 'Lesley' AND LastName = 'Bland'
);

DELETE FROM ContactEmployee
WHERE ContactID = 104 AND EmployeeID = 204;

/* 7) Write the SQL SELECT query that displays the names of the employees 
that have contacted Toll Brothers (one statement). Run the SQL SELECT 
query in MySQL Workbench. Copy the results below as well. */

SELECT DISTINCT Employee.FirstName, Employee.LastName FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON ContactEmployee.ContactID = Contact.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'GreenMart';

-- 8) What is the significance of “%” and “_” operators in the 
-- LIKE statement? 

/* In SQL, the LIKE statement is used to search for a specific 
pattern within a column's value — especially in the WHERE clause.
To match patterns, two special wildcard characters are 
used with LIKE: */

/* % (Percent Sign)
Meaning: Matches zero, one, or many characters.
When to Use: Use this when you are not sure how many 
characters will appear in the place you're searching.
Examples: */

SELECT * FROM Employee WHERE FirstName LIKE 'L%';

SELECT * FROM Employee WHERE FirstName LIKE 'A%';

SELECT * FROM Employee WHERE FirstName LIKE '%A';

/* _ (Underscore)
Meaning: Matches exactly one character (any character).
When to Use: Use this when you want to match a pattern with 
a specific number of characters, where one character can be anything.
Example: */

SELECT * FROM Employee WHERE FirstName LIKE '__ck';

SELECT * FROM Employee WHERE FirstName LIKE 'Kar__';

-- 9) Explain normalization in the context of databases. 

/* Normalization is a process used to organize a database in 
such a way that data is not repeated and is stored correctly.

This process involves breaking large tables into smaller, 
related tables to remove redundancy and improve data integrity.

>> Types of Normal Forms:

	1NF (First Normal Form):
		Each column should have only atomic (simple) values.
		No repeating or multi-valued columns should exist in the table.

	2NF (Second Normal Form):
		First, the table must be in 1NF.
		Then, ensure that every non-key column is fully dependent 
        on the entire primary key, not just part of it.

	3NF (Third Normal Form):
		The table must first be in 2NF.
		Then, make sure that no non-key column depends on another 
        non-key column.

>>> Goal of Normalization:
		Keep data clean and accurate
		Avoid duplicate data
		Make the database easier to maintain
*/

-- 10) what does a join in MySQL mean? 

/* A JOIN means combining two or more tables based on a common 
column (like ID) to retrieve related data. */

/* 1. Contact Table (ContactID, CompanyID, FirstName, ...)
ContactID	CompanyID	FirstName
101				1		 Alice
102				2		 Bob

2. Company Table (CompanyID, CompanyName)
CompanyID		CompanyName
1			  Urban Outfitters
2			  TechWorld Inc. */

-- >>>Types of JOINs:

-- INNER JOIN	Sirf matching rows show hote hain (most common)
-- LEFT JOIN	Left table ke sab rows + matching right table rows
-- RIGHT JOIN	Right table ke sab rows + matching left table rows
-- FULL JOIN	Dono tables ke sab rows 

/* >>> 1. INNER JOIN */

SELECT Contact.FirstName, Company.CompanyName
FROM Contact
INNER JOIN Company ON Contact.CompanyID = Company.CompanyID; 

/* >>> 2. LEFT JOIN */

SELECT Contact.LastName, Company.City
FROM Contact
LEFT JOIN Company ON Contact.CompanyID = Company.CompanyID;

/* >>> 3. RIGHT JOIN */

SELECT Contact.Email, Company.State
FROM Contact
RIGHT JOIN Company ON Contact.CompanyID = Company.CompanyID;

/* >>> 4. FULL JOIN */

SELECT Contact.Phone, Company.Zip
FROM Contact
LEFT JOIN Company ON Contact.CompanyID = Company.CompanyID
UNION
SELECT Contact.Phone, Company.Zip
FROM Contact
RIGHT JOIN Company ON Contact.CompanyID = Company.CompanyID;


-- 11) What do you understand about DDL, DCL, and DML in MySQL? 


/* 1. DDL (Data Definition Language)

DDL commands are used to define the structure of a database.
These commands are used to create, delete, or modify tables and other database objects.

Common commands:

CREATE — Used to create a new table or database.
ALTER — Used to make changes to an existing table, such as adding or removing columns.
DROP — Used to delete an entire table or database.
TRUNCATE — Used to delete all data from a table, but not the table itself. */

-- >>Examples
	-- >>CREATE TABLE

		CREATE TABLE Students (
			StudentID INT PRIMARY KEY,
			Name VARCHAR(50),
			Age INT
		);
	
	-- >>ALTER TABLE 

		ALTER TABLE Students ADD COLUMN Email VARCHAR(100);
        
	-- >>DROP TABLE

		DROP TABLE Students;
        
	-- >>TRUNCATE TABLE (saara data delete karna)

		TRUNCATE TABLE Students;        

/* 2. DML (Data Manipulation Language)

DML commands are used to manage the data stored in database tables.
This includes adding, updating, deleting, or reading the data.

Common commands:

INSERT — Used to add new data into a table.
UPDATE — Used to remove data from a table.
DELETE — Used to remove data from a table.
SELECT — Used to read or retrieve data from a table. */

-- >>>Examples

	-- >>INSERT INTO

	INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Rahul', 20);

	-- >>UPDATE

	UPDATE Students SET Age = 21 WHERE StudentID = 1;
    
    -- >>DELETE
    
    DELETE FROM Students WHERE StudentID = 1;

    -- >>SELECT
    
    SELECT * FROM Students;

/* 3. DCL (Data Control Language)

DCL commands are used to control permissions and access to the database.
This means giving or taking away a user's rights to use certain parts of the database.

Common commands:

GRANT — Used to give permissions to a user
REVOKE — Used to take back permissions from a user. */

-- >>>Examples
	-- >>GRANT (user ko select permission dena)

	GRANT SELECT ON Students TO 'VISHAL'@'localhost';
    
    -- >>REVOKE (permission lena)

	REVOKE SELECT ON Students FROM 'VISHAL'@'localhost';

/* 4). DQL (Data Query Language)

DQL (Data Query Language) is a subset of SQL (Structured Query Language) 
used to fetch or query data from a database.
 
 Command : 
	SELECT
		This is the only command in DQL.
        It is used to retrieve data from one or more tables.
        
	>>> Example */
    
SELECT * FROM Employee WHERE FirstName = 'Lesley' AND LastName = 'Bland';

SELECT * FROM Company WHERE CompanyID = 1;


/* 12) What is the role of the MySQL JOIN clause in a query, and what 
are some common types of joins? */

/* The JOIN clause is used when you want to combine data from two 
or more tables based on a common column.

For example, if you have a Contact table and a Company table, and 
both have a common column called CompanyID,
you can use a JOIN to bring related data from both tables together 
in a single result. */

/* >>> 1. INNER JOIN */

SELECT Contact.FirstName, Company.CompanyName
FROM Contact
INNER JOIN Company ON Contact.CompanyID = Company.CompanyID; 

/* >>> 2. LEFT JOIN */

SELECT Contact.LastName, Company.City
FROM Contact
LEFT JOIN Company ON Contact.CompanyID = Company.CompanyID;

/* >>> 3. RIGHT JOIN */

SELECT Contact.Email, Company.State
FROM Contact
RIGHT JOIN Company ON Contact.CompanyID = Company.CompanyID;

/* >>> 4. FULL JOIN */

SELECT Contact.Phone, Company.Zip
FROM Contact
LEFT JOIN Company ON Contact.CompanyID = Company.CompanyID
UNION
SELECT Contact.Phone, Company.Zip
FROM Contact
RIGHT JOIN Company ON Contact.CompanyID = Company.CompanyID;

/* >>> 5. CROSS JOIN */

SELECT Contact.FirstName, Company.CompanyName
FROM Contact
CROSS JOIN Company;
