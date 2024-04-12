create database myusers
use myusers

create table programmers
(ID int primary key,
 Programmer_Name varchar(50),
 City varchar(50),
 Phone varchar(15),
 Email varchar(50)
)

insert into programmers values(100, 'John Mathews', 'NY', '8262347896', 'jm@hotmail.com')
insert into programmers values(101, 'Jacob Michael', 'SFO', '8262347834', 'jacobm@hotmail.com')
insert into programmers values(102, 'Rohan Sanderson', 'LA', '8262347265', 'rohan@hotmail.com')
insert into programmers values(103, 'Rishi Sunak', 'London', '82623473456', 'rishibhai@hotmail.com')

select * from programmers

delete from programmers
where ID > 101

truncate table programmers

drop table programmers

drop database arnavsdb