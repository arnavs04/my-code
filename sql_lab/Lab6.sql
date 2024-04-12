create database lab6_db
use lab6_db

create table Orders(
Order_ID int primary key,
CustomerName varchar(25),
City varchar(25),
ItemsPurchased varchar(25),
AmountPaid int,
OrderDate date)

insert into Orders values(101, 'Peter King', 'Manchester', 'Books', 120, '2020-01-13')
insert into Orders values(105, 'Priya Krishna', 'New Delhi', 'Pen', 50, '2020-01-23')
insert into Orders values(107, 'Jim Halpert', 'Manchester', 'Pencil', 100, '2020-01-30')
insert into Orders values(110, 'Michael Scott', 'New York', 'Pen', 60, '2020-02-05')
insert into Orders values(112, 'Harvey Specter', 'Birmingham', 'Books', 540, '2020-02-10')
insert into Orders values(114, 'Deepa Kamat', 'Kolkata', 'Books', 370, '2020-02-15')
insert into Orders values(118, 'Anita Desai', 'London', 'Eraser', 30, '2020-02-27')
insert into Orders values(121, 'Rachel Zane', 'Michigan', 'Pencil', 110, '2020-03-15')
insert into Orders values(125, 'John L', 'Canberra', 'Eraser', 70, '2020-03-24')
insert into Orders values(130, 'Babita Ghosh', 'Kolkata', 'Eraser', 80, '2020-04-05')
insert into Orders values(131, 'Anashka', 'New Delhi', 'Books', 490, '2020-04-11')
insert into Orders values(135, 'Kristen Gilbert', 'New York', 'Pencil', 50, '2020-05-14')
insert into Orders values(140, 'Gordan', 'London', 'Pen', 100, '2020-05-25')

select * from Orders

with TempTable(City, AmountPaid)
as (select distinct(City), sum(AmountPaid) from Orders group by City)
select AmountPaid 
from TempTable

select Order_ID, MONTH(OrderDate) as Month from Orders

with TempTable(Items, MonthOrders, NumberOfOrders, RevPerMonth)
as (select ItemsPurchased, MONTH(OrderDate), Count(*), sum(AmountPaid) from Orders group by ItemsPurchased, MONTH(OrderDate))
select Items, MonthOrders as Month, sum(NumberOfOrders) as NumberofOrders, sum(RevPerMonth) as RevPerMonth
from TempTable
group by Items, MonthOrders
order by Items, MonthOrders

select City, Count(distinct(CustomerName)) as NumberofCustomers
from Orders
group by City
order by Count(distinct(CustomerName)) desc

select CustomerName, City
from Orders
group by rollup(CustomerName, City)

select CustomerName, City
from Orders
group by cube(CustomerName, City)

select CustomerName, City
from Orders
group by grouping sets(rollup(CustomerName, City), cube(CustomerName, City))

select City, Count(distinct(CustomerName)) as NumberofCustomers
from Orders
group by City
having Count(distinct(CustomerName)) > 1
order by Count(distinct(CustomerName)) desc

alter table Orders add EmailAddress varchar(25)

update Orders set EmailAddress = 'info@gmail.com' where Order_ID = 101
update Orders set EmailAddress = 'info.support@gmail.com' where Order_ID = 105
update Orders set EmailAddress = '.info@gmail.com' where Order_ID = 107
update Orders set EmailAddress = 'info@support@gmail.com' where Order_ID = 110
update Orders set EmailAddress = '+info@gmail.com' where Order_ID = 112
update Orders set EmailAddress = 'info@g mail.com' where Order_ID = 114
update Orders set EmailAddress = '22@gmail.com' where Order_ID = 118
update Orders set EmailAddress = '@gmail.com' where Order_ID = 121
--update Orders set EmailAddress = NULL where Order_ID = 125
update Orders set EmailAddress = '22@' where Order_ID = 130
update Orders set EmailAddress = 'I+info@gmail.com' where Order_ID = 131
update Orders set EmailAddress = 'info.com+' where Order_ID = 135
update Orders set EmailAddress = 'info@gmail.com+' where Order_ID = 140

select * from Orders

CREATE FUNCTION CheckValidEmail(@EMAIL varchar(100))RETURNS bit as
BEGIN     
  DECLARE @bitEmailVal as Bit
  DECLARE @EmailText varchar(100)
  SET @EmailText=ltrim(rtrim(isnull(@EMAIL,'')))
  SET @bitEmailVal = case 
                          when (LEFT(@EmailText,1) LIKE ('[-_.+]') or RIGHT(@EmailText,1) LIKE ('[-_.+]')) then 0                                                                                    
                          when @EmailText LIKE '%@%@%' then 0
                          when @EmailText NOT LIKE '%_@__%.__%' then 0
                          when PATINDEX('%[^a-z,0-9,@,.,_,\-]%', @EmailText) != 0 then 0
                          else 1 
                      end
  RETURN @bitEmailVal
END 

select Order_ID, CustomerName, EmailAddress, dbo.CheckValidEmail(EmailAddress) as Validity 
from Orders
where dbo.CheckValidEmail(EmailAddress) = 1

select CAST(AmountPaid as varchar(25)) as AmountPaid_New
from Orders

select CONVERT(varchar(25), AmountPaid) as AmountPaid_New_2
from Orders

select * from Orders
where AmountPaid > (select AVG(AmountPaid) from Orders)




