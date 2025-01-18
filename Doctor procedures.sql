
------creation of Table : Doctor ------
create table Doctor (
doctor_id int identity primary key not Null,
doctor_name varchar(100) Not Null,
doctor_address varchar(100) Not Null,
doctor_phone varchar(11) Not Null unique ,
doctor_email varchar(100) Not Null ,
doctor_DOB date Not Null ,
doctor_DOJ date Not Null)  

------insertion in Doctor -------
alter procedure InsertDoctor
@doctor_name varchar(100) ,
@doctor_address varchar(100) ,
@doctor_phone varchar(11)  ,
@doctor_email varchar(100) ,
@doctor_DOB date  ,
@doctor_DOJ date 
as
begin
insert into Doctor values (@doctor_name ,@doctor_address , @doctor_phone  ,@doctor_email  ,@doctor_DOB ,@doctor_DOJ )
end

exec  InsertDoctor 'waqar' , 'Gulshan-e- hadeed' , '0345679887' , 'waqar@gmail.com' , '2002/12/09' , '2022/1/12'  
exec  InsertDoctor 'ayesha' , 'defence' , '0333256789' , 'Ahmed@gmail.com' , '2001/12/09' , '2023/1/12'  

------execution of the Doctor----- 
create procedure ListDoctor
as 
begin
select doctor_id, doctor_name ,doctor_address , doctor_phone  ,doctor_email , doctor_DOB , doctor_DOJ  from doctor
end

exec ListDoctor


-----Updation in Doctor -----
create procedure updateDoctor 
@doctor_id int ,
@doctor_name varchar(100) ,
@doctor_address varchar(100) ,
@doctor_phone varchar(11)  ,
@doctor_email varchar(100) ,
@doctor_DOB date  ,
@doctor_DOJ date
as
begin
update doctor
set doctor_name =  @doctor_name,
doctor_address = @doctor_address  ,
doctor_phone = @doctor_phone ,
doctor_email = @doctor_email ,
doctor_DOB = @doctor_DOB ,
doctor_DOJ = @doctor_DOJ  
where doctor_id = @doctor_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with doctor_id %d does not exist.', 16, 1, @doctor_id);
        END
end

exec updateDoctor 1 ,'saad' , 'Gulshan-e-Iqbal' , '0211234212' , 'Ali@gmail.com' , '2002/12/09' , '2022/1/12' 

exec ListDoctor 


-----Deletion in Doctor -----
alter procedure DeleteDoctor
@doctor_id int 
as
begin
delete Doctor where doctor_id = @doctor_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with doctor_id %d does not exist.', 16, 1, @doctor_id);
        END
end

exec DeleteDoctor 3

exec ListDoctor 
