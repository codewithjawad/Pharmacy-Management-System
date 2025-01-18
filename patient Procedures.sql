

--------------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : patient ------
create table Patient (
patient_id int identity primary key not Null,
patient_name varchar(100) Not Null,
patient_gender varchar(100) Not Null,
patient_DOB date Not Null ,
patient_email varchar(100) Not Null ,
patient_address varchar(100) Not Null, 
patient_contact varchar(11) Not Null unique )


------insertion in patient -------
create procedure Insertpatient
@patient_name varchar(100) ,
@patient_gender varchar(100),
@patient_DOB date ,
@patient_email varchar(100) ,
@patient_address varchar(100) ,
@patient_contact varchar(11)  
as
begin
insert into patient values (@patient_name,@patient_gender,@patient_DOB,@patient_email,@patient_address,@patient_contact)
end
                    
exec  Insertpatient	 @patient_name='Ali raza',@patient_gender='male',@patient_DOB= '2002-12-27',@patient_email = 'Ali@gmail.com',@patient_address ='johar town' ,@patient_contact='03332164492'
 exec  Insertpatient   @patient_name='Ahmed',@patient_gender='male',@patient_DOB= '2002-11-20',@patient_email = 'Ahmed@gmail.com',@patient_address ='new town' ,@patient_contact='03332168552'


------execution of the patient through procedure ----- 
create procedure Listpatient
as 
begin
select patient_id,patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact  from patient
end

exec Listpatient


-----Updation in patient -----
create procedure updatepatient
@patient_id int,
@patient_name varchar(100) ,
@patient_gender varchar(100),
@patient_DOB date ,
@patient_email varchar(100) ,
@patient_address varchar(100) ,
@patient_contact varchar(11)  
as
begin
update patient
set patient_name =  @patient_name,
patient_gender = @patient_gender ,
patient_DOB = @patient_DOB ,
patient_email = @patient_email ,
patient_address = @patient_address,
patient_contact =@patient_contact
where patient_id = @patient_id 
IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No rows were updated for patient with ID %d.', 16, 1, @patient_id);
    END
end

exec updatepatient 1 ,'usman' , 'male' , '2002-12-27' , 'usman@gmail.com' , 'etehad town' , '03313198649' 

exec Listpatient


-----Deletion in patient -----
create procedure Deletepatient
@patient_id int 
as
begin
delete patient where patient_id = @patient_id 
end

exec Deletepatient 2

exec Listpatient

