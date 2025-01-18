------creation of Table : Manufacturer ------  
create table manufacturer (
manufacturer_id int identity primary key not null,
manufacturer_name varchar(100) Not Null,
manufacturer_address varchar(100) Not Null ,
manufacturer_phone varchar(20) Not Null ,
manufacturer_email varchar(100) Not Null)


------insertion in Manufacturer -------

create procedure InsertManufacturer 
@manufacturer_name varchar(100) ,
@manufacturer_address varchar(100) ,
@manufacturer_phone varchar(20)  ,
@manufacturer_email varchar(100) 
as
begin
insert into manufacturer values (@manufacturer_name , @manufacturer_address , @manufacturer_phone , @manufacturer_email)
end

exec  InsertManufacturer @manufacturer_name='Ali' , @manufacturer_address='Gulshan-e-Iqbal' ,@manufacturer_phone= '021-1234212', @manufacturer_email='Ali@gmail.com';
exec  InsertManufacturer @manufacturer_name='sami' , @manufacturer_address='akhtar colony' ,@manufacturer_phone= '03442975889', @manufacturer_email='sami@gmail.com';

select * from manufacturer
-------execution of the Manufacture-----

create procedure ListManufacturer 
as 
begin
select manufacturer_id , manufacturer_name , manufacturer_address ,manufacturer_phone , manufacturer_email from manufacturer
end

exec ListManufacturer 

-----Updation in Manufacturer-----
create procedure updateManufacturer 
@manufacturer_id int ,
@manufacturer_name varchar(100) ,
@manufacturer_address varchar(100) ,
@manufacturer_phone varchar(20)  ,
@manufacturer_email varchar(100) 
as
begin
update manufacturer 
set manufacturer_name = @manufacturer_name ,
 manufacturer_address = @manufacturer_address ,
 manufacturer_phone =@manufacturer_phone ,
 manufacturer_email = @manufacturer_email 
where manufacturer_id = @manufacturer_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with manufacturer_id %d does not exist. ', 16, 1, @manufacturer_id);
        END
end

exec updateManufacturer 3, 'hasan' ,'johar' , '23383837777','jadi@gmail.com' 

exec ListManufacturer 


-----Deletion in Manufacturer-----
create procedure DeleteManufacturer 
@manufacturer_id int 
as
begin
delete manufacturer where manufacturer_id = @manufacturer_id 
        IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with manufacturer_id %d does not exist.', 16, 1, @manufacturer_id);
        END
end

exec DeleteManufacturer 3

exec ListManufacturer 
