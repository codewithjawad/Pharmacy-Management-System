------creation of Table : Manufacturer ------  
create table manufacturer (
manufacturer_id int ,
manufacturer_name varchar(100) Not Null,
manufacturer_address varchar(100) Not Null ,
manufacturer_phone varchar(20) Not Null ,
manufacturer_email varchar(100) Not Null ,
constraint pk1_id primary key (manufacturer_id) )


------insertion in Manufacturer -------
create procedure InsertManufacturer 
@manufacturer_id int ,
@manufacturer_name varchar(100) ,
@manufacturer_address varchar(100) ,
@manufacturer_phone varchar(20)  ,
@manufacturer_email varchar(100) 
as
begin
insert into manufacturer (manufacturer_id , manufacturer_name , manufacturer_address ,manufacturer_phone , manufacturer_email )
values (@manufacturer_id , @manufacturer_name , @manufacturer_address , @manufacturer_phone , @manufacturer_email )
end

exec  InsertManufacturer 100 , 'Ali' , 'Gulshan-e-Iqbal' , '021-1234212' , 'Ali@gmail.com' 
exec  InsertManufacturer 104 , 'Ahmed' , 'Gulshan-e-Iqbal' , '021-1234202' , 'Ahmed@gmail.com' 

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
end

exec updateManufacturer 100 , 'Haris' ,'Gulshan-e-iqbal' , '2338383','Haris@gmail.com' 

exec ListManufacturer 


-----Deletion in Manufacturer-----
create procedure DeleteManufacturer 
@manufacturer_id int 
as
begin
delete manufacturer where manufacturer_id = @manufacturer_id 
end

exec DeleteManufacturer 104

exec ListManufacturer 

----Load Specific Record in Manufacturer-----
create procedure LoadManufacturer 
@manufacturer_id int 
as
begin
select manufacturer_name , manufacturer_address ,manufacturer_phone , manufacturer_email from manufacturer 
where manufacturer_id = @manufacturer_id 
end

exec LoadManufacturer 100

-----Updation in Manufacturer_Name-----
create procedure updateManufacturer_Name 
@manufacturer_id int ,
@manufacturer_name varchar(100) 
as
begin
update manufacturer 
set manufacturer_name = @manufacturer_name 
where manufacturer_id = @manufacturer_id 
end

exec updateManufacturer_Name 100 , 'ahmed'

exec ListManufacturer 

-----Updation in Manufacturer_address-----
create procedure updateManufacturer_address 
@manufacturer_id int ,
@manufacturer_address varchar(100) 
as
begin
update manufacturer 
set manufacturer_address = @manufacturer_address  
where manufacturer_id = @manufacturer_id 
end

exec updateManufacturer_address 100 , 'defence'

exec ListManufacturer 


-----Updation in Manufacturer_phone-----
create procedure updateManufacturer_phone 
@manufacturer_id int ,
@manufacturer_phone varchar(100) 
as
begin
update manufacturer 
set manufacturer_phone = @manufacturer_phone  
where manufacturer_id = @manufacturer_id 
end

exec updateManufacturer_phone 100 , '36363633'

exec ListManufacturer 

-----Updation in Manufacturer_email-----
create procedure updateManufacturer_email 
@manufacturer_id int ,
@manufacturer_email varchar(100) 
as
begin
update manufacturer 
set manufacturer_email = @manufacturer_email  
where manufacturer_id = @manufacturer_id 
end

exec updateManufacturer_email 100 , 'ahmed@yahoo.com'

exec ListManufacturer 





------insertion in Manufacturer -------
exec  InsertManufacturer 100 , 'Ali' , 'Gulshan-e-Iqbal' , '021-1234212' , 'Ali@gmail.com' 
exec  InsertManufacturer 101 , 'Ahmed' , 'Gulshan-e-Iqbal' , '021-1234202' , 'Ahmed@gmail.com' 
exec ListManufacturer 

-------execution of the Manufacture----- 
exec ListManufacturer 

-----Updation in Manufacturer-----
exec updateManufacturer 100 , 'ahmed' ,'Gulshan-e-iqbal' , '2338383','ahmed@gmail.com' 
exec ListManufacturer 

-----Deletion in Manufacturer-----
exec DeleteManufacturer 100
exec ListManufacturer 

----Load Specific Record in Manufacturer-----
exec LoadManufacturer 101

-----Updation in Manufacturer_Name-----
exec updateManufacturer_Name 101 , 'SAAD'
exec ListManufacturer 

-----Updation in Manufacturer_address-----
exec updateManufacturer_address 100 , 'defence'
exec ListManufacturer 

-----Updation in Manufacturer_phone-----
exec updateManufacturer_phone 100 , '36363633'
exec ListManufacturer 

-----Updation in Manufacturer_email-----
exec updateManufacturer_email 101 , 'ahmed@yahoo.com'
exec ListManufacturer 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : Employee ------
create table Employee (
emp_id int not Null identity primary key ,
emp_name varchar(100) Not Null,
emp_address varchar(100) Not Null,
emp_phone varchar(11) Not Null unique ,
emp_email varchar(100) Not Null ,
emp_DOB date Not Null ,
emp_DOJ date Not Null ,
emp_position varchar(100) Not Null ,
emp_salary int Not Null )


------insertion in employee -------
create procedure InsertEmployee 
--@emp_id int ,
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
insert into  Employee (emp_name,emp_address ,emp_phone,emp_email,emp_DOB , emp_DOJ ,emp_position,emp_salary )
values (@emp_name,@emp_address,@emp_phone,@emp_email,@emp_DOB, @emp_DOJ ,@emp_position,@emp_salary)
end

exec  InsertEmployee  'khushal' , 'Gulshan-e-Iqbal' , '02112348254' , 'khushal@gmail.com' , '2000/12/11' , '2021/12/23' ,'Sales_man', 20000
exec  InsertEmployee  'kulsoom' , 'landikotal' , '021127878642' , 'kulsoom@gmail.com' ,'2001/12/11' , '2022/12/23' ,'Sales-man', 22000

-------execution of the Employee----- 
create procedure ListEmployee
as 
begin
select emp_id,emp_name,emp_address ,emp_phone,emp_email,emp_position,emp_salary from Employee
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
end

exec updateEmployee 1, 'Ali' ,'Gulshan-e-iqbal' , '2338383','khushal@gmail.com','2001/12/11' , '2022/12/23' ,'head staff',35000
exec ListEmployee

-----Deletion in Employee-----
create procedure DeleteEmployee 
@Emp_id int 
as
begin
delete Employee where emp_id = @emp_id  
end

exec DeleteEmployee 4

exec ListEmployee

----Load Specific Record in Employee-----
create procedure LoadEmployee 
@emp_id int 
as
begin
select emp_name,emp_address ,emp_phone,emp_email,emp_position ,emp_DOB ,emp_DOJ,emp_salary from Employee 
where emp_id = @emp_id 
end

exec LoadEmployee 1

-----Updation in Emp_Name-----
create procedure updateEmp_Name 
@emp_id int ,
@emp_name varchar(100) 
as
begin
update Employee 
set emp_name = @emp_name 
where emp_id = @emp_id 
end

exec updateEmp_Name 1 , 'KHUSHAL KHAN'

exec ListEmployee

-----Updation in Employee_address-----
create procedure updateEmployee_address 
@emp_id int ,
@emp_address varchar(100) 
as
begin
update Employee 
set emp_address = @emp_address  
where emp_id = @emp_id 
end

exec updateEmployee_address 1 , 'defence'

exec ListEmployee

-----Updation in emp_phone-----
create procedure updateEmp_phone 
@emp_id int ,
@emp_phone varchar(100) 
as
begin
update Employee
set emp_phone = @emp_phone  
where emp_id = @emp_id 
end

exec updateEmp_phone 1 , '36336334401'

exec ListEmployee

-----Updation in EMP_email-----
create procedure updateEmp_position  
@emp_id int ,
@emp_position varchar(100) 
as
begin
update Employee
set emp_position  = @emp_position  
where emp_id = @emp_id 
end

exec updateEmp_position  1 , 'junior staff'

exec ListEmployee


-----Updation in EMP_email-----
create procedure updateEmp_email
@emp_id int ,
@emp_email varchar(100) 
as
begin
update Employee
set emp_email = @emp_email  
where emp_id = @emp_id 
end

exec updateEmp_email 1 , 'khushalkhan@yahoo.com'

exec ListEmployee


-----Updation in EMP_salary-----
create procedure updateEmp_salary
@emp_id int ,
@emp_salary int
as
begin
update Employee
set emp_salary = @emp_salary
where emp_id = @emp_id 
end

exec updateEmp_salary 1 , 30000

exec ListEmployee


-----Updation in emp_DOB -----
create procedure updateemp_DOB
@emp_id int ,
@emp_DOB date 
as
begin
update Employee
set emp_DOB = @emp_DOB 
where emp_id = @emp_id 
end

exec updateemp_DOB 1 , '2000/12/01'

exec ListEmployee

-----Updation in emp_DOj -----
create procedure updateemp_DOJ
@emp_id int ,
@emp_DOJ date 
as
begin
update Employee
set emp_DOJ = @emp_DOJ 
where emp_id = @emp_id 
end

exec updateemp_DOJ 1 , '2000/12/01'

exec ListEmployee




------insertion in employee -------
exec  InsertEmployee 100 , 'khushal' , 'Gulshan-e-Iqbal' , '02112342564' , 'khushal@gmail.com' ,'Sales man',20000
exec  InsertEmployee 100 , 'mirza' , 'Gulshan-e-Iqbal' , '02156375697' , 'mirza@gmail.com' ,'Sales man',20000
exec  InsertEmployee 101 , 'kulsoom' , 'landikotal' , '02112387642' , 'kulsoom@gmail.com' ,'Sales man',22000 
exec Listemployee

-------execution of the employee----- 
exec ListEmployee

-----Updation in employee-----
exec updateEmployee 100 , 'khushal' ,'Gulshan-e-iqbal' , '2338383','khushal@gmail.com','head staff',35000
exec ListEmployee

-----Deletion in employee-----
exec DeleteEmployee 4
exec ListEmployee

----Load Specific Record in employee-----
exec LoadEmployee 101

-----Updation in employee_Name-----
exec updateEmp_Name 1 , 'Junaid'
exec ListEmployee

-----Updation in employee_address-----
exec updateEmployee_address 100 , 'defence'
exec ListEmployee

-----Updation in employee_phone-----
exec updateEmp_phone 100 , '36363633441'
exec ListEmployee

-----Updation in employee_email-----
exec updateEmp_email 100 , 'khushalkhan@yahoo.com'
exec ListEmployee

-----Updation in employee_position-----
exec updateEmp_position  100 , 'junior staff'
exec ListEmployee

-----Updation in employee_salary-----
exec updateEmp_salary 100 , 30000
exec ListEmployee

-----Updation in emp_DOB -----
exec updateemp_DOB 1 , '2000/12/01'
exec ListEmployee

-----Updation in emp_DOj -----
exec updateemp_DOJ 1 , '2000/12/01'
exec ListEmployee


------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : Doctor ------
create table Doctor (
doctor_id int not Null identity primary key ,
doctor_name varchar(100) Not Null,
doctor_address varchar(100) Not Null,
doctor_phone varchar(11) Not Null unique ,
doctor_email varchar(100) Not Null ,
doctor_DOB date Not Null ,
doctor_DOJ date Not Null) 

------insertion in Doctor -------
create procedure InsertDoctor
@doctor_name varchar(100) ,
@doctor_address varchar(100) ,
@doctor_phone varchar(11)  ,
@doctor_email varchar(100) ,
@doctor_DOB date  ,
@doctor_DOJ date 
as
begin
insert into Doctor (doctor_name ,doctor_address , doctor_phone  ,doctor_email , doctor_DOB , doctor_DOJ )
values (@doctor_name ,@doctor_address , @doctor_phone  ,@doctor_email  ,@doctor_DOB ,@doctor_DOJ )
end

exec  InsertDoctor 'Ali' , 'Gulshan-e-Iqbal' , '0244534212' , 'Ali@gmail.com' , '2002/12/09' , '2022/1/12'  
exec  InsertDoctor 'Ahmed' , 'Gulshan-e-maymar' , '021123444' , 'Ahmed@gmail.com' , '2001/12/09' , '2023/1/12'  

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
end

exec updateDoctor 1 ,'saad' , 'Gulshan-e-Iqbal' , '0211234212' , 'Ali@gmail.com' , '2002/12/09' , '2022/1/12' 

exec ListDoctor 


-----Deletion in Doctor -----
create procedure DeleteDoctor
@doctor_id int 
as
begin
delete Doctor where doctor_id = @doctor_id 
end

exec DeleteDoctor 2

exec ListDoctor 

----Load Specific Record in Doctor -----
create procedure LoadDoctor 
@doctor_id int 
as
begin
select doctor_name ,doctor_address , doctor_phone  ,doctor_email , doctor_DOB , doctor_DOJ  from doctor
where  doctor_id= @doctor_id
end

exec LoadDoctor 2
exec Listdoctor 

-----Updation in Doctor_Name-----
create procedure updateDoctor_Name 
@doctor_id int ,
@doctor_name varchar(100) 
as
begin
update doctor
set doctor_name = @doctor_name 
where doctor_id = @doctor_id 
end

exec updatedoctor_Name 1 , 'ahmed'

exec Listdoctor 

-----Updation in doctor_address-----
create procedure updatedoctor_address 
@doctor_id int ,
@doctor_address varchar(100) 
as
begin
update doctor
set doctor_address = @doctor_address  
where doctor_id = @doctor_id 
end

exec updatedoctor_address 1 , 'defence'

exec Listdoctor


-----Updation in doctor_phone-----
create procedure updatedoctor_phone 
@doctor_id int ,
@doctor_phone varchar(100) 
as
begin
update doctor
set doctor_phone = @doctor_phone  
where doctor_id = @doctor_id 
end

exec updatedoctor_phone 1 , '36363633'

exec Listdoctor

-----Updation in doctor_email-----
create procedure updatedoctor_email 
@doctor_id int ,
@doctor_email varchar(100) 
as
begin
update doctor
set doctor_email = @doctor_email  
where doctor_id = @doctor_id 
end

exec updatedoctor_email 1 , 'ahmed@yahoo.com'

exec Listdoctor


-----Updation in doctor_DOB -----
create procedure updatedoctor_DOB
@doctor_id int ,
@doctor_DOB date 
as
begin
update doctor
set doctor_DOB = @doctor_DOB 
where doctor_id = @doctor_id 
end

exec updatedoctor_DOB 1 , '2000/12/01'

exec Listdoctor


-----Updation in doctor_DOJ-----
create procedure updatedoctor_DOJ
@doctor_id int ,
@doctor_DOJ date
as
begin
update doctor
set doctor_DOJ = @doctor_DOJ 
where doctor_id = @doctor_id 
end

exec updatedoctor_DOJ 1 , '2023/2/12'

exec Listdoctor


------insertion in Doctor -------
exec  InsertDoctor 'maaz' , 'Gulshan-e-Iqbal' , '0211243212' , 'Ali@gmail.com' , '2002/12/09' , '2022/1/12'  
exec  InsertDoctor 'fiza' , 'Gulshan-e-maymar' , '021123444' , 'Ahmed@gmail.com' , '2001/12/09' , '2023/1/12'  

------execution of the doctor----- 
exec ListDoctor


-----Updation in Doctor -----
exec updateDoctor 1 ,'saad' , 'Gulshan-e-Iqbal' , '0211234212' , 'Ali@gmail.com' , '2002/12/09' , '2022/1/12' 
exec ListDoctor 

-----Deletion in Doctor -----
exec DeleteDoctor 2

exec ListDoctor 

----Load Specific Record in Doctor -----
exec LoadDoctor 2
exec Listdoctor 

-----Updation in Doctor_Name-----
exec updatedoctor_Name 1 , 'ahmed'

exec Listdoctor 

-----Updation in doctor_address-----
exec updatedoctor_address 1 , 'defence'
exec Listdoctor


-----Updation in doctor_phone-----
exec updatedoctor_phone 1 , '36363633'
exec Listdoctor

-----Updation in doctor_email-----
exec updatedoctor_email 1 , 'ahmed@yahoo.com'

exec Listdoctor


-----Updation in doctor_DOB -----
exec updatedoctor_DOB 1 , '2000/12/01'
exec Listdoctor

-----Updation in doctor_DOJ-----
exec updatedoctor_DOJ 1 , '2023/2/12'
exec Listdoctor

------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : Speciality ------
create table Speciality (
Speciality_id int Not Null Identity Primary Key ,
Speciality_name varchar(100) Not Null,
Speciality_institute varchar(100) Not Null )

------insertion in Speciality -------
create procedure InsertSpeciality1
@Speciality_name varchar(100) ,
@Speciality_institute varchar(100) 
as
begin
insert into Speciality ( Speciality_name , Speciality_institute )
values (@Speciality_name , @Speciality_institute )
end


exec InsertSpeciality1 'Physiotherapy' ,'Liaquat' 
exec InsertSpeciality1 'd-pharmacy' ,'Agha khan' 


-------execution of the Speciality BY procedure----- 
create procedure ListSpeciality 
as 
begin
select Speciality_id , Speciality_name , Speciality_institute from Speciality
end

exec ListSpeciality 

-------execution of the Speciality BY VIEWS----- 
create view vu_Speciality
as
select Speciality_id , Speciality_name , Speciality_institute from Speciality

select * from vu_Speciality


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
end

exec updateSpeciality 1 , 'Pharmacy' ,'liaquat' 

exec Listspeciality 
select * from vu_Speciality


-----Deletion in speeciality-----
create procedure DeleteSpeciality1
@speciality_id int 
as
begin
delete speciality where speciality_id = @speciality_id 
end

exec DeleteSpeciality1 4

exec Listspeciality 
select * from vu_Speciality

----Load Specific Record in speciality -----
create procedure LoadSpeciality  
@speciality_id int 
as
begin
select speciality_id , speciality_name , speciality_institute  from speciality 
where speciality_id = @speciality_id 
end

exec Loadspeciality  2

exec Listspeciality 
select * from vu_Speciality

-----Updation in speciality_Name-----
create procedure updatespeciality_Name 
@speciality_id int ,
@speciality_name varchar(100) 
as
begin
update speciality 
set speciality_name = @speciality_name 
where speciality_id = @speciality_id 
end

exec updatespeciality_Name 2 , 'pharmacy'

exec Listspeciality 
select * from vu_Speciality


-----Updation in Speciality_institute-----
create procedure updatespeciality_Institute
@speciality_id int ,
@Speciality_institute varchar(100) 
as
begin
update Speciality
set Speciality_institute = @Speciality_institute
where speciality_id = @speciality_id 
end

exec updatespeciality_Institute 2 , 'agha_khan'

exec Listspeciality 
select * from vu_Speciality


------insertion in Speciality -------
exec InsertSpeciality1 'Physiotherapy' ,'Liaquat' 
exec InsertSpeciality1 'd-pharmacy' ,'Agha khan' 


-------execution of the Speciality BY procedure----- 
exec ListSpeciality 

-------execution of the Speciality BY VIEWS----- 
select * from vu_Speciality


-----Updation in Speciality-----
exec updateSpeciality 1 , 'Pharmacy' ,'liaquat' 

exec Listspeciality 
select * from vu_Speciality

-----Deletion in speeciality-----
exec DeleteSpeciality1 4

exec Listspeciality 
select * from vu_Speciality

----Load Specific Record in speciality -----
exec Loadspeciality  2

exec Listspeciality 
select * from vu_Speciality

-----Updation in speciality_Name-----
exec updatespeciality_Name 2 , 'pharmacy'

exec Listspeciality 
select * from vu_Speciality


-----Updation in Speciality_institute-----
exec updatespeciality_Institute 2 , 'agha_khan'

exec Listspeciality 
select * from vu_Speciality








-----------------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : Doc_Spec ------
create table Doc_Spec (
doctor_id int ,
speciality_id int ,
year int ,
constraint pk6_id primary key clustered (doctor_id , speciality_id ) ,
constraint fk5_id foreign key (doctor_id ) references Doctor (doctor_id) on delete cascade,
constraint fk4_id foreign key (speciality_id ) references speciality (Speciality_id) on delete cascade )


------insertion in Doc_Spec -------
create procedure InsertDoc_Spec1
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int 
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
insert into Doc_Spec (doctor_id , speciality_id , year)
values (@doctor_id , @speciality_id , @year )
end

exec InsertDoc_Spec1 'fiza','pharmacy',2012


-------execution of the DOC_spec BY procedure----- 
create procedure ListDoc_Spec
as 
begin
select Doctor_id , Speciality_id , year from doc_spec
end

exec ListDoc_Spec

-------execution of the DOC_spec BY VIEWS----- 
create view vu_DocSpec
as
select doctor_id , Speciality_id , year from doc_spec

select * from vu_DocSpec


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


-----Deletion in Doc_Spec-----
create procedure DeleteDoc_Spec3
@doctor_name varchar(100) ,
@speciality_name varchar(100) ,
@year int
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
delete from  doc_spec 
where @speciality_id = speciality_id  and @doctor_id = doctor_id
end

exec DeleteDoc_Spec3 'fiza','D-pharmacy',2012

----Load Specific Record  -----
create procedure LoadDoc_Spec  
@doctor_name varchar(100) ,
@speciality_name varchar(100) 
as
begin
declare @doctor_id int 
declare @speciality_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @speciality_id = speciality_id from speciality where @speciality_name = speciality_name
select doctor_id , speciality_id , year  from doc_spec
where speciality_id = @speciality_id and doctor_id = @doctor_id
end

exec LoadDoc_Spec 'fiza' , 'D-pharmacy'

----Load Specific Record by year  -----
create procedure LoadDoc_Spec_year 
@year int
as
begin

select doctor_id , speciality_id , year  from doc_spec
where year = @year
end

exec LoadDoc_Spec_year 2023

------insertion in Doc_Spec -------
exec InsertDoc_Spec1 'Maaz','Pharmacy',2012

exec ListDoctor
exec ListSpeciality
exec ListDoc_Spec
select * from vu_DocSpec


-------execution of the DOC_spec BY procedure----- 
exec ListDoc_Spec

-------execution of the DOC_spec BY VIEWS----- 
select * from vu_DocSpec

-----Updation in Doc_SpecYear-----
exec updateDoc_Spec_year 'fiza','pharmacy',2023 

select * from vu_DocSpec
exec ListDoc_Spec

-----Updation in Doc_Spec_Doctor-----
exec updateDoc_Spec_Doctor2 'saad','pharmacy',2012

select * from vu_DocSpec
exec ListDoc_Spec

-----Updation in Doc_Spec_Speciality-----
exec updateDoc_Spec_Speciality 'saad','D-pharmacy',2021

select * from vu_DocSpec
exec ListDoc_Spec


-----Deletion in Doc_Spec-----
exec DeleteDoc_Spec3 'fiza','D-pharmacy',2012

----Load Specific Record  -----
exec LoadDoc_Spec 'fiza' , 'D-pharmacy'

exec ListDoc_Spec
select * from vu_DocSpec

----Load Specific Record by year  -----
exec LoadDoc_Spec_year 2012

exec ListDoc_Spec
select * from vu_DocSpec


select * from doctor
select * from Speciality

select * from doc_spec



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------creation OF Table : Medicine------------
create table medicine4 (
medicine_id int ,
Medicine_name varchar(100) Not Null ,
medicine_price int Not Null ,
medicine_MFG varchar(100) Not Null ,
medicine_Expiry varchar(100) Not Null ,
potency varchar(20) ,
manufacturer_id int not null ,
constraint p_med5 primary key (medicine_id ),
constraint f_manu1 foreign key (manufacturer_id) references manufacturer (manufacturer_id) on delete cascade )

select * from medicine4

------insertion in Medicine -------
create procedure InsertMedicine1
@medicine_id int ,
@Medicine_name varchar(100)  ,
@medicine_price int ,
@medicine_MFG varchar(100)  ,
@medicine_Expiry varchar(100)  ,
@potency varchar(20) ,
@manufacturer_name varchar(100) 
as
begin
declare @manufacturer_id int 
select @manufacturer_id = manufacturer_id from manufacturer where @manufacturer_name = manufacturer_name
insert into medicine4 (medicine_id , medicine_name , medicine_price , medicine_MFG  , medicine_Expiry , potency ,manufacturer_id)
values (@medicine_id , @medicine_name , @medicine_price , @medicine_MFG  , @medicine_Expiry , @potency , @manufacturer_id )
end

exec  InsertMedicine1 109,'bluedol',100,'2019/12/20','2023-o6-12','10mg','Haris'
exec ListMedicine1
select * from vu_medicines1


-------execution of the Medicine by procedure-------
create procedure ListMedicine1
as 
begin
select * from medicine4
end

exec ListMedicine1

-------execution of the Medicines BY VIEWS----- 
create view vu_Medicines1
as
select  *  from medicine4

select * from vu_medicines1


-----Updation in Medicine-----
create procedure updateMedicine2
@medicine_id int ,
@Medicine_name varchar(100)  ,
@medicine_price int ,
@medicine_MFG varchar(100)  ,
@medicine_Expiry varchar(100)  ,
@potency varchar(20) ,
@manufacturer_name varchar(100) 
as
begin
declare @manufacturer_id int 
select @manufacturer_id = manufacturer_id from manufacturer where @manufacturer_name = manufacturer_name

update Medicine4 
set medicine_name = @medicine_name ,
medicine_price = @medicine_price ,
 medicine_MFG = @medicine_MFG,
medicine_Expiry = @medicine_Expiry,
manufacturer_id = @manufacturer_id
where medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine2 109,'brufen',200,'2020/12/12','2023/5/20','10mg','Haris'

exec ListMedicine1
select * from vu_medicines1


----Load Specific Record in Medicine -----
create procedure LoadMedicine2
@Medicine_id int ,
@potency varchar(20)
as
begin
select medicine_id , medicine_name , medicine_price , medicine_MFG  , medicine_Expiry  ,potency ,manufacturer_id from medicine4
where  medicine_id = @medicine_id and potency =@potency
end

exec LoadMedicine2 100,'10mg'

exec ListMedicine1
select * from vu_medicines1

-----Updation in Medicine_Name-----
create procedure updateMedicine_Name1
@Medicine_id int ,
@potency varchar(20),
@medicine_name varchar(100)
as
begin
update medicine4
set  medicine_name = @medicine_name
where  medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine_Name1 100,'10mg','panadol'

exec ListMedicine1
select * from vu_medicines1


-----Updation in Medicine_MFG-----
create procedure updateMedicine_MFG1
@Medicine_id int ,
@potency varchar(20),
@medicine_MFG varchar(100)
as
begin
update medicine4
set  medicine_MFG = @medicine_MFG
where  medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine_MFG1 100,'10mg','2022/12/13'

exec ListMedicine1
select * from vu_medicines1


-----Updation in Medicine_Expiry-----
create procedure updateMedicine_Expiry1
@Medicine_id int ,
@potency varchar(20),
@medicine_Expiry varchar(100)
as
begin
update medicine4
set  medicine_Expiry = @medicine_Expiry
where  medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine_Expiry1 100,'10mg','2023/12/31'

exec ListMedicine
select * from vu_medicines

-----Updation in Medicine_price-----
create procedure updateMedicine_price1
@Medicine_id int ,
@potency varchar(20),
@medicine_price int 
as
begin
update medicine4
set  medicine_price = @medicine_price
where  medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine_price1 100,'10mg',1000

exec ListMedicine1
select * from vu_medicines1

-----Updation in Medicine_Expiry-----
create procedure updateMedicine_ManuName1 
@Medicine_id int ,
@potency varchar(20),
@manufacturer_name varchar(100)
as
begin
declare @manufacturer_id int 
select @manufacturer_id = manufacturer_id from manufacturer where @manufacturer_name = manufacturer_name

update medicine4
set  manufacturer_id = @manufacturer_id
where  medicine_id = @medicine_id and potency =@potency
end

exec updateMedicine_Name 100,'10mg','Ahmed'

exec ListMedicine1
select * from vu_medicines1

-----Deletion in Medicine-----
create procedure DeleteMedicine1
@Medicine_id int ,
@potency varchar(20)
as
begin
delete medicine4 where medicine_id = @medicine_id and potency =@potency
end

exec DeleteMedicine 100 , '10mg'

exec ListMedicine1
select * from vu_medicines1



------insertion in Medicine -------
exec  InsertMedicine1 102,'brufen',100,'2019/12/20','2023/12/30','20mg','Ahmed'

exec ListMedicine1
select * from vu_medicines1


-------execution of the Medicine by procedure-------
exec ListMedicine1

-------execution of the Medicines BY VIEWS----- 
select * from vu_medicines1


-----Updation in Medicine-----
exec updateMedicine2 102,'brufen',200,'2020/12/12','2023/6/20','20mg','SAAD'

select * from medicine4
select * from manufacturer
exec ListMedicine1
select * from vu_medicines1

----Load Specific Record in Medicine -----
exec LoadMedicine2 100,'10mg'

exec ListMedicine
select * from vu_medicines1

-----Updation in Medicine_Name-----
exec updateMedicine_Name1 100,'10mg','panadol'

exec ListMedicine1
select * from vu_medicines1


-----Updation in Medicine_MFG-----
exec updateMedicine_MFG1 100,'10mg','2022/12/13'

exec ListMedicine1
select * from vu_medicines1


-----Updation in Medicine_Expiry-----
exec updateMedicine_Expiry1 100,'10mg','2023/12/31'

exec ListMedicine1
select * from vu_medicines1

-----Updation in Medicine_price-----
exec updateMedicine_price1 100,'10mg',1000

exec ListMedicine1
select * from vu_medicines1

-----Updation in Medicine_Manufacture-----
exec updateMedicine_ManuName1 100,'10mg','Ahmed'

exec ListMedicine1
select * from vu_medicines1

-----Deletion in Medicine-----
exec DeleteMedicine1 100 , '10mg'

exec ListMedicine1
select * from vu_medicines1



--------------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : patient ------
create table Patient (
patient_id int not Null identity primary key ,
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
insert into patient( patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact)
values (@patient_name,@patient_gender,@patient_DOB,@patient_email,@patient_address,@patient_contact )
end

exec  Insertpatient'Ali raza' , 'male' , '2002-12-27' , 'Ali@gmail.com' , 'bisma town' , '03332164492'
exec  Insertpatient'Ahmed' , 'male' , '2002-11-20' , 'Ahmed@gmail.com' , 'muka chowk' , '03316734986'

exec Listpatient
select * from vu_Listpatient

------execution of the patient through procedure ----- 
create procedure Listpatient
as 
begin
select patient_id,patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact  from patient
end

exec Listpatient

------execution of the patient through views ----- 
create view vu_Listpatient
as 
select patient_id,patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact  from patient

select * from vu_Listpatient


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
end

exec updatepatient 1 ,'khusama' , 'male' , '2002-12-27' , 'khusama@gmail.com' , 'bisma town' , '03313198649' 

exec Listpatient
select * from vu_Listpatient


-----Deletion in patient -----
create procedure Deletepatient
@patient_id int 
as
begin
delete patient where patient_id = @patient_id 
end

exec Deletepatient 2

exec Listpatient
select * from vu_Listpatient

----Load Specific Record in patient -----
create procedure Loadpatient 
@patient_id int 
as
begin
select patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact  from patient
where  patient_id= @patient_id
end

exec Loadpatient 1

exec Listpatient 
select * from vu_Listpatient

-----Updation in patient_Name-----
create procedure updatepatient_Name 
@patient_id int ,
@patient_name varchar(100) 
as
begin
update patient
set patient_name = @patient_name 
where patient_id = @patient_id 
end

exec updatepatient_Name 1 , 'khusama khan'

exec Listpatient 
select * from vu_Listpatient

-----Updation in patient_address-----
create procedure updatepatient_address 
@patient_id int ,
@patient_address varchar(100) 
as
begin
update patient
set patient_address = @patient_address  
where patient_id = @patient_id 
end

exec updatepatient_address 1 , 'defence'

exec Listpatient
select * from vu_Listpatient


-----Updation in patient_contact-----
create procedure updatepatient_contact 
@patient_id int ,
@patient_contact varchar(100) 
as
begin
update patient
set patient_contact = @patient_contact  
where patient_id = @patient_id 
end

exec updatepatient_contact 1 , '36363633'

exec Listpatient
select * from vu_Listpatient

-----Updation in patient_email-----
create procedure updatepatient_email 
@patient_id int ,
@patient_email varchar(100) 
as
begin
update patient
set patient_email = @patient_email  
where patient_id = @patient_id 
end

exec updatepatient_email 1 , 'khusamakhan@yahoo.com'

exec Listpatient
select * from vu_Listpatient


-----Updation in patient_DOB -----
create procedure updatepatient_DOB
@patient_id int ,
@patient_DOB date 
as
begin
update patient
set patient_DOB = @patient_DOB 
where patient_id = @patient_id 
end

exec updatepatient_DOB 1 , '2000/12/01'

exec Listpatient
select * from vu_Listpatient


-----Updation in patient_gender-----
create procedure updatepatient_gender
@patient_id int ,
@patient_gender varchar(100)
as
begin
update patient
set patient_gender = @patient_gender
where patient_id = @patient_id 
end

exec updatepatient_gender 1 , 'Male'

exec Listpatient
select * from vu_Listpatient


------insertion in patient -------
exec  Insertpatient'Ali' , 'male' , '2002-12-27' , 'Ali@gmail.com' , 'bisma town' , '03313198649'
exec  Insertpatient'Ahmed' , 'male' , '2002-11-20' , 'Ahmed@gmail.com' , 'muka chowk' , '03316734986'

------execution of the patient through procedures----- 
exec Listpatient


------execution of the patient through views----- 
select * from vu_listpatient

-----Updation in patient -----
exec updatepatient 1 ,'khusama' , 'male' , '2002-12-27' , 'khusama@gmail.com' , 'bisma town' , '03313198649' 
exec Listpatient
select * from vu_listpatient

-----Deletion in patient -----
exec Deletepatient 2

exec Listpatient 
select * from vu_listpatient

----Load Specific Record in patient-----
exec Loadpatient 1

exec Listpatient
select * from vu_listpatient

-----Updation in patient_name-----
exec updatepatient_Name 1 , 'ahmed'

exec Listpatient
select * from vu_listpatient

-----Updation in patient_address-----
exec updatepatient_address 1 , 'defence'

exec Listpatient
select * from vu_listpatient


-----Updation in patient_phone-----
exec updatepatient_contact 1 , '36363633'

exec Listpatient
select * from vu_listpatient

-----Updation in patient_email-----
exec updatepatient_email 1 , 'ahmed@yahoo.com'

exec Listpatient
select * from vu_listpatient

-----Updation in patient_DOB -----
exec updatepatient_DOB 1 , '2000/12/01'

exec Listpatient
select * from vu_listpatient

-----Updation in patient_gender-----
exec updatepatient_gender 1 , 'Male'

exec Listpatient
select * from vu_listpatient


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Appointment (
patient_id int ,
doctor_id int ,
appointment_date varchar(20) ,
appointment_time varchar(20) unique ,
appointment_reason varchar(100) 
constraint pk1_ids primary key clustered (doctor_id , patient_id ) ,
constraint fk1_ids foreign key (doctor_id) references doctor (doctor_id) on delete cascade ,
constraint fk2_ids foreign key (patient_id) references patient (patient_id) on delete cascade )

------insertion in Appointment -------
create procedure InsertAppointment2
@doctor_name varchar(100) ,
@patient_name varchar(100) ,
@appointment_date varchar(20) ,
@appointment_time varchar(20) ,
@appointment_reason varchar(100) 
as
begin
declare @doctor_id int 
declare @patient_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @patient_id = patient_id from patient where @patient_name = patient_name
insert into Appointment (patient_id, doctor_id , appointment_date , appointment_time , appointment_reason )
values (@patient_id , @doctor_id ,  @appointment_date , @appointment_time , @appointment_reason )
end

exec InsertAppointment2 'maaz','Ahmed','2023/6/20','12am','stomachache'

select * from vu_Appointment
exec ListAppointment2


-------execution of the Appointment BY procedure----- 
create procedure ListAppointment2
as 
begin
select doctor_id ,patient_id , appointment_date , appointment_time , appointment_reason from Appointment
end

exec ListAppointment2

-------execution of the Appointment BY VIEWS----- 
create view vu_Appointment
as
select doctor_id ,patient_id , appointment_date , appointment_time , appointment_reason from Appointment

select * from vu_Appointment

-----Updation in Appointment-----
create procedure updateAppointment
@doctor_name varchar(100) ,
@patient_name varchar(100) ,
@appointment_date varchar(20) ,
@appointment_time varchar(20) ,
@appointment_reason varchar(100) 
as
begin
declare @doctor_id int 
declare @patient_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @patient_id = patient_id from patient where @patient_name = patient_name
update Appointment
set appointment_date = @appointment_date ,
appointment_time = @appointment_time ,
appointment_reason = @appointment_reason 
where doctor_id = @doctor_id and patient_id = @patient_id
end

exec updateAppointment 'fiza' ,'Ali' ,'2023/12/4' ,'12pm','stomacheache'
select * from doctor
select * from patient

select * from vu_Appointment


-----Deletion in Appointment -----
create procedure DeleteAppointment
@doctor_name varchar(100) ,
@patient_name varchar(100) 
as
begin
declare @doctor_id int 
declare @patient_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @patient_id = patient_id from patient where @patient_name = patient_name

delete from  Appointment
where doctor_id = @doctor_id and patient_id = @patient_id
end

exec DeleteAppointment 'fiza','Ali'
select * from appointment



------insertion in Appointment -------
exec InsertAppointment2 'Maaz','Khusama','2023/6/20','1am','headache'

select * from vu_Appointment
exec ListAppointment2

-----Deletion in Appointment -----
exec DeleteAppointment 'fiza','Ali'

select * from vu_Appointment
exec ListAppointment2


-----Updation in Appointment-----
exec updateAppointment 'fiza' ,'Ali' ,'2023/12/5' ,'12pm','stomacheache'

select * from vu_Appointment

-------execution of the Appointment BY procedure----- 
exec ListAppointment2

-------execution of the DOC_spec BY VIEWS----- 
select * from vu_Appointment



---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----creation of table : Prescription------
create table Prescription2 (
medicine_id int ,
potency varchar(20) ,
patient_id int,
doctor_id int ,
when_to_take varchar(100) Not Null ,
amount int  Not Null ,
special_insrtruction varchar(100)  Not Null ,
duration varchar(100)  Not Null ,
constraint p_prec1 primary key ( medicine_id, patient_id , doctor_id ) ,
constraint fk_med1 foreign key (medicine_id) references medicine4 (medicine_id) on delete cascade ,
constraint fk_doc1 foreign key (doctor_id) references doctor (doctor_id) on delete cascade ,
constraint fk_pat1 foreign key (patient_id) references patient (patient_id) on delete cascade  )


------insertion in Prescription -------
create procedure InsertPrescription1
@medicine_name varchar(100) ,
@patient_name varchar(100) ,
@doctor_name varchar(100) ,
@potency varchar(20) ,
@when_to_take varchar(100) ,
@amount int ,
@special_insrtruction varchar(100)  ,
@duration varchar(100)  
as
begin
declare @medicine_id int 
declare @doctor_id int 
declare @patient_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @patient_id = patient_id from patient where  @patient_name =  patient_name 
select @doctor_id = doctor_id from doctor where @doctor_name = doctor_name
insert into Prescription2 (medicine_id  , potency, patient_id , doctor_id  , when_to_take  ,amount , special_insrtruction , duration)
values (@medicine_id  , @potency, @patient_id , @doctor_id  , @when_to_take  , @amount , @special_insrtruction , @duration)
end

exec  InsertPrescription1 'brufen','Ali','fiza','20mg','morning', 2 , 'rest well' ,'2 days'

exec ListPrescription2
select * from vu_prescription

-------execution of the prescription by procedure-------
create procedure ListPrescription2
as 
begin
select medicine_id  , potency, patient_id , doctor_id  , when_to_take  ,amount , special_insrtruction , duration from prescription2
end

exec ListPrescription2

-------execution of the prescription BY VIEWS----- 
create view vu_prescription
as
select medicine_id  , potency, patient_id , doctor_id  , when_to_take  ,amount , special_insrtruction , duration from prescription2
select * from vu_prescription


-----Updation in prescription-----
create procedure updatePrescription
@medicine_name varchar(100) ,
@patient_name varchar(100) ,
@doctor_name varchar(100) ,
@potency varchar(20) ,
@when_to_take varchar(100) ,
@amount int ,
@special_insrtruction varchar(100)  ,
@duration varchar(100)  
as
begin
declare @medicine_id int 
declare @doctor_id int 
declare @patient_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @patient_id = patient_id from patient where  @patient_name =  patient_name 
select @doctor_id = doctor_id from doctor where @doctor_name = doctor_name

update Prescription2 
set potency = @potency ,
when_to_take = when_to_take ,
amount = @amount ,
special_insrtruction = @special_insrtruction ,
duration = @duration
where medicine_id = @medicine_id and doctor_id = @doctor_id and patient_id = @patient_id 
end

exec updatePrescription  'panadol','Ali','Maaz','150mg','morning', 2 , 'rest well' ,'2 days'

exec ListPrescription2
select * from vu_prescription

----Load Specific Record in prescriptiom -----
create procedure Loadpresccription
@medicine_name varchar(100) ,
@patient_name varchar(100) ,
@doctor_name varchar(100)  
as
begin
declare @medicine_id int 
declare @doctor_id int 
declare @patient_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @patient_id = patient_id from patient where  @patient_name =  patient_name 
select @doctor_id = doctor_id from doctor where @doctor_name = doctor_name

select medicine_id  , potency, patient_id , doctor_id  , when_to_take  ,amount , special_insrtruction , duration from prescription2
where medicine_id = @medicine_id and doctor_id = @doctor_id and patient_id = @patient_id 
end

exec Loadpresccription 'panadol','Ali','Maaz'

exec ListPrescription2
select * from vu_prescription


-----Deletion in Prescription -----
create procedure DeletePrescription1
@doctor_name varchar(100) ,
@patient_name varchar(100) ,
@medicine_name varchar(100),
@potency varchar(20) 
as
begin
declare @doctor_id int 
declare @patient_id int 
declare @medicine_id int 
select @doctor_id = doctor_id from Doctor where @doctor_name = doctor_name 
select @patient_id = patient_id from patient where @patient_name = patient_name
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 

delete from  prescription2
where medicine_id = @medicine_id and doctor_id = @doctor_id and patient_id = @patient_id  and potency = @potency 
end

exec DeletePrescription1 'Maaz','Ali','panadol','10mg'

exec ListPrescription2
select * from vu_prescription


-----Updation in Prescription_Potency-----
create procedure updatePrescription_potency
@medicine_name varchar(100) ,
@patient_name varchar(100) ,
@doctor_name varchar(100) ,
@potency varchar(20) 
as
begin
declare @medicine_id int 
declare @doctor_id int 
declare @patient_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @patient_id = patient_id from patient where  @patient_name =  patient_name 
select @doctor_id = doctor_id from doctor where @doctor_name = doctor_name

update Prescription2 
set potency = @potency 
where medicine_id = @medicine_id and doctor_id = @doctor_id and patient_id = @patient_id 
end

exec updatePrescription_potency 'panadol','Ali','fiza','12mg'
exec ListPrescription2
select * from vu_prescription


-----Updation in Prescription_wth-----
create procedure updatePrescription_wth
@medicine_name varchar(100) ,
@patient_name varchar(100) ,
@doctor_name varchar(100) ,
@potency varchar(20) ,
@when_to_take varchar(100)
as
begin
declare @medicine_id int 
declare @doctor_id int 
declare @patient_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @patient_id = patient_id from patient where  @patient_name =  patient_name 
select @doctor_id = doctor_id from doctor where @doctor_name = doctor_name

update Prescription2 
set when_to_take = @when_to_take
where medicine_id = @medicine_id and doctor_id = @doctor_id and patient_id = @patient_id and potency = @potency 
end

exec updatePrescription_wth 'panadol','Ali','fiza','12mg','night'
exec ListPrescription2
select * from vu_prescription



------insertion in Prescription -------
exec  InsertPrescription1 'brufen','Ali','fiza','20mg','morning', 2 , 'rest well' ,'2 days'

exec ListPrescription2
select * from vu_prescription

-------execution of the prescription by procedure-------
exec ListPrescription2

-------execution of the prescription BY VIEWS----- 
select * from vu_prescription


-----Updation in prescription-----
exec updatePrescription  'panadol','Ali','Maaz','150mg','morning', 2 , 'rest well' ,'2 days'

exec ListPrescription2
select * from vu_prescription

----Load Specific Record in prescriptiom -----
exec Loadpresccription 'panadol','Ali','Maaz'

exec ListPrescription2
select * from vu_prescription


-----Deletion in Prescription -----
exec DeletePrescription1 'Maaz','Ali','panadol','10mg'

exec ListPrescription2
select * from vu_prescription


-----Updation in Prescription_Potency-----
exec updatePrescription_potency 'panadol','Ali','fiza','12mg'
exec ListPrescription2
select * from vu_prescription


-----Updation in Prescription_wth-----
exec updatePrescription_wth 'panadol','Ali','fiza','12mg','night'
exec ListPrescription2
select * from vu_prescription


----------------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of Table : Supplier ------
create table Supplier (
Supplier_id int Not Null identity primary key ,
Supplier_name varchar(100) Not Null,
Supplier_address varchar(100) Not Null ,
Supplier_phone varchar(11) Not Null unique ,
Supplier_email varchar(100) Not Null  )


------insertion in Supploer -------
create procedure InsertSupplier
@Supplier_name varchar(100) ,
@Supplier_address varchar(100) ,
@Supplier_phone varchar(11)  ,
@Supplier_email varchar(100) 
as
begin
insert into Supplier (Supplier_name , Supplier_address ,Supplier_phone , Supplier_email )
values (@Supplier_name , @Supplier_address , @Supplier_phone , @Supplier_email )
end

exec  InsertSupplier  'Saad' , 'Gulshan-e-Iqbal' , '021-1234212' , 'saad@gmail.com' 
exec  InsertSupplier 'azaan' , 'Gulshan-e-Iqbal' , '021-1234202' , 'Azaan@gmail.com' 

-------execution of the Supplier theough procedures ----- 
create procedure ListSupplier 
as 
begin
select Supplier_id , Supplier_name , Supplier_address ,Supplier_phone , Supplier_email from Supplier
end

exec ListSupplier

-------execution of the Supplier theough views ----- 
create view vu_ListSupplier 
as 
select Supplier_id , Supplier_name , Supplier_address ,Supplier_phone , Supplier_email from Supplier


select * from vu_listSupplier


-----Updation in Suppplier-----
create procedure updateSuppplier
@Supplier_name varchar(100) ,
@Supplier_address varchar(100) ,
@Supplier_phone varchar(11)  ,
@Supplier_email varchar(100) 
as
begin
declare @Supplier_id int 
select @Supplier_id = Supplier_id from supplier where @Supplier_name = Supplier_name

update Suppplier 
set Suppplier_name = @Supplier_name,
Suppplier_address = @Supplier_address ,
Suppplier_phone =@Supplier_phone ,
Suppplier_email = @Supplier_email 
where Suppplier_id = @Supplier_id 
end

exec updateSuppplier 'saad' ,'Gulshan-e-iqbal' , '2338383','ahmed@gmail.com' 

exec ListSupplier 


-----Deletion in Supplier-----
create procedure DeleteSupplier 
@Supplier_name varchar(100)  
as
begin
declare @Supplier_id int 
select @Supplier_id = Supplier_id from supplier where @Supplier_name = Supplier_name
delete Supplier where Supplier_id = @Supplier_id 
end

exec DeleteSupplier 'Saad'

exec ListSupplier

----Load Specific Record in Supplier-----
create procedure LoadSupplier
@Supplier_name varchar(100)  
as
begin
declare @Supplier_id int 
select @Supplier_id = Supplier_id from supplier where @Supplier_name = Supplier_name
select supplier_name , supplier_address ,supplier_phone , supplier_email from supplier 
where Supplier_id = @Supplier_id
end

exec LoadSupplier 'Azaan'

-----Updation in Supplier_Name-----
create procedure updateSupplier_Name 
@Supplier_id int ,
@Supplier_name varchar(100) 
as
begin
update  supplier
set  supplier_name = @supplier_name 
where  supplier_id = @supplier_id 
end

exec updatesupplier_Name 2,'Fiza'

exec Listsupplier 

-----Updation in supplier_address-----
create procedure updatesupplier_address 
@supplier_id int ,
@supplier_address varchar(100) 
as
begin
update supplier  
set supplier_address = @supplier_address  
where supplier_id = @supplier_id 
end

exec updatesupplier_address 1 , 'defence'

exec Listsupplier 


-----Updation in supplier_phone-----
create procedure updatesupplier_phone 
@supplier_id int ,
@supplier_phone varchar(100) 
as
begin
update supplier
set supplier_phone = @supplier_phone  
where supplier_id = @supplier_id 
end

exec updatesupplier_phone 1 , '36363633'

exec Listsupplier

-----Updation in supplier_email-----
create procedure updatesupplier_email 
@supplier_id int ,
@supplier_email varchar(100) 
as
begin
update supplier
set supplier_email = @supplier_email  
where supplier_id = @supplier_id 
end

exec updatesupplier_email 1, 'ahmed@yahoo.com'

exec Listsupplier


------insertion in supplier -------
exec  InsertSupplier  'Asad' , 'Gulshan-e-Iqbal' , '0211233312' , 'Ali@gmail.com' 
exec  InsertSupplier 'arooba' , 'Gulshan-e-Iqbal' , '0211234202' , 'Ahmed@gmail.com' 

-------execution of the Supplier theough procedures ----- 
exec ListSupplier

-------execution of the Supplier theough views ----- 
select * from vu_listSupplier

-----Updation in Suppplier-----
exec updateSuppplier 'ahmed' ,'Gulshan-e-iqbal' , '2338383','ahmed@gmail.com' 

-----Deletion in Supplier-----
exec DeleteSupplier 'Asad'

----Load Specific Record in Supplier-----
exec LoadSupplier 'Arooba'

-----Updation in Supplier_Name-----
exec updatesupplier_Name 2 , 'ahmed'

-----Updation in supplier_address-----
exec updatesupplier_address 2 , 'defence'

-----Updation in supplier_phone-----
exec updatesupplier_phone 100 , '3636363873'

-----Updation in supplier_email-----
exec updatesupplier_email 2 , 'ahmed@yahoo.com'


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------creation of table : Stock---------
create table stock (
stock_id int ,
stock_name varchar(100) Not Null ,
expiry date Not Null ,
quantity int Not Null ,
rate int Not Null ,
medicine_id int Not Null ,
supplier_id int Not Null ,
constraint pri_id primary key (stock_id),
constraint fk_med3 foreign key (medicine_id) references medicine4 (medicine_id) on delete cascade ,
constraint fk_supp1 foreign key (supplier_id) references supplier(supplier_id) on delete cascade  )

------insertion in Stock -------
create procedure InsertStock
@stock_id int ,
@stock_name varchar(100) ,
@medicine_name varchar(100) ,
@Supplier_Name varchar(100) ,
@expiry date ,
@quantity int ,
@rate int  
as
begin
declare @medicine_id int 
declare @supplier_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @supplier_id = supplier_id from supplier where @supplier_name = supplier_name
insert into stock (stock_id ,stock_name ,expiry,quantity,rate,medicine_id , supplier_id  )
values ( @stock_id , @stock_name , @expiry, @quantity, @rate, @medicine_id , @supplier_id )
end

exec Insertstock 103,'bluedol','panadol','saad','2023-1-12' , 50 , 20 

select * from stock


-------execution of the stock theough procedures ----- 
create procedure ListStock
as 
begin
select stock_id ,stock_name ,expiry  ,quantity  ,rate ,medicine_id  ,supplier_id   from stock
end

exec Liststock

-------execution of the stock theough views ----- 
create view vu_Liststock
as 
select stock_id ,stock_name ,expiry  ,quantity  ,rate ,medicine_id  ,supplier_id from stock


select * from vu_Liststock


-----Updation in Suppplier-----
create procedure updateStock
@stock_id int ,
@stock_name varchar(100) ,
@medicine_name varchar(100) ,
@Supplier_Name varchar(100) ,
@expiry date ,
@quantity int ,
@rate int  
as
begin
declare @medicine_id int 
declare @supplier_id int 
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @supplier_id = supplier_id from supplier where @supplier_name = supplier_name

update stock
set stock_name = @stock_name ,
medicine_id = @medicine_id,
supplier_id = @supplier_id,
 expiry = @expiry,
 quantity = @quantity,
 rate = @rate
 where stock_id = @stock_id

end
  select * from supplier
exec updateStock 100,'brufen','brufen','saad','2023-12-1',100,200

exec ListStock


-----Deletion in Supplier-----
create procedure DeleteStock
@stock_id int  ,
 @stock_name varchar(100)
as 
begin 
delete from stock where stock_id = @stock_id and  stock_name =  @stock_name
end

exec DeleteStock 100,'brufen'

exec ListStock

----Load Specific Record in Supplier-----
create procedure LoadStock
 @stock_name varchar(100) ,
 @stock_id int
 as 
 begin
 select stock_id ,stock_name ,expiry  ,quantity  ,rate ,medicine_id  ,supplier_id from stock
 where stock_name = @stock_name and stock_id = @stock_id
end

exec LoadStock 'brufen',100


exec ListStock


------insertion in Stock -------
exec Insertstock 109,'panadol','panadol','saad','2023-1-12' , 50 , 20 

-------execution of the stock theough procedures ----- 
exec Liststock

-------execution of the stock theough views ----- 
select * from vu_Liststock

-----Updation in stock-----
exec updateStock 100,'brufen','brufen','saad','2023-12-1',100,200


-----Deletion in  Stock----------
exec DeleteStock 100,'brufen'

----Load Specific Record in stock-----
exec LoadStock 'brufen',100


---------------------------------------------------------------------------------------------------

--------creation of table : Bill------
create TABLE Bill (
  BillID INT  identity ,
  order_id INT,
   patient_id INT,
  Date DATE,
  TotalAmount int ,
  PaymentMethod VARCHAR(50)
  constraint bo_pk primary key(BillID,order_id)

 
);

-------Insertion in Bill--------

CREATE FUNCTION dbo.GeneratetBill(@order_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
oi.order_id,
        m.medicine_name,
        oi.quantity,
        m.medicine_price,
        oi.quantity * m.medicine_price AS Total
    FROM OrderItems oi
    JOIN medicine4 m ON oi.medicine_id = m.medicine_id
    WHERE oi.order_id = @order_id
);

select * from GeneratetBill(4)

select * from bill


create procedure insertBill4
@order_id int,
@paymentmethod varchar(50)


as begin
declare @TotalAmount int
declare @patient_id int

select @TotalAmount=sum(Total) from GeneratetBill(@order_id)
group by(order_id)
select @patient_id=patient_id from orders

insert into Bill 
values (@order_id,@patient_id,getdate(),@TotalAmount,@paymentmethod)

end

select * from patient
exec insertBill4 3,'cheque'

   exec listBill 

----------------execution of  Bill through views ----------------------
create view vu_bill
as 
select BillID ,
  order_id ,
   patient_id ,
  Date,
  TotalAmount  ,
  PaymentMethod 
   from bill 

   select * from vu_bill

   ----------------execution of  Bill through procedure ----------------------
   create procedure listBill 
   as 
   begin
   select BillID ,
  order_id ,
   patient_id ,
  Date,
  TotalAmount  ,
  PaymentMethod 
   from bill 
   end

   exec listBill 

   -------Generating bill --------------
   exec insertBill4 4,'cheque'
      exec listBill 
	     select * from vu_bill












----------------------------------------------------------------------------------------------------------------------------

-------------Creation of table : Feedback------------

create table feedback
(
feedback_id int identity ,
patient_id int NOt NULL ,
order_id int NOt NULL ,
emp_id int ,
Rating int NOT NUll ,
comments varchar(255) ,
constraint fc_pk primary key (feedback_id ,order_id) ,
constraint orderID_fk foreign key (order_id) references Orders(order_id),
constraint  pat_fk foreign key (patient_id) references Patient(patient_id),
constraint  emp_fk foreign key (emp_id) references Employee (emp_id) on delete cascade
);


-------------Insertion in feeedbacck -----------------------
create PROCEDURE InsertFeedback
  @order_id INT,
  @patient_id int ,
  @Rating INT,
  @Comment VARCHAR(255),
  @emp_id int 

AS
BEGIN
  SET NOCOUNT ON;

  -- Check if the patient has placed an order for the given order ID
  IF EXISTS (SELECT 1 FROM Orders WHERE order_id = @order_id AND patient_id  = @patient_id and emp_id=@emp_id )
  BEGIN

    -- Insert the feedback into the Feedback table
    INSERT INTO Feedback(order_id, patient_id, Rating, Comments)
    VALUES (@order_id, @patient_id, @Rating, @Comment);

    PRINT 'Feedback has been successfully inserted.';
  END
  ELSE
  BEGIN
    PRINT 'The patient has not placed an order for the given order ID or emp id is invalid.';
  END
END;


exec InsertFeedback 3,4,9,'bestest',4

select * from vu_feedback1
exec Listfeeedback

---------------execution of feedback through procedure--------------------
create procedure Listfeeedback
as
begin 
select feedback_id ,order_id, patient_id, Rating, Comments from feedback
end 

exec Listfeeedback

---------------execution of feedback through views--------------------
create view vu_feedback1
as 
select feedback_id ,order_id, patient_id, Rating, Comments from feedback

select * from vu_feedback1


------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------creation of Table : order ----------
create TABLE Orders (
  order_id INT PRIMARY KEY identity,
  patient_id INT NOT NULL,
  order_date varchar(100) Not Null ,
 
  FOREIGN KEY (patient_id) REFERENCES Patient (patient_id) on delete cascade on update cascade,
)
alter table Orders 
add emp_id int constraint wt_fk foreign key(emp_id) references Employee(emp_id)


--------------Insertion in order-----------------
create procedure insertorders1

@patient_name varchar(50),
@emp_name varchar(50),
@order_date varchar(100)

as begin
declare @patient_id int
declare @emp_id int

   select @patient_id =patient_id  from Patient where patient_name=@patient_name
    select @emp_id =emp_id  from Employee where emp_name=@emp_name


   insert into Orders(patient_id, order_date ,emp_id)
   values(@patient_id ,@order_date ,@emp_id)
   end
   select * from patient
   select * from Employee

   exec insertorders1 'Ahmed','KHUSSHAL KHAN','2023-06-230 '
   select * from orders



-------------execution of order through views--------------
create view vu_orders 
as
select order_id ,patient_id ,order_date ,emp_id from orders

select * from vu_orders 

-------------execution of order through procedure--------------
create procedure ListOrder
as
select * from orders

select * from vu_orders 

-------------------------------------------------------------------------------------------------------------------------------------------------------

------creation of tables : order item-----------
create TABLE OrderItems (
 orderItem_id int not NULL primary key identity,
  order_id INT NOT NULL,
  medicine_id INT NOT NULL,
  Quantity INT NOT NULL,
 
   constraint  order_Fk FOREIGN KEY ( order_id) REFERENCES Orders( order_id) on delete cascade on update cascade,
  constraint  med_Fk FOREIGN KEY (medicine_id) REFERENCES medicine4 (medicine_id) on delete cascade on update cascade
);

---------------Insertion in orderItems------------
 create procedure insertorderItem

@medicine_name  varchar(50) ,
@quantity int ,
@emp_name varchar(50),
@order_id int


as
begin
declare @medicine_id int ,
@emp_id int
select @medicine_id = medicine_id from medicine4 where @medicine_name = medicine_name 
select @emp_id = emp_id from Employee where @emp_name = emp_name 
	
if( (select quantity from stock where medicine_id=@medicine_id) < @quantity)

begin
print  'this medicine is not available right now !'

return
end
   insert into OrderItems (order_id,medicine_id,quantity)
   values(@order_id,@medicine_id,@quantity)
     -- Update the quantity in the stock table
  UPDATE stock
  SET stock.quantity=stock.quantity - oi.quantity
  FROM OrderItems oi
  WHERE stock.medicine_id = oi.medicine_id
    AND oi.order_id = @order_id;

end

exec  insertorderItem 'bluedol',5,'KHUSHAL KHAN',4
exec pd_orderitems
select * from vu_orderitems

-------------execution of order items through views ------------------
create view vu_orderitems
as
select orderItem_id ,order_id,medicine_id, quantity from OrderItems

select * from vu_orderitems

-------------execution of order items through procedure ------------------
create procedure pd_orderitems
as
begin
select orderItem_id ,order_id,medicine_id, quantity from OrderItems
end 

exec pd_orderitems


----------------------------------------------------------------------------------------------------------------------------------------------------------


create FUNCTION dbo.GetManufacturerDataByName (@manufacturer_name VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT  manufacturer_id , manufacturer_name , manufacturer_address ,manufacturer_phone , manufacturer_email
    FROM manufacturer
    WHERE manufacturer_name = @manufacturer_name
);

SELECT *
FROM dbo.GetManufacturerDataByName('Ali');



create FUNCTION dbo.GetEmplyoeeDataByName (@emp_name VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT   emp_id,emp_name,emp_address ,emp_phone,emp_email,emp_position,emp_salary from Employee
    WHERE emp_name = @emp_name
);


SELECT *
FROM dbo.GetEmplyoeeDataByName ('kulsoom');


create FUNCTION dbo.GetDoctorDataByName (@doctor_name VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT  doctor_id, doctor_name ,doctor_address , doctor_phone  ,doctor_email , doctor_DOB , doctor_DOJ  from doctor
    WHERE doctor_name = @doctor_name
);


SELECT * FROM dbo.GetDoctorDataByName ('fiza');


create FUNCTION dbo.GetSpecialityDataByName (@Speciality_name VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT Speciality_id , Speciality_name , Speciality_institute from Speciality
    WHERE Speciality_name = @Speciality_name
);


SELECT * FROM dbo.GetSpecialityDataByName ('d-pharmacy');

CREATE FUNCTION dbo.GetDocSpecRecords()
RETURNS TABLE
AS
RETURN
(
    SELECT doctor_id, speciality_id, year
    FROM Doc_Spec
);

select * from dbo.GetDocSpecRecords()

CREATE FUNCTION dbo.GetDocSpecRecordsByYear(@year int)
RETURNS TABLE
AS
RETURN
(
    SELECT doctor_id, speciality_id, year
    FROM Doc_Spec
    WHERE year = @year
);

select * from  dbo.GetDocSpecRecordsByYear(2012)


CREATE FUNCTION dbo.GetMedicineRecordsByMedicineName(@medicine_name varchar(100))
RETURNS TABLE
AS
RETURN
(
    SELECT medicine_id, Medicine_name, medicine_price, medicine_MFG, medicine_Expiry, potency, manufacturer_id
    FROM medicine4
    WHERE Medicine_name = @medicine_name
);

select * from dbo.GetMedicineRecordsByMedicineName('panadol')


CREATE FUNCTION dbo.GetPatientsByName
(
    @patientName varchar(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT patient_id,patient_name,patient_gender,patient_DOB,patient_email,patient_address,patient_contact  from patient
    WHERE patient_name = @patientName
);

select * from dbo.GetPatientsByName('Ali')


CREATE FUNCTION GetOrderExecutionData(
  @order_id INT
)
RETURNS TABLE
AS
RETURN
(
  SELECT order_id ,patient_id ,order_date ,emp_id from orders
  WHERE order_id = @order_id
   
);

SELECT *
FROM dbo.GetOrderExecutionData(3);


CREATE FUNCTION GetOrderItemExecutionData(
  @orderItem_id INT
)
RETURNS TABLE
AS
RETURN
(
select orderItem_id ,order_id,medicine_id, quantity from OrderItems
where orderItem_id = @orderItem_id
   

);

select * from dbo.GetOrderItemExecutionData(3)


CREATE FUNCTION GetBillExecutionRecords(
  @bill_id INT
)
RETURNS TABLE
AS
RETURN
(
  SELECT BillID,
         order_id,
         patient_id,
         Date,
         TotalAmount,
         PaymentMethod
  FROM bill
  WHERE BillID = @bill_id
);

select * from GetBillExecutionRecords(2)


-------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TRIGGER trg_ManufacturerInsertUpdate
ON manufacturer
AFTER INSERT, UPDATE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted or updated row
    DECLARE @manufacturer_name VARCHAR(100);
    DECLARE @action VARCHAR(10);

    SELECT @manufacturer_name = manufacturer_name
    FROM inserted;

    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        SET @action = 'Updated';
    END
    ELSE
    BEGIN
        SET @action = 'Inserted';
    END;

    PRINT 'Manufacturer ' + @manufacturer_name + ' ' + @action + '.';
END;


CREATE TRIGGER trg_ManufacturerPhoneNumber
ON manufacturer
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the phone number to integer if it is stored as varchar and has a length of 11
    UPDATE m
    SET m.manufacturer_phone = CONVERT(INT, m.manufacturer_phone)
    FROM manufacturer m
    INNER JOIN inserted i ON m.manufacturer_id = i.manufacturer_id
    WHERE i.manufacturer_phone LIKE REPLICATE('[0-9]', 11) COLLATE Latin1_General_BIN;

    -- Rollback the transaction if any phone number couldn't be converted to integer
    IF @@ROWCOUNT <> (SELECT COUNT(*) FROM inserted)
    BEGIN
        RAISERROR('Invalid phone number format. Phone number should be numeric and have a length of 11.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;

exec  InsertManufacturer 109 , 'Ali' , 'Gulshan-e-Iqbal' , '02123484212' , 'Ali@gmail.com' 




CREATE TRIGGER trg_EmployeeInsertUpdate
ON employee
AFTER INSERT, UPDATE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted or updated row
    DECLARE @emp_name VARCHAR(100);
    DECLARE @action VARCHAR(10);

    SELECT @emp_name = emp_name
    FROM inserted;

    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        SET @action = 'Updated';
    END
    ELSE
    BEGIN
        SET @action = 'Inserted';
    END;

    PRINT 'Employee ' + @emp_name + ' ' + @action + '.';
END;


create TRIGGER trg_EmployeePhoneNumber
ON Employee
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the phone number to integer if it is stored as varchar and has a length of 11
    UPDATE m
    SET m.emp_phone = CONVERT(INT, m.emp_phone)
    FROM Employee m
    INNER JOIN inserted i ON m.emp_id = i.emp_id
    WHERE i.emp_phone LIKE REPLICATE('[0-9]', 11) COLLATE Latin1_General_BIN;

    -- Rollback the transaction if any phone number couldn't be converted to integer
    IF @@ROWCOUNT <> (SELECT COUNT(*) FROM inserted)
    BEGIN
        RAISERROR('Invalid phone number format. Phone number should be numeric and have a length of 11.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;




CREATE TRIGGER trg_DoctorInsertUpdate
ON Doctor
AFTER INSERT, UPDATE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted or updated row
    DECLARE @doctor_name VARCHAR(100);
    DECLARE @action VARCHAR(10);

    SELECT @doctor_name = doctor_name
    FROM inserted;

    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        SET @action = 'Updated';
    END
    ELSE
    BEGIN
        SET @action = 'Inserted';
    END;

    PRINT 'Doctor' + @doctor_name + ' ' + @action + '.';
END;

CREATE TRIGGER trg_StockUpdate
ON stock
AFTER UPDATE
AS
BEGIN

  -- For example, you can update another table or log the changes
  -- You can access the updated data using the 'inserted' and 'deleted' tables

  -- Example action: Updating a log table with the updated stock information
  INSERT INTO stock_log (stock_id, updated_date, previous_quantity, new_quantity)
  SELECT i.stock_id, GETDATE(), d.quantity, i.quantity
  FROM inserted AS i
  INNER JOIN deleted AS d ON i.stock_id = d.stock_id;
END;




CREATE TRIGGER trg_DoctorPhoneNumber
ON Doctor
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the phone number to integer if it is stored as varchar and has a length of 11
    UPDATE m
    SET m.doctor_phone = CONVERT(INT, m.doctor_phone)
    FROM Doctor m
    INNER JOIN inserted i ON m.doctor_id = i.doctor_id
    WHERE i.doctor_phone LIKE REPLICATE('[0-9]', 11) COLLATE Latin1_General_BIN;

    -- Rollback the transaction if any phone number couldn't be converted to integer
    IF @@ROWCOUNT <> (SELECT COUNT(*) FROM inserted)
    BEGIN
        RAISERROR('Invalid phone number format. Phone number should be numeric and have a length of 11.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;



create TRIGGER trg_SpecialityInsertUpdateDelete
ON Speciality
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted, updated, or deleted row
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Handle insert or update operation
        SELECT 'Speciality inserted or updated: ' + speciality_name AS Action
        FROM inserted;
    END;
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Handle delete operation
        SELECT 'Speciality deleted: ' + speciality_name AS Action
        FROM deleted;
    END;
END;




CREATE TRIGGER trg_DocSpecInsertUpdateDelete
ON Doc_Spec
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted, updated, or deleted row
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Handle insert or update operation
        SELECT 'Doc_Spec inserted or updated: Doctor ID - ' + CONVERT(varchar, doctor_id) + ', Speciality ID - ' + CONVERT(varchar, speciality_id) AS Action
        FROM inserted;
		
    END;
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Handle delete operation
        SELECT 'Doc_Spec deleted: Doctor ID - ' + CONVERT(varchar, doctor_id) + ', Speciality ID - ' + CONVERT(varchar, speciality_id) AS Action
        FROM deleted;
    END;
END;



CREATE TRIGGER trg_Medicine4InsertUpdateDelete
ON medicine4
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Perform the necessary actions here
    -- You can access the inserted and deleted tables to retrieve the affected rows

    -- Example: Print a message for each inserted, updated, or deleted row
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Handle insert or update operation
        SELECT 'Medicine4 inserted or updated: Medicine ID - ' + CONVERT(varchar, medicine_id) + ', Medicine Name - ' + medicine_name AS Action
        FROM inserted;
    END;
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Handle delete operation
        SELECT 'Medicine4 deleted: Medicine ID - ' + CONVERT(varchar, medicine_id) + ', Medicine Name - ' + medicine_name AS Action
        FROM deleted;
    END;
END;


CREATE TRIGGER trg_Medicine4Expiry
ON medicine4
AFTER INSERT, UPDATE
AS
BEGIN
    -- Check if any medicine has expired
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE medicine_Expiry <= GETDATE()
    )
    BEGIN
        -- Update the is_expired column for expired medicines
        UPDATE medicine4
        SET is_expired = 1
        WHERE medicine_id IN (
            SELECT medicine_id
            FROM inserted
            WHERE medicine_Expiry <= GETDATE()
        );
    END;
END;


-- Add the is_expired column to the medicine4 table
ALTER TABLE medicine4
ADD is_expired bit NULL;

CREATE TRIGGER trg_Medicine4Expiry
ON medicine4
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the is_expired column for expired medicines
    UPDATE m
    SET is_expired = CASE
        WHEN ISDATE(m.medicine_Expiry) = 1 AND TRY_CONVERT(date, m.medicine_Expiry, 103) <= GETDATE() THEN 1
        ELSE 0
    END
    FROM medicine4 m
    JOIN inserted i ON m.medicine_id = i.medicine_id;
END;


CREATE TRIGGER trg_PatientOperations
ON Patient
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Inserted records
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Perform actions for inserted records
        -- Replace the PRINT statement with your desired actions
        PRINT 'Records have been inserted or updated.';
    END;
    
    -- Deleted records
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Perform actions for deleted records
        -- Replace the PRINT statement with your desired actions
        PRINT 'Records have been deleted.';
    END;
END;


CREATE TRIGGER AfterInsertBill
AFTER INSERT
ON bill

BEGIN
  -- Trigger logic goes here
  -- You can access the newly inserted values using the "NEW" keyword
  
  -- Example: Print the inserted BillID
  DECLARE insertedBillID INT;
  SET insertedBillID = NEW.bill_id;
  SELECT 'Inserted BillID: ' + CAST(insertedBillID AS VARCHAR) AS Message;
END;


CREATE TRIGGER trg_BillInsert
ON Bill
AFTER INSERT
AS
BEGIN
  SELECT BillID, order_id, patient_id, Date, TotalAmount, PaymentMethod
  FROM inserted;
END;








create TRIGGER trg_patientPhoneNumber
ON Patient
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the phone number to integer if it is stored as varchar and has a length of 11
    UPDATE m
    SET m.patient_contact = CONVERT(INT, m.patient_contact)
    FROM Patient m
    INNER JOIN inserted i ON m.patient_id = i.patient_id
    WHERE i.patient_contact LIKE REPLICATE('[0-9]', 11) COLLATE Latin1_General_BIN;

    -- Rollback the transaction if any phone number couldn't be converted to integer
    IF @@ROWCOUNT <> (SELECT COUNT(*) FROM inserted)
    BEGIN
        RAISERROR('Invalid phone number format. Phone number should be numeric and have a length of 11.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;


















