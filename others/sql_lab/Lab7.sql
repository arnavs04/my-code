create database lab7_db
use lab7_db

create table Student1(
ID int primary key,
first_name varchar(25),
last_name varchar(25),
location varchar(25),
roll_no varchar(25),
department varchar(25),
percentage int)

create table Student2(
ID int primary key,
first_name varchar(25),
last_name varchar(25),
location varchar(25),
roll_no varchar(25),
department varchar(25),
percentage int)

insert into Student1 values(101, 'Rakesh', 'sharma', 'chennai', 'Cs1234', 'cse', 40)
insert into Student1 values(102, 'Rajesh', 'gupta', 'chennai', 'Ec123', 'ece', 60)
insert into Student1 values(103, 'Mahesh', 'varma', 'delhi', 'Ec234', 'ece', 60)
insert into Student1 values(104, 'Rajeev', 'patel', 'mumbai', 'Cs123', 'cse', 80)
insert into Student1 values(105, 'Prithivi', 'kumar', 'hyderabad', 'Me123', 'mechanical', 85)

insert into Student2 values(101, 'Ram', 'kumar', 'chennai', 'Cs112', 'cse', 50)
insert into Student2 values(102, 'Sham', 'singh', 'nagpur', 'Ec112', 'ece', 60)
insert into Student2 values(113, 'Mukesh', 'patel', 'delhi', 'Ec113', 'ece', 65)
insert into Student2 values(114, 'Rohit', 'rana', 'hyderabad', 'Cs1234', 'cse', 85)
insert into Student2 values(105, 'Partha', 'sharma', 'vijayawada', 'Me113', 'mechanical', 40)

select * from Student1
select * from Student2

select department from Student1
where percentage > 60
INTERSECT
select department from Student2
where percentage < 60

select department from Student1
where percentage > 60
EXCEPT
select department from Student2
where percentage < 60

select DISTINCT(first_name) from Student1 
where department in (select department from Student2)

delete from Student1 
where location not in (select location from Student2 where percentage > 60)

select * from Student1

insert into Student1(ID, first_name, last_name, location, roll_no, department, percentage) 
select ID, first_name, last_name, location, roll_no, department, percentage from Student2 where percentage = 85

select * from Student1

Increment percentage of students by 5 in table2 whose percentage is equal to students in table 1
and >60.

update Student2 set percentage += 5
where percentage > 60 and percentage in (select percentage from Student1)

select * from Student2

create table Product(
id int primary key, 
name varchar(25), 
cost float,
year int,
city varchar(25))

create table Sales(
id int primary key, 
product_id int, 
price float,
year int,
city varchar(25))

insert into Product values(1, 'chair', 245.00, 2017, 'Chicago')
insert into Product values(2, 'armchair', 500.00, 2018, 'Chicago')
insert into Product values(3, 'desk', 900.00, 2019, 'Los Angeles')
insert into Product values(4, 'lamp', 85.00, 2017, 'Cleveland')
insert into Product values(5, 'bench', 2000.00, 2018, 'Seattle')
insert into Product values(6, 'stool', 2500.00, 2020, 'Austin')
insert into Product values(7, 'tv table', 2000.00, 2020, 'Austin')

insert into Sales values(1, 2, 2000.00, 2020, 'Chicago')
insert into Sales values(2, 2, 590.00, 2020, 'New York')
insert into Sales values(3, 2, 790.00, 2020, 'Cleveland')
insert into Sales values(5, 3, 800.00, 2019, 'Cleveland')
insert into Sales values(6, 4, 100.00, 2020, 'Detroit')
insert into Sales values(7, 5, 2300.00, 2019, 'Seattle')
insert into Sales values(8, 7, 2000.00, 2020, 'New York')

select * from Product
select * from Sales

select Product.name, Product.cost
from Product, Sales
where Product.id = Sales.product_id and Sales.price = 2000.00

select SUM(price) as TotalPrice
from Sales
where year = 2020 or year = 2019

select Product.*
from Product, Sales
where Product.id = Sales.product_id and Sales.year <> 2020
UNION
select Product.*
from Product, Sales
where Product.id not in (select Sales.product_id from Sales)

select city, SUM(price) as TotalPrice
from Sales
group by city
having SUM(price) < 2100

select DISTINCT(Product.name), Product.cost
from Product, Sales
where Product.id not in (select Sales.product_id from Sales)

create table Sailor(
sid int primary key,
sname varchar(25),
rating int,
age int)

create table Boats(
bid int primary key,
bname varchar(25),
bcolor varchar(25))

create table Reserves(
sid int,
bid int,
Date date)

create table Employees(
emp_id  varchar(25) primary key,
first_name varchar(25),
last_name varchar(25),
hire_date date,
dept_id int,
salary int)

create table Department(
dept_id int primary key,
dept_name varchar(25),
manager_id varchar(25),
location_id int)

insert into Sailor values(22, 'Dustin', 7, 45)
insert into Sailor values(29, 'Brutus', 1, 33)
insert into Sailor values(31, 'Lubber', 8, 55)
insert into Sailor values(32, 'Andy', 8, 25)
insert into Sailor values(58, 'Rusty', 10, 35)
insert into Sailor values(64, 'Horatio', 7, 35)
insert into Sailor values(71, 'Zorba', 10, 16)
insert into Sailor values(74, 'Horatio', 9, 35)
insert into Sailor values(85, 'Art', 3, 25)
insert into Sailor values(95, 'Bob', 3, 63)

insert into Boats values(101, 'Interlake', 'blue')
insert into Boats values(102, 'Interlake', 'red')
insert into Boats values(103, 'Clipper', 'green')
insert into Boats values(104, 'Marine', 'red')

insert into Reserves values(22, 101, '1998-10-10')
insert into Reserves values(22, 102, '1998-10-10')
insert into Reserves values(22, 103, '1998-08-10')
insert into Reserves values(22, 104, '1998-07-10')
insert into Reserves values(31, 102, '1998-10-11')
insert into Reserves values(31, 103, '1998-06-11')
insert into Reserves values(31, 104, '1998-12-11')
insert into Reserves values(64, 101, '1998-05-09')
insert into Reserves values(64, 102, '1998-08-09')
insert into Reserves values(74, 103, '1998-08-09')

insert into Employees values('ABC01', 'Ram', 'Kumar', '2022-03-24', 1700, 60000)
insert into Employees values('ABC02', 'Raman', 'Sharma', '2021-08-08', 1701, 70000)
insert into Employees values('ABC03', 'Suvra', 'Sarkar', '2018-03-04', 1702, 65000)
insert into Employees values('ABC04', 'Shyam', 'Kumar', '2022-03-20', 1703, 60000)
insert into Employees values('ABC05', 'Rohit', 'Verma', '2019-09-02', 1700, 80000)
insert into Employees values('ABC06', 'Varsha', 'Kumari', '2022-01-14', 1702, 60000)
insert into Employees values('ABC07', 'Umesh', 'Sinha', '2019-10-24', 1703, 70000)
insert into Employees values('ABC08', 'Ram', 'Sahoo', '2009-03-12', 1704, 50000)

insert into Department values(1700, 'Solutions', 'ABC08', 1700)
insert into Department values(1701, 'Catering', 'ABC08', 1701)
insert into Department values(1702, 'Server', 'ABC02', 1700)
insert into Department values(1703, 'Housing', 'ABC02', 1700)
insert into Department values(1704,' UI', 'ABC08', 1700)

select * from Sailor
select * from Boats
select * from Reserves
select * from Employees
select * from Department

select Boats.bname, COUNT(Reserves.bid) as ReservationTotal
from Boats, Reserves
where Boats.bid = Reserves.bid
group by Boats.bname

select DISTINCT(Sailor.sname) from Sailor, Reserves
where Sailor.sid in (select Reserves.sid from Reserves group by Reserves.sid having COUNT(Reserves.sid) = 4 )

