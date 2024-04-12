create database lab5_db
use lab5_db

create table Customer(
CustomerID int primary key,
CustomerName varchar(25),
City varchar(25),
PostalCode int,
Supplier int,
Amount int)

create table Supplier(
SupplierID int primary key,
SupplierName varchar(25),
Address varchar(25),
PostalCode int,
Amount int)

insert into Customer values(101, 'Sonali', 'Rajasthan', 122091, 901, 122091)
insert into Customer values(102, 'Riya', 'Haryana', 126082, 903, 126082)
insert into Customer values(103, 'Kartik', 'Punjab', 128923, 903, 128923)
insert into Customer values(202, 'David', 'Orissa', 346494, 902, 346494)

insert into Supplier values(901, 'PizzaDen', 'Orissa', 234891, 234891)
insert into Supplier values(902, 'Haldirams', 'Haryana', 126082, 126082)
insert into Supplier values(903, 'Bikaji', 'Bikaner', 134583, 134583)
insert into Supplier values(904, 'Amul', 'Gujrat', 123454, 123454)
insert into Supplier values(905, 'BTea Box', 'Assam', 125678, 125678)

select * from Customer
select * from Supplier

select City from Customer 
UNION select Address from Supplier

select City from Customer 
UNION ALL select Address from Supplier

select PostalCode from Customer 
INTERSECT select PostalCode from Supplier


select Customer.CustomerID, Customer.CustomerName
from Customer, Supplier
where Customer.Supplier = Supplier.SupplierID
and Customer.City <> Supplier.Address


select Customer.CustomerID, Customer.CustomerName, Customer.City,Customer.PostalCode
from Customer, Supplier
where Customer.Supplier = Supplier.SupplierID
and Customer.City = Supplier.Address

select CustomerName from Customer
where CustomerName like '_a%'

alter table Supplier add Estd int

update Supplier set Estd = 2005 where SupplierID = 901
update Supplier set Estd = 2007 where SupplierID = 902
update Supplier set Estd = 2018 where SupplierID = 903
update Supplier set Estd = NULL where SupplierID = 904
update Supplier set Estd = 2020 where SupplierID = 905

select * from Supplier

delete from Supplier where Estd is NULL

select * from Supplier

select Customer.CustomerID, Customer.CustomerName, Customer.City,Customer.PostalCode, Customer.Supplier, Customer.Amount 
from Customer, Supplier
where Customer.Supplier = Supplier.SupplierID and Supplier.SupplierName = 'Haldirams'

create table Customer2(
CustomerID int primary key,
CustomerName varchar(25),
City varchar(25),
PostalCode int,
Supplier int,
Amount int)

create table Supplier2(
SupplierID int primary key,
SupplierName varchar(25),
Address varchar(25),
PostalCode int,
Amount int)

insert into Customer2 values(101, 'Sonali', 'Rajasthan', 122091, 901, 122091)
insert into Customer2 values(102, 'Riya', 'Haryana', 126082, 903, 126082)
insert into Customer2 values(103, 'Kartik', 'Punjab', 128923, 903, 128923)
insert into Customer2 values(202, 'David', 'Orissa', 346494, 902, 346494)

insert into Supplier2 values(901, 'PizzaDen', 'Orissa', 234891, 234891)
insert into Supplier2 values(902, 'Haldirams', 'Haryana', 126082, 126082)
insert into Supplier2 values(903, 'Bikaji', 'Bikaner', 134583, 134583)
insert into Supplier2 values(904, 'Amul', 'Gujrat', 123454, 123454)
insert into Supplier2 values(905, 'BTea Box', 'Assam', 125678, 125678)

select * from Customer2
select * from Supplier2

select * from Customer2
where Amount > (select MAX(Amount) from Supplier2)

select * from Customer2
where Amount > (select MIN(Amount) from Supplier2)

select DISTINCT(Supplier2.SupplierName) from Supplier2
where Supplier2.SupplierID in (select DISTINCT(Customer2.Supplier) from Customer2)

select CURRENT_TIMESTAMP as CurrentDateandTime

select SupplierName from Supplier2
where SupplierName like '%a__'

alter table Supplier2 add Quantity int

update Supplier2 set Quantity = 76 where SupplierID = 901
update Supplier2 set Quantity = 80 where SupplierID = 902
update Supplier2 set Quantity = 50 where SupplierID = 903
update Supplier2 set Quantity = 70 where SupplierID = 904
update Supplier2 set Quantity = 90 where SupplierID = 905

insert into Customer2 values(205, 'Palak', 'Assam', 127891, 127891, 905)

select * from Customer2
select * from Supplier2

select Customer2.CustomerName from Customer2, Supplier2 
where Customer2.Supplier = Supplier2.SupplierID
and Supplier2.Quantity > 70

delete from Supplier2 
where Supplier2.SupplierID in (select Customer2.Supplier from Customer2 where Customer2.CustomerName = 'David')

select * from Supplier2
where Supplier2.SupplierID not in (select Customer2.Supplier from Customer2)