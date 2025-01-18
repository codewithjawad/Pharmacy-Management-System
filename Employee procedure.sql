use pms
------creation of Table : Employee ------
create table Employee (
emp_id int identity primary key  not Null,
emp_name varchar(100) Not Null,
emp_address varchar(100) Not Null,
emp_phone varchar(11) Not Null unique ,
emp_email varchar(100) Not Null ,
emp_DOB date Not Null ,
emp_DOJ date Not Null ,
emp_position varchar(100) Not Null ,
emp_salary int Not Null )

------insertion in employee -------
alter procedure InsertEmployee 
@emp_name varchar(100) ,
@emp_address varchar(100) ,
@emp_phone varchar(11)  ,
@emp_email varchar(100) ,
@emp_DOB date  ,
@emp_DOJ date, 
@emp_position varchar(100),
@emp_salary int
as
begin
insert into  Employee values (@emp_name,@emp_address,@emp_phone,@emp_email,@emp_DOB, @emp_DOJ ,@emp_position,@emp_salary)
end

exec  InsertEmployee  'omair' , 'Gulshan-e-Iqbal' , '02112348254' , 'omair@gmail.com' , '2000/12/11' , '2021/12/23' ,'Sales_man', 20000
exec  InsertEmployee  'usman' , 'landikotal' , '021127878642' , 'usman@gmail.com' ,'2001/12/11' , '2022/12/23' ,'Sales-man', 22000

-------execution of the Employee----- 
alter procedure ListEmployee
as 
begin
select * from Employee
end



exec listEmployee 

-----Updation in Employee-----
create procedure updateEmployee
@emp_id int ,
@emp_name varchar(100) ,
@emp_address varchar(100) ,
@emp_phone varchar(11)  ,
@emp_email varchar(100) ,
@emp_DOB date  ,
@emp_DOJ date, 
@emp_position varchar(100),
@emp_salary int
as
begin
update Employee 
set emp_name = @emp_name ,
 emp_address = @emp_address ,
 emp_phone = @emp_phone ,
 emp_email = @emp_email ,
 emp_position = @emp_position,
 emp_DOB = @emp_DOB ,
 emp_DOJ = @emp_DOJ ,
 emp_salary = @emp_salary
where emp_id = @emp_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with emp_id %d does not exist.', 16, 1, @emp_id);
        END
end

exec updateEmployee 1, 'Ali' ,'Gulshan-e-iqbal' , '2338383','khushal@gmail.com','2001/12/11' , '2022/12/23' ,'head staff',35000
exec ListEmployee

-----Deletion in Employee-----
create procedure DeleteEmployee 
@Emp_id int 
as
begin
delete Employee where emp_id = @emp_id  
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with emp_id %d does not exist.', 16, 1, @emp_id);
        END
end

exec DeleteEmployee 4

exec ListEmployee

------insertion in employee -------
exec  InsertEmployee 'hasnain' , 'Gulshan-e-Iqbal' , '02112342564' , 'hasnain@gmail.com' , '2000/12/11' , '2021/12/23' ,'Sales man',20000
exec  InsertEmployee 'muzammmil' , 'Gulshan-e-Iqbal' , '02156375697' , 'muzammmil@gmail.com' , '2000/12/11' , '2021/12/23' ,'Sales man',20000
exec  InsertEmployee 'zohain' , 'sabir' , '02112387642' , 'zohain@gmail.com'  , '2000/12/11' , '2021/12/23', 'Sales man',22000 
exec Listemployee


-----Updation in employee-----
exec updateEmployee 4,'kashan' ,'char minar' , '032338383','kashan@gmail.com', '2000/12/11' , '2024/12/23','designer',35000
exec ListEmployee

-----Deletion in employee-----
exec DeleteEmployee 4
exec ListEmployee
