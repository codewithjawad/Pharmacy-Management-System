------creation of Table : Doc_Spec ------
create table Doc_Spec(
doctor_id int foreign key references Doctor(doctor_id) ,
speciality_id int foreign key  references speciality (Speciality_id),
year int ,
constraint pk6_id primary key clustered (doctor_id , speciality_id ))

------insertion in Doc_Spec -------
ALTER PROCEDURE InsertDoc_Spec
    @doctor_name VARCHAR(100),
    @speciality_name VARCHAR(100),
    @year INT
AS
BEGIN
    DECLARE @doctor_id INT;
    DECLARE @speciality_id INT;
    -- Retrieve the doctor_id based on the doctor_name
    SELECT @doctor_id = doctor_id 
    FROM Doctor 
    WHERE doctor_name = @doctor_name;
    -- Retrieve the speciality_id based on the speciality_name
    SELECT @speciality_id = speciality_id 
    FROM Speciality 
    WHERE speciality_name = @speciality_name;
    -- Check if both doctor_id and speciality_id are not NULL
    IF @doctor_id IS NULL
    BEGIN
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN;
    END
    IF @speciality_id IS NULL
    BEGIN
        RAISERROR('Speciality with name %s does not exist.', 16, 1, @speciality_name);
        RETURN;
    END
    -- Insert into Doc_Spec table
    INSERT INTO Doc_Spec (doctor_id, speciality_id, year)
    VALUES (@doctor_id, @speciality_id, @year);
END;

EXEC InsertDoc_Spec  @doctor_name ='saad',@speciality_name = 'pharmacy',@year = 2024;


-------execution of the DOC_spec----- 
create procedure ListDoc_Spec
as 
begin
select Doctor_id , Speciality_id , year from doc_spec
end

exec ListDoc_Spec

-----Deletion in Doc_Spec-----
alter procedure DeleteDoc_Spec3
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
delete from  doc_spec 
where @speciality_id = speciality_id  and @doctor_id = doctor_id
end

exec DeleteDoc_Spec3 'saad','pharmacy',2023





----------------------------------------------------------------------------
--pending
-----Updation in Doc_SpecYear-----
create procedure updateDoc_Spec_year 
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int 
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
update Doc_spec
set year = @year 
where doctor_id = @doctor_id and speciality_id = @speciality_id 
end

exec updateDoc_Spec_year 'fiza','pharmacy',2023 

select * from vu_DocSpec
exec ListDoc_Spec

-----Updation in Doc_Spec_Doctor-----
create procedure updateDoc_Spec_Doctor2
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int 
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
update Doc_spec
set 
doctor_id = @doctor_id 

where year = @year  and speciality_id = @speciality_id 
end

exec updateDoc_Spec_Doctor2 'saad','pharmacy',2023

select * from vu_DocSpec
exec ListDoc_Spec

-----Updation in Doc_Spec_Speciality-----
create procedure updateDoc_Spec_Speciality
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int 
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
update Doc_spec
set 
 speciality_id = @speciality_id 
where year = @year  and doctor_id = @doctor_id 
end

exec updateDoc_Spec_Speciality 'saad','D-pharmacy',2021

select * from vu_DocSpec
exec ListDoc_Spec


