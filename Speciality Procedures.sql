
------creation of Table : Speciality ------
create table Speciality (
Speciality_id int Not Null Identity Primary Key ,
Speciality_name varchar(100) Not Null,
Speciality_institute varchar(100) Not Null)

------insertion in Speciality -------
create procedure InsertSpeciality
@Speciality_name varchar(100) ,
@Speciality_institute varchar(100) 
as
begin
insert into Speciality ( Speciality_name , Speciality_institute )
values (@Speciality_name , @Speciality_institute )
end


exec InsertSpeciality 'Physiotherapy' ,'Liaquat' 
exec InsertSpeciality 'pharmacy' ,'Agha khan' 


-------execution of the Speciality BY procedure----- 
create procedure ListSpeciality 
as 
begin
select Speciality_id , Speciality_name , Speciality_institute from Speciality
end

exec ListSpeciality 


-----Updation in Speciality-----
create procedure updateSpeciality 
@Speciality_id int ,
@Speciality_name varchar(100) ,
@Speciality_institute varchar(100) 
as
begin
update Speciality 
set Speciality_name = @Speciality_name ,
 Speciality_institute = @Speciality_institute
where Speciality_id = @Speciality_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with Speciality_id %d does not exist.', 16, 1, @Speciality_id);
        END
end

exec updateSpeciality 1 , 'Dentist' ,'shifa' 

exec Listspeciality 


-----Deletion in speeciality-----
alter procedure DeleteSpeciality
@speciality_id int 
as
begin
delete speciality where speciality_id = @speciality_id 
IF @@ROWCOUNT = 0
        BEGIN
            -- If no rows were affected, the record did not exist
            RAISERROR('Record with Speciality_id %d does not exist.', 16, 1, @Speciality_id);
        END
end

exec DeleteSpeciality 1

exec Listspeciality 