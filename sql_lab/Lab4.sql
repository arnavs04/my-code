create database lab4
use lab4

create table employee(
Emp_ID int primary key,
E_Name varchar(20),
Sex char(1),
Salary int,
Department varchar(25))

insert into employee values(1001,'Sonali','F', 100000, 'HR')
insert into employee values(1002,'Riya','F', 1000000, 'SALES')
insert into employee values(1003,'Karthik','M', 150000, 'OPERATIONS')
insert into employee values(1004,'David','M', 200000, 'SALES')
insert into employee values(1005,'Sameer','M', 300000, 'HR')
insert into employee values(1006,'Rahul','M', 2000000, 'OPERATIONS')
insert into employee values(1007,'Ravi','M', 500000, 'SALES')

select * from employee

select Department, Count(*) as CountEmp
from employee
group by Department

select SUM(Salary) as SalarySum
from employee

select MIN(Salary) as SalaryMin, MAX(Salary) as SalaryMax, AVG(Salary) as SalaryAvg
from employee

select Count(*) as FemaleCount
from employee
where Sex = 'F'

select Count(*) as CountSalary
from employee
where Salary > (Select AVG(Salary) from employee)

select SUM(Salary) as SalarySum2
from employee
where Salary <> 2000000

select Count(*) as CountSalary2
from employee
where Salary >=  200000

select (select AVG(Salary)-MIN(Salary) from employee) as SalaryDiff

select Department, AVG(Salary) as AvgSalaryDept
from employee
group by Department

update employee
set Salary += (Salary / 10)
where Salary between 150000 and 500000

select * from employee

select Department, MAX(Salary) as MaxSalaryDept
from employee
group by Department

select STDEV(Salary) as StandardDeviation
from employee

select VAR(Salary) as Variance
from employee


-- q2
create table Student(
Student_ID varchar(7) primary key,
S_Name varchar(20),
Age int,
Fees int,
Department varchar(25))

insert into Student values('CSE1001', 'Avinash', 26, 930000, 'CSE')
insert into Student values('CSE1002', 'Tejas', 23, 50000, 'Accounts')
insert into Student values('CSE1003', 'Vivek', 30, 900000, 'ECE')
insert into Student values('CSE1004', 'Jitendra',25, 930000, 'CSE')
insert into Student values('CSE1005', 'Sweta', 31, 50000, 'Accounts')
insert into Student values('CSE1006', 'Smith', 26, 900000, 'ECE')
insert into Student values('CSE1007', 'Ravi', 24, 900000, 'ECE')
insert into Student values('CSE1008', 'Rahul', 25, 900000, 'ECE')
insert into Student values('CSE1009', 'Karthik', 29, 50000, 'Accounts')
insert into Student values('CSE1010', 'Smyth', 28, 930000, 'CSE')

truncate table Student

select * from Student

select MAX(LEN(S_Name)) as LongestName, MIN(LEN(S_Name)) as ShortestName
from Student

select S_Name, Department
from Student
where S_Name like '%R%'

select Count(*) as FourLetterName
from Student
where S_Name like '____'

select AVG(LEN(S_Name)) as AverageLength
from Student

update Student set S_Name = '****' where S_Name like '%a%'
select * from Student

select count(S_Name) as CountSmith from Student where SOUNDEX(S_Name) = SOUNDEX('Smith')

select left(S_Name, 3) as LeftName, right(S_Name, 3) as RightName
from Student

select LOWER(S_Name) as LowerName
from Student

select UPPER(S_Name) as UpperName
from Student

select CONCAT(Student_ID, ',', S_Name) as Concatenated
from Student

select LTRIM(S_Name) as LeadingSpaces
from Student

select RTRIM(S_Name) as TrailingSpaces
from Student

select TRIM(S_Name) as Spaces
from Student

select S_Name, REVERSE(S_Name) as ReversedName
from Student