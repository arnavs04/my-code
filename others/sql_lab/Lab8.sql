create database lab8_db
use lab8_db

create table Employee(
Employee_ID int primary key, 
Name varchar(25), 
Age int, 
Salary int,
Department varchar(25))


insert into Employee values(1, 'Adiya', 25, 30000, 'Executive')
insert into Employee values(2, 'Aditya', 28, 31000, 'Accountant')
insert into Employee values(3, 'Priyanka', 30, 32000, 'Salesman')
insert into Employee values(4, 'Anmol', 35, 31000, 'Executive')
insert into Employee values(5, 'Rahul', 31, 29000, 'Accountant')
insert into Employee values(6, 'Shubham', 29, 27000, 'Salesman')
insert into Employee values(7, 'Sam', 33, 32000, 'Salesman')
insert into Employee values(8, 'Kabir', 33, 28000, 'Salesman')
insert into Employee values(9, 'Priya', 23, 35000, 'Accountant')
insert into Employee values(10, 'Kabir', 29, 26000, 'Executive')

select * from Employee


BEGIN 
   SELECT Salary FROM Employee 
   WHERE Employee.Name= 'Aditya'and Employee.Age= 28
END; 

CREATE or ALTER PROCEDURE get_employee_info_by_name_dept(
    @E_Name VARCHAR(25),
    @E_Department VARCHAR(25)
)
AS
BEGIN
    SELECT *
    FROM Employee
    WHERE Employee.Name = @E_Name AND Employee.Department = @E_Department;
END;

EXEC get_employee_info_by_name_dept @E_name = 'Aditya', @E_Department = 'Accountant';



Begin
	select COUNT(DISTINCT(Name)) as UniqueName from Employee
END;


DECLARE @emp_id INT, @emp_name VARCHAR(25), @emp_dept VARCHAR(25);

DECLARE emp_cursor CURSOR FOR
	SELECT Employee_ID, Name, Department FROM Employee;

OPEN emp_cursor;
FETCH NEXT FROM emp_cursor INTO @emp_id, @emp_name, @emp_dept;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee ID: ' + CAST (@emp_id AS VARCHAR(10)) + ', Name:' + @emp_name + ', Department: ' + @emp_dept;
	FETCH NEXT FROM emp_cursor INTO @emp_id, @emp_name, @emp_dept;
END

CLOSE emp_cursor
DEALLOCATE emp_cursor


DECLARE @emp_id2 INT, @emp_name2 VARCHAR(25), @emp_salary int;

DECLARE emp_cursor2 CURSOR FOR
	SELECT Employee_ID, Name, Salary FROM Employee;

OPEN emp_cursor2;
FETCH NEXT FROM emp_cursor2 INTO @emp_id2, @emp_name2, @emp_salary;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Employee ID: ' + CAST (@emp_id2 AS VARCHAR(10)) + ', Name: ' + @emp_name2 + ', Salary: ' + CAST (@emp_salary AS VARCHAR(10));
	FETCH NEXT FROM emp_cursor2 INTO @emp_id2, @emp_name2, @emp_salary;
END

CLOSE emp_cursor2
DEALLOCATE emp_cursor2



BEGIN TRY
DECLARE @num INT, @msg varchar(200)
SET @num = 5/0
PRINT 'This will not execute'
END TRY
BEGIN CATCH
PRINT 'Error occured that is'
set @msg=(SELECT Error_number())
print @msg;
set @msg=(SELECT Error_Severity())
print @msg;
set @msg=(SELECT Error_State())
print @msg;
set @msg=(SELECT Error_Procedure())
print @msg;
set @msg=(SELECT Error_Line())
print @msg;
set @msg=(SELECT Error_Message())
print @msg;
END CATCH
GO


CREATE OR ALTER TRIGGER raise_error_trigger
ON Employee
AFTER INSERT
AS
BEGIN
    RAISERROR('Entry is added but trigger is activated', 5, 3);
END;

DROP TRIGGER raise_error_trigger;

CREATE FUNCTION MySum(@n INT)
RETURNS INT
AS
BEGIN
    DECLARE @sum INT = 0;
    DECLARE @i INT = 1;

    WHILE @i <= @n
    BEGIN
        SET @sum = @sum + @i;
        SET @i = @i + 1;
    END

    RETURN @sum;
END;

SELECT dbo.MySum(15) AS SumResult;





