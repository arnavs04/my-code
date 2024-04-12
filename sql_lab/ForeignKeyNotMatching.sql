create database key2_db
use key2_db

create table table1(A int primary key, B int)
insert into table1 values(1, 20)
insert into table1 values(2, 30)
select * from table1

create table table2(B int primary key, C int)
insert into table2 values(10, 1)
insert into table2 values(20, 2)
select * from table2

alter table table2 add foreign key (B) references table1(B)