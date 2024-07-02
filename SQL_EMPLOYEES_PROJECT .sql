CREATE TABLE jobs (
job_id INT PRIMARY KEY IDENTITY,
job_title VARCHAR(50) NOT NULL
)
--INSERT VALUES TO THE TABEL
INSERT INTO  jobs VALUES('SOFTWARE ENGINNER ')
INSERT INTO  jobs VALUES('PROJECT MANAGMENT' )
INSERT INTO  jobs VALUES('ACOUNT MANAGER ')



CREATE TABLE departments (
department_id INT PRIMARY KEY IDENTITY,
department_name VARCHAR(50) NOT NULL
)
--INSERT VALUES TO THE TABEL

INSERT INTO departments VALUES('COMPUTER SCIENCE ')
INSERT INTO departments VALUES('HR')
INSERT INTO departments VALUES('HR')
------------------------------------------------------------------------------


CREATE TABLE employees (
employee_id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
SALARY DECIMAL(10,5),
hire_date DATE,
job_id INT,
department_id INT,
-- FOREIGN KEY OF THE JOP AND DEPARTMENT 
FOREIGN KEY (job_id) REFERENCES jobs(job_id),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
)

select e.employee_id, e.first_name , j.job_title from employees e , jobs j 
where j.job_id=e.employee_id


--INSERT VALUES TO THE TABEL

INSERT INTO employees VALUES ('LAYALI','KHAYAT', 'LAYALI.doe@example.com',1000.0,'2023-01-15', 1, 1)
INSERT INTO employees VALUES ('AMAL','ABDULLAH', 'AMAL.@GMAIL.com',1090.0,'2023-01-15', 2, 2)
INSERT INTO employees VALUES ('RAWAN','AHMMAD', 'RAWAN.@HOTMAIL.com',3000.0,'2023-01-15', 3, 3)

-----------------------------------------------------------------------------------------------


--MODIFY THE SALARY FROM (10,2) TO (10,5)
 ALTER TABLE  employees ALTER COLUMN SALARY DECIMAL(10,5)
  ALTER TABLE  JOBS ALTER COLUMN SALARY DECIMAL(10,5)

  -- SHOWING THE TOTAL SALARY FOR ALL THE EMPLYEE AND AVG ,ROUND

SELECT SUM(SALARY)AS TOTAL_SALARY FROM employees

SELECT employee_id,FIRST_NAME,LAST_NAME , SALARY ,ROUND((SALARY),1) AS RIUNDED_SALARY  FROM employees
-----------------------------------------------------------------------------------------

--SHOWING THE NUMBER OF  RECORDA IN THE TABLE
select  count(*) from employees
select  count(*) from jobs
select  count(*) from departments

--------------------------------------------------------------------------------------------
 
 --UPDATE THE EMPLOYEE SALARY   
 UPDATE employees  SET SALARY= 5666.876 WHERE  employee_id =1
  UPDATE jobs  SET SALARY= 5666.876 WHERE job_id =1

  -- CHANGE THE VALUE OF SALARY 

 ALTER TABLE  employees ALTER COLUMN SALARY DECIMAL(10,5)
  ALTER TABLE  JOBS ALTER COLUMN SALARY DECIMAL(10,5)

   
  -- ADD VALUES TO THE CITY NEW COLUMN 
  UPDATE employees
 SET  CITY='JEDDAH' WHERE  job_id =1
 UPDATE employees
 SET  CITY='MAKAH' WHERE  job_id =2
 UPDATE employees
 SET  CITY='RIYADH' WHERE  job_id =3


 --------------------------------------------------------------------------------------------------
  
  --COMPARING STRING 
 SELECT * FROM employees WHERE first_name LIKE '%I'
 SELECT * FROM employees WHERE first_name LIKE '_MAL'
 SELECT * FROM employees WHERE first_name LIKE 'R_W_N'

 -- RETURNS  THE UPPER NAME AND LOWER NAME
 SELECT UPPER(first_name) AS UPPER_FIRST_NAME, UPPER(LAST_name) AS UPPER_LAST_NAME , 
 LOWER(first_name)AS LOWER_FIRST_NAME,
 LOWER(LAST_name) AS LOWER_LAST_NAME ,LEN(first_name)  AS SIZE_FIRSTNAME, LEN(LAST_name) AS SIZE_LASTNAME FROM  employees



 --selects TOP 2  columns of EMPLOYEE table ordering the records BY THE FIRST AND LAST NAME (ORDER BY ) 
 SELECT  TOP 2 * FROM employees ORDER BY first_name,last_name

 SELECT SALARY FROM employees WHERE employee_id >=2 

 -----------------------------------------------------------------------------------------------------
 --(INNER JOIN)  FOR THE FIRST NAME AND THE SALARY FOR EACH EMPLOYEE ALSO THE DEPARTMENT THAT HE IN 


 SELECT E.first_name, E.SALARY,D.department_name FROM employees E 
 INNER JOIN departments D ON E.department_id= D.department_id


--(LEFT JOIN )to show employee ID, email, and job salary

SELECT E.employee_id, E.email,E.CITY, J.salary
FROM employees E
LEFT JOIN jobs J ON E.job_id =J.job_id;


 -- (RIGHT OUTER) JOIN to show all jobs and the corresponding employee details
SELECT J.job_id, J.job_title, E.first_name, E.last_name, E.email, E.salary
FROM employees E
RIGHT JOIN jobs J ON E.job_id = J.job_id


--(FULL OUTER JOIN)

SELECT E.employee_id ,D.department_name, E.CITY, E.salary
FROM employees E 
FULL OUTER JOIN departments D   ON  E.department_id= D.department_id


 


 --- (  DISPLAYING THE TABLES)

 SELECT *FROM employees
 SELECT *FROM departments 
  SELECT *FROM jobs

