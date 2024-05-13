CREATE DATABASE HR
CREATE TABLE regions (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE jobs (
	job_id INT IDENTITY(1,1) PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO regions(region_name) 
VALUES ('Europe');
INSERT INTO regions(region_name) 
VALUES ('Americas');
INSERT INTO regions(region_name) 
VALUES ('Asia');
INSERT INTO regions(region_name) 
VALUES ('Middle East and Africa');
SELECT * FROM regions

INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);

SELECT * FROM countries

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

 SELECT * FROM locations

 INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('President',20000.00,40000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Programmer',4000.00,10000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary)
 VALUES ('Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES ('Stock Manager',5500.00,8500.00);

SELECT * FROM jobs

INSERT INTO departments(department_name,location_id)
 VALUES ('Administration',1700);
INSERT INTO departments(department_name,location_id)
 VALUES ('Marketing',1800);
INSERT INTO departments(department_name,location_id)
 VALUES ('Purchasing',1700);
INSERT INTO departments(department_name,location_id)
 VALUES ('Human Resources',2400);
INSERT INTO departments(department_name,location_id) 
VALUES ('Shipping',1500);
INSERT INTO departments(department_name,location_id)
 VALUES ('IT',1400);
INSERT INTO departments(department_name,location_id) 
VALUES ('Public Relations',2700);
INSERT INTO departments(department_name,location_id) 
VALUES ('Sales',2500);
INSERT INTO departments(department_name,location_id)
 VALUES ('Executive',1700);
INSERT INTO departments(department_name,location_id) 
VALUES ('Finance',1700);
INSERT INTO departments(department_name,location_id) 
VALUES ('Accounting',1700);

SELECT * FROM departments

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

SELECT * FROM employees

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);

SELECT * FROM dependents

-------------------------TASK1-------------------------
--1--
--A--
SELECT *
FROM employees

--B--
SELECT employee_id,first_name,last_name,hire_date
FROM employees

--C--
SELECT first_name,last_name,salary,2*salary 'New_Salary'
FROM employees

--2--
--B--
SELECT employee_id,first_name,last_name,hire_date,salary
FROM employees
ORDER BY first_name ASC,
         last_name DESC

--C--
SELECT employee_id,first_name,last_name,hire_date,salary
FROM employees
ORDER BY first_name ASC,
         last_name DESC

--D--
SELECT employee_id,first_name,last_name,hire_date,salary
FROM employees
ORDER BY salary DESC

--E--
		 SELECT employee_id,first_name,last_name,hire_date,salary
FROM employees
ORDER BY hire_date DESC

--3--
--A,B--
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC

--C,D--
SELECT DISTINCT job_id,salary
FROM employees

--E--
SELECT DISTINCT phone_number
FROM employees

--4--
--A,B--
SELECT TOP 5 *
FROM employees
ORDER BY first_name

--C--
SELECT *
FROM employees
ORDER BY first_name
OFFSET 3 ROWS 
FETCH NEXT 5 ROWS ONLY

--D--
SELECT DISTINCT TOP 5 *
FROM employees
ORDER BY salary DESC

--E--
SELECT DISTINCT *
FROM employees
ORDER BY salary DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY

--5--
--A--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary>=14000
ORDER BY salary DESC

--B--
SELECT employee_id , first_name , last_name ,department_id
FROM employees
WHERE department_id=5

--C--
SELECT employee_id , first_name , last_name  
FROM employees
WHERE last_name='Chen'

--D--
SELECT employee_id , first_name , last_name,hire_date  
FROM employees
WHERE hire_date>'1999-01-01'
ORDER BY hire_date

--E--
SELECT employee_id , first_name , last_name ,hire_date 
FROM employees
WHERE YEAR(hire_date)=1999

--F--
SELECT employee_id , first_name , last_name 
FROM employees
WHERE last_name='Himuro'

--G--
SELECT employee_id , first_name , last_name 
FROM employees
WHERE last_name='Himuro'

--H--
SELECT employee_id , first_name , last_name ,phone_number
FROM employees
WHERE phone_number IS NULL

--I--
SELECT employee_id , first_name , last_name ,department_id
FROM employees
WHERE department_id <> 8

--J--
SELECT employee_id , first_name , last_name ,department_id 
FROM employees
WHERE  department_id NOT IN(8,10)

--K--
SELECT employee_id , first_name , last_name ,salary 
FROM employees
WHERE salary>10000
ORDER BY salary

--L--
SELECT employee_id , first_name , last_name ,salary,department_id
FROM employees
WHERE salary>10000 AND department_id=8
ORDER BY salary

--M--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary<10000
ORDER BY salary

--N--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary>=9000
ORDER BY salary

--O--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary<=9000
ORDER BY salary

--6--
--A--
CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(MAX))

ALTER TABLE courses 
ADD credit_hours int

--B--
ALTER TABLE courses
ADD fees INT ,max_limit INT

--C--
ALTER TABLE courses
ALTER COLUMN fees INT NOT NULL

--D--
ALTER TABLE courses
DROP COLUMN fees

--E--
ALTER TABLE courses
DROP COLUMN credit_hours,max_limit

--6--
--A--
CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
	FOREIGN KEY 
);

CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
	);

--B--
DROP TABLE project_milestones
ALTER TABLE project_milestones
ADD CONSTRAINT FK_project_milestones
FOREIGN KEY (project_id) REFERENCES projects(project_id)

-------------------------TASK2-------------------------

--1--
--A--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary>5000 AND salary<7000
ORDER BY salary

--B--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary=7000 OR salary=8000
ORDER BY salary

--C--
SELECT employee_id , first_name , last_name ,phone_number
FROM employees
WHERE phone_number IS NULL

--D--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary BETWEEN 9000 AND 12000
ORDER BY salary

--E--
SELECT employee_id , first_name , last_name ,department_id
FROM employees
WHERE department_id IN (8,9)

--F--
SELECT employee_id , first_name , last_name 
FROM employees
WHERE first_name LIKE 'Jo%'

--G--
SELECT employee_id , first_name , last_name 
FROM employees
WHERE first_name LIKE '_h%'

--H--
SELECT employee_id , first_name , last_name,salary 
FROM employees
WHERE salary > ALL (
                    SELECT salary 
					FROM employees 
					WHERE department_id=8
)
ORDER BY salary

--2--
--A--
SELECT employee_id , first_name , last_name ,salary
FROM employees 
WHERE salary > ALL(
                   SELECT AVG(salary) 
				   FROM employees
				   GROUP BY department_id
				   )
ORDER BY salary

--B--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE EXISTS (
              SELECT employee_id 
			  FROM dependents 
			  WHERE employees.employee_id=dependents.employee_id)

--C--
SELECT employee_id , first_name , last_name ,salary 
FROM employees 
WHERE salary BETWEEN 2500 AND 2900
ORDER BY salary

--D--
SELECT employee_id , first_name , last_name ,salary
FROM employees 
WHERE salary NOT BETWEEN 2500 AND 2900
ORDER BY salary

--E--
SELECT employee_id , first_name , last_name ,hire_date
FROM employees 
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY hire_date

--F--
SELECT employee_id , first_name , last_name ,hire_date
FROM employees 
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31'
ORDER BY hire_date

--G--
SELECT employee_id , first_name , last_name,hire_date 
FROM employees 
WHERE YEAR(hire_date) BETWEEN 1990 AND 1993
ORDER BY hire_date

SELECT employee_id , first_name , last_name,hire_date
FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1993-12-31'
ORDER BY hire_date

--3--
--A--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE first_name LIKE 'Da%'
ORDER BY first_name

--B--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE first_name LIKE '%er'
ORDER BY first_name

--C--
SELECT employee_id , first_name , last_name  
FROM employees 
WHERE last_name LIKE '%an&'
ORDER BY first_name

--D--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE first_name LIKE 'Jo__'
ORDER BY first_name

--E--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE first_name LIKE '%are_'
ORDER BY first_name

--F--
SELECT employee_id , first_name , last_name 
FROM employees 
WHERE first_name LIKE 'S%'
AND first_name NOT LIKE 'Sh%'
ORDER BY first_name

--4--
--A--
SELECT employee_id , first_name , last_name ,department_id
FROM employees 
WHERE department_id=5

--B--
SELECT employee_id , first_name , last_name ,salary,department_id
FROM employees 
WHERE department_id=5 AND NOT salary>5000

--C--
SELECT employee_id , first_name , last_name ,department_id
FROM employees 
WHERE department_id NOT IN (1,2,3)

--D--
SELECT employee_id , first_name , last_name 
FROM employees
WHERE first_name NOT LIKE 'D%'
ORDER BY first_name

--E--
SELECT employee_id , first_name , last_name ,salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary

--5--
--A--
SELECT employee_id,first_name,last_name
FROM employees
WHERE NOT EXISTS ( 
                  SELECT employee_id 
				  FROM dependents 
				  WHERE dependents.employee_id=employees.employee_id
				  )

--B--
SELECT employee_id,first_name,last_name,phone_number
FROM employees
WHERE phone_number IS NULL

--C--
SELECT employee_id,first_name,last_name,phone_number
FROM employees
WHERE phone_number IS NOT NULL

-------------------------TASK3-------------------------

--1(INNER JOIN)--
--A--
SELECT department_id,department_name
FROM departments
WHERE department_id IN (1,2,3)

--B--
SELECT employee_id,first_name,last_name,department_id
FROM employees
WHERE department_id IN (1,2,3)
ORDER BY department_id

--C--
SELECT E.first_name,E.last_name,J.job_title,D.department_name
FROM employees E
INNER JOIN jobs J ON E.job_id=J.job_id
INNER JOIN departments D ON E.department_id=D.department_id
WHERE D.department_id IN (1,2,3)

--2(LEFT JOIN)--
--A--
SELECT country_id, country_name
FROM countries
WHERE country_id IN ('US','UK','CN')

select * from countries

--B--
SELECT C.country_name,C.country_id,L.country_id,L.street_address,L.postal_code
FROM countries C
LEFT JOIN locations L
ON C.country_id=L.country_id
WHERE C.country_id IN ('US','UK','CN')

--C--
SELECT C.*,L.*
FROM countries C
LEFT JOIN locations L
ON C.country_id=L.country_id

--D--
SELECT C.country_name
FROM countries C
LEFT JOIN locations L
ON C.country_id=L.country_id
WHERE L.location_id IS NULL

--E--
SELECT R.region_name,C.country_name,L.postal_code,L.city
FROM regions R
LEFT JOIN countries C ON C.region_id=R.region_id
LEFT JOIN locations L ON C.country_id=L.country_id
WHERE C.country_id IN ('US','UK','CN')

--3(SELF JOIN)--
--1--
SELECT E.employee_id,E.first_name,M.first_name,M.manager_id
FROM employees E
INNER JOIN employees M
ON E.employee_id=M.manager_id
ORDER BY M.first_name

SELECT E.employee_id,E.first_name,M.first_name,M.manager_id
FROM employees E
INNER JOIN employees M
ON M.employee_id=E.manager_id
ORDER BY M.first_name

SELECT E.first_name + ' '+E.last_name 'EMPLOYEE',
       M.first_name + ' '+M.last_name 'MANAGER'
FROM employees E
INNER JOIN employees M
ON E.employee_id=M.manager_id
ORDER BY MANAGER

SELECT E.first_name + ' '+E.last_name 'EMPLOYEE',
       M.first_name + ' '+M.last_name 'MANAGER'
FROM employees E
INNER JOIN employees M
ON M.employee_id=E.manager_id
ORDER BY MANAGER

SELECT employee_id
FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees)

--4(OUTER JOIN)--
CREATE  TABLE  fruits (
	fruit_id  INT PRIMARY KEY,
	fruit_name  VARCHAR (255) NOT NULL,
	basket_id  INTEGER
);
CREATE TABLE baskets (
	basket_id  INT PRIMARY KEY,
	basket_name  VARCHAR (255) NOT NULL
);
INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');
	INSERT  INTO  fruits (
	fruit_id,
	fruit_name,
	basket_id
)
VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);

SELECT * FROM fruits
SELECT * FROM baskets

--1--
SELECT F.fruit_name,B.basket_name
FROM fruits F
FULL JOIN baskets B
ON F.basket_id=B.basket_id

--2--
SELECT B.basket_name
FROM fruits F
FULL JOIN baskets B
ON F.basket_id=B.basket_id
WHERE F.fruit_id IS NULL

--3--
SELECT F.fruit_name
FROM fruits F
FULL JOIN baskets B
ON F.basket_id=B.basket_id
WHERE B.basket_id IS NULL

--4(CROSS JOIN)--
CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255)
);
 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255)
);
INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');
INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');

SELECT *
FROM sales_channel
CROSS JOIN sales_organization

-------------------------TASK4-------------------------
--A--
SELECT department_id
FROM employees
GROUP BY department_id

--B--
SELECT D.department_name ,COUNT(E.employee_id) 
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name

--C--
SELECT D.department_name ,COUNT(E.employee_id) 
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name

--D--
SELECT D.department_name ,COUNT(E.employee_id) 'Headcount'
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name
ORDER BY Headcount

--E--
SELECT D.department_name ,COUNT(E.employee_id) AS  'Headcount'
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name
HAVING COUNT(E.employee_id) > 5
ORDER BY Headcount DESC

--F--
SELECT D.department_name,MAX(E.salary)'Max_Salary',MIN(E.salary) 'Min_Salary',AVG(E.salary) 'Avg_Salary'
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name

--G--
SELECT D.department_name,SUM(E.salary) 'Total'
FROM employees E
LEFT JOIN departments D
ON E.department_id=D.department_id
GROUP BY D.department_name

--H--
SELECT D.department_name,J.job_title,COUNT(E.employee_id)
FROM jobs J
INNER JOIN employees E ON J.job_id=E.job_id
INNER JOIN departments D ON E.department_id=D.department_id
GROUP BY D.department_name,J.job_title 
ORDER BY D.department_name 

------------------SQL HAVING ---------------------

--A--
SELECT 
       manager_id,
	   COUNT(employee_id) 'Direct_Reports'
FROM 
       employees
WHERE 
       manager_id IS NOT NULL
GROUP BY manager_id

--B--
SELECT 
       manager_id,
	   COUNT(employee_id) 'Direct_Reports'
FROM 
       employees
WHERE 
       manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(employee_id)>=5

--C--
SELECT 
    department_id,SUM(salary)
FROM 
    employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000
ORDER BY SUM(salary)

--D--
SELECT 
    department_id,MIN(salary)
FROM 
    employees
GROUP BY department_id
HAVING MIN(salary)>10000
ORDER BY MIN(salary)

--E--
SELECT 
    department_id,AVG(salary)
FROM 
    employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000
ORDER BY AVG(salary)

-------------------------TASK5-------------------------

--1--Union

SELECT first_name,last_name
FROM employees
UNION 
SELECT first_name,last_name
FROM dependents

--2--Intersect

CREATE TABLE A(Id int)
INSERT INTO A VALUES (1),(2),(3)
SELECT *
FROM A
CREATE TABLE B(Id int)
INSERT INTO B VALUES (2),(3),(4)
SELECT Id
FROM A
INTERSECT
SELECT Id
FROM B

--3--EXISTS
--A--
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    EXISTS( SELECT 
            1
        FROM
            dependents
        WHERE
            dependents.employee_id = employees.employee_id)

--B--
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            dependents
        WHERE
            dependents.employee_id = employees.employee_id)

--4--(CASE)
--A--
SELECT 
    first_name,
    last_name,
    hire_date,
    CASE (2023 - YEAR(hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
    END aniversary
FROM
    employees

--B--
SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END evaluation
FROM
    employees

--5--UPDATE
UPDATE employees
SET last_name='Lopez'
WHERE employee_id=192

UPDATE dependents
SET last_name='Lopez'
WHERE employee_id=192

--6--SUBQUERY
--A--
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)

--B--
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id NOT IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)

--C--
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            employees)

--D--
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees)

--E--
SELECT 
    department_name
FROM
    departments d
WHERE
    EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)

--F--
SELECT 
    department_name
FROM
    departments d
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)

--G--
SELECT 
    department_id,MIN(salary)
FROM
    employees
GROUP BY department_id

--H--
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= ALL (SELECT 
            MIN(salary)
        FROM
            employees
        GROUP BY department_id)

--I--
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= SOME (SELECT 
            MAX(salary)
        FROM
            employees
        GROUP BY department_id)

--J--
SELECT 
    AVG(salary) average_salary
FROM
    employees
GROUP BY department_id

--K--
SELECT 
    ROUND(AVG(average_salary), 0)
FROM
    (SELECT 
        AVG(salary) average_salary
    FROM
        employees
    GROUP BY department_id) department_salary

--L--
SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    (SELECT ROUND(AVG(salary), 0)
     FROM employees) 'average_salary',
    salary - (SELECT ROUND(AVG(salary), 0)
        FROM employees) 'difference'
FROM employees


