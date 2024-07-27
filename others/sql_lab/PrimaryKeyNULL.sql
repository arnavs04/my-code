create database keys_db
use keys_db

create table table1(A int primary key, B int, C int)
insert into table1 values(1, 2, NULL)
insert into table1 values(3, 4, NULL)
select * from table1

alter table table1 add primary key(C)