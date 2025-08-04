CREATE DATABASE Employee;
 
use Employee;

create table Employee(
EMPLOYEE_ID int,
FIRST_NAME varchar(30),
LAST_NAME varchar(9),
SALARY int,
JOINING_DATE varchar(20),
DEPARTMENT varchar(15),
PRIMARY KEY(EMPLOYEE_ID)
);

show tables;

select * from Employee;

insert into Employee(
EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) values
(1, 'Venkatesh','S', 100000, '08/28/2015', 'Banking'),
(2, 'Ragavi','P' , 75000, '08/28/2015', 'Business'),
(3, 'Gopinath', 'C', 50000, '03/02/2016', 'Pharma'),
(4, 'Dinesh', 'G', 50000, '03/02/2016', 'Insurance'),
(5, 'Saibabu', 'E', 40000, '07/08/2017', 'Software'),
(6, 'Hasan', 'S', 29000, '07/08/2017', 'Manufacturing'),
(7, 'Divya', 'P', 33000, '07/08/2017', 'Healthcare'),
(8, 'Aravindhan', 'R', 40000, '07/08/2017', 'Healthcare'),
(9, 'Sathish', 'MD', 45000, '03/02/2016', 'Automobile'),
(10, 'Prasanth', 'PKP', 34000, '03/02/2016', 'Insurance'),
(11, 'Vijay', 'R', 25684, '03/02/2016', 'Business'),
(12, 'Sivakumar', 'K', 54789, '03/02/2016', 'Software');

use Employee;

create table Incentives(
EMPLOYEE_REF_ID int,
INCENTIVE_DATE varchar(30),
INCENTIVE_AMOUNT int,
foreign key(EMPLOYEE_REF_ID) references EMPLOYEE (EMPLOYEE_ID)
);
show tables;

select * from Incentives;

INSERT INTO  Incentives
(EMPLOYEE_REF_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT) VALUES
(1, '01-FEB-16', 5000),
(2, '01-FEB-16', 3000),
(3, '01-FEB-17', 4000),
(1, '01-JAN-17', 4500),
(2, '01-JAN-17', 3500);

-- 1 get all employee details from the employee table
select * from Employee;

-- 2 get first_name and last_name from the employee table
select FIRST_NAME,LAST_NAME from Employee;

-- 3 get first name from the emplyee table using alias name
select FIRST_NAME as Employee_name from Employee;

-- 4 get FIRST_NAME from employee table in upper case
select upper (FIRST_NAME) from Employee;

-- 5 get FIRST_NAME from employee table in lower case
select lower (FIRST_NAME) from Employee;

-- 6 get unique DEPARTMENT from employee table
select distinct DEPARTMENT from Employee;

-- 7 select first 3 characters of FIRST_NAME from Employee table
select substring(FIRST_NAME,1,3) as FIRST_NAME from Employee;

-- 8 get position of 'a' in name 'ragavi' from Employee table
select position('a' in FIRST_NAME) position_of_a_ragavi from Employee where EMPLOYEE_ID=2;

-- 9 get FIRST_NAME form Employe table after removing white spaces from right side
select rtrim(FIRST_NAME) FIRST_NAME from Employee;


-- 10 get FIRST_NAME form Employe table after removing white spaces from left side
select ltrim(FIRST_NAME) FIRST_NAME from Employee;

-- 11 get length of FIRST_NAME from Employee table
select length (FIRST_NAME) from Employee;

-- 12 get FIRST_NAME from Employee table after replacing 'a' with $
SELECT REPLACE(FIRST_NAME, 'a', '$') AS Modified_First_Name FROM Employee;

-- 13 get FIRST_NAME LAST_NAME as single column from employee table seperated by a'_'
select concat(FIRST_NAME,'_',LAST_NAME) from Employee;

-- 14 get FIRST_NAME,joining year,joining month and joining date from the  table 
select FIRST_NAME,substring(JOINING_DATE,7,4),substring(JOINING_DATE,4,2),substring(JOINING_DATE,1,2) from Employee;

-- 15 get all Employee details from the table order by FIRST_NAME Ascending 
select * from Employee order by FIRST_NAME asc;

-- 16 get all Employee details from the table order by FIRST_NAME descending 
select * from Employee order by FIRST_NAME desc;
 
-- 17 get  all Employee details from the Employee table order by FIRST_NAME Ascending and salary descending
select * from Employee order by FIRST_NAME asc,SALARY desc;

-- 18 get employee details from employee table whose employee name is "Dinesh"
select * from Employee where FIRST_NAME='Dinesh';

-- 19 get employee details from employee table whose employee name are 'Dinesh' and 'Roy'
select * from Employee where FIRST_NAME='Dinesh'or'Roy';

-- 20 get Employee details from Employee table where Employee name or not 'Dinesh' and 'Roy'
select * from Employee where FIRST_NAME<>'Dinesh'or'Roy';

-- 21 get Employee details from Employee table whose FIRST_NAME starts with 'S'
select * from Employee where FIRST_NAME like 's%';

-- 22  get Employee details from Employee table whose FIRST_NAME contains 'v'
select * from Employee where FIRST_NAME like '%v%';

-- 23  get Employee details from Employee table whose FIRST_NAME end with 'n'
select * from Employee where FIRST_NAME like '%n';

-- 24  get Employee details from Employee table whose FIRST_NAME end with 'n' and contails 4 letters
select * from Employee where FIRST_NAME like '____n';

-- 25  get Employee details from Employee table whose FIRST_NAME starts with 'j' and contails 4 letters
select * from Employee where FIRST_NAME like 'J____';

-- 26.get Employee details from the Employee table who's salary greater than 60000
select * from Employee where Salary>60000;
     
-- 27.get Employee details from the Employee table who's salary less than 80000
select * from Employee where Salary<80000;
      
-- 28. get Employee details from the Employee table who's salary between 50000 and 80000
select * from Employee where Salary>50000 and salary<80000;
       
-- 29. get Employee details from the Employee table who's name in Venkatesh and Ragavi
select * from Employee where FIRST_NAME='Venkatesh' or FIRST_NAME='Ragavi';
        
-- 30.get Employee details from the employee table who's has '%' in last_name.tip:escape for special char in query
select * from Employee where LAST_NAME ='%';


-- 31 GET THE LAST NAME FROM EMPLOYEE TABLE AFTER REPLACING @ WITH WHITE SPACE 
select replace(LAST_NAME, '@', ' ') as Modified_Last_Name from Employee;

-- 32 GET DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE 
select DEPARTMENT , sum(SALARY) as TOTAL_SALARY from Employee group by DEPARTMENT; 

-- 33 GET DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT , sum(SALARY) AS TOTAL_SALARY from Employee group by DEPARTMENT order by sum(SALARY) desc; 

-- 34 GET DEPARTMENT AND NUMBER EMPLOYEE IN DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT , count(EMPLOYEE_ID),sum(SALARY) AS TOTAL_SALARY from employee group by DEPARTMENT order by sum(SALARY) desc; 

-- 35 GET DEPARTMENT WISE AVERAGE SALARY FROM EMPLOYEE TABLE ORDER BY SALARY ASSENDING
select DEPARTMENT , avg(SALARY) as AVERAGE_SALARY from Employee group by DEPARTMENT order by avg(SALARY) asc;

-- 36 GET DEPARTMENT WISE MAXIMUM SALARY FROM EMPLOYEE TABLE ORDER BY SALARY ASSENDING
select DEPARTMENT , max(SALARY) as AVERAGE_SALARY from Employee group by DEPARTMENT order by max(SALARY) asc;

-- 37 GET DEPARTMENT WISE MINIMUM SALARY FROM EMPLOYEE TABLE ORDER BY SALARY ASSENDING
select DEPARTMENT , min(SALARY) as AVERAGE_SALARY from Employee group by DEPARTMENT order by min(SALARY) asc;

-- 38 SELECT NUMBER OF EMPLOYEE JOINED WITH RESPECT TO YEAR AND MONTH TABLE 
select SUBSTRING_INDEX(JOINING_DATE, '/', -1) AS JOINING_YEAR,
	   SUBSTRING_INDEX(JOINING_DATE, '/', 1) AS JOINING_MONTH,
       COUNT(*) AS EMPLOYEE_COUNT from Employee
group by JOINING_YEAR, JOINING_MONTH order by JOINING_YEAR, JOINING_MONTH;

-- 39 SELECT DEPARTMENT , TOTAL SALARY WITH RESPECT TO TOTAL SALARY GREATER THAN 800000
select DEPARTMENT , sum(SALARY) TOTAL_SALARY from Employee group by DEPARTMENT having sum(SALARY)>800000 order by sum(SALARY) desc;

-- 40SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE 
select t1.FIRST_NAME , t2.Incentive_Amount from Employee t1 join Incentives t2 on t1.EMPLOYEE_ID=t2.Employee_Ref_Id;

-- 41 SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE WHO HAVE INCENTIVE MORE THAN 3000
select t1.FIRST_NAME , t2.Incentive_Amount from Employee t1 join Incentives t2 on t1.EMPLOYEE_ID=t2.Employee_Ref_Id where Incentive_Amount > 3000;

-- 42 SELECT FIRST NAME AND INCENTIVE AMOUNT FROM EMPLOYEEE AND INCENTIVE TABLE EVEN THEY NOT HAVE INCENTIVE
select t1.FIRST_NAME , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.EMPLOYEE_ID=t2.Employee_Ref_Id;

-- 43 SELECT FIRST NAME AND INCENTIVE AMOUNT FROM EMPLOYEEE AND INCENTIVE TABLE EVEN THEY NOT HAVE INCENTIVE THAN PUT 0
select t1.FIRST_NAME , ifnull(t2.Incentive_Amount,0) from employee t1 left join Incentives t2 on t1.EMPLOYEE_ID=t2.Employee_Ref_Id ;

-- 44 SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE  WHO GOT INCENTIVE USING LEFT JOIN
select t1.FIRST_NAME , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.EMPLOYEE_ID=t2.Employee_Ref_Id 
where t2.Incentive_Amount is not null ;

-- 45 select max incentive with respect to employee from employee table and incentive table using sub query
select FIRST_NAME,(select MAX(Incentive_Amount) from Incentives where Employee_Ref_Id = Employee.EMPLOYEE_ID) AS Max_Incentive from Employee;

-- 46 SELECT TOP 2 SALARY FROM THE TABLE
select SALARY TOP_2_SALARY from Employee order by SALARY desc limit 2;

-- 47 SELECT TOP N SALARY FROM THE TABLE
select distinct SALARY  from Employee order by SALARY DESC LIMIT 5 ;

-- 48 SELECT 2ND HIGHEST SALARY FROM THE TABLE
select SALARY 2ND_HIGHEST_SALARY from Employee limit 1 offset 1 ;

-- 49 SELECT Nth HIGHEST SALARY FROM THE TABLE
select distinct SALARY  from Employee order by SALARY DESC LIMIT 1 offset 3 ;





