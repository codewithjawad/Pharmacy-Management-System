use pms

------creation of Table : Manufacturer ------  
create table manufacturer (
manufacturer_id int identity primary key not null,
manufacturer_name varchar(100) Not Null,
manufacturer_address varchar(100) Not Null ,
manufacturer_phone varchar(20) Not Null ,
manufacturer_email varchar(100) Not Null)

select * from manufacturer
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


------creation of Table : Doctor ------
create table Doctor (
doctor_id int identity primary key not Null,
doctor_name varchar(100) Not Null,
doctor_address varchar(100) Not Null,
doctor_phone varchar(11) Not Null unique ,
doctor_email varchar(100) Not Null ,
doctor_DOB date Not Null ,
doctor_DOJ date Not Null) 

------creation of Table : Speciality ------
create table Speciality (
Speciality_id int Not Null Identity Primary Key ,
Speciality_name varchar(100) Not Null,
Speciality_institute varchar(100) Not Null)

------creation of Table : Doc_Spec ------
create table Doc_Spec (
doctor_id int foreign key references Doctor(doctor_id) on delete cascade,
speciality_id int foreign key  references speciality (Speciality_id) on delete cascade,
year int ,
constraint pk6_id primary key clustered (doctor_id , speciality_id ))

select * from Doc_Spec
------creation of Table : medicine ------
create table medicines (
medicine_id int primary key not null,
Medicine_name varchar(100) Not Null ,
medicine_price int Not Null ,
medicine_MFG varchar(100) Not Null ,
medicine_Expiry varchar(100) Not Null ,
potency varchar(20) ,
manufacturer_id int not null foreign key references manufacturer (manufacturer_id) on delete cascade )



------creation of Table : patient ------
create table Patient (
patient_id int identity primary key not Null,
patient_name varchar(100) Not Null,
patient_gender varchar(100) Not Null,
patient_DOB date Not Null ,
patient_email varchar(100) Not Null ,
patient_address varchar(100) Not Null, 
patient_contact varchar(11) Not Null unique )

------creation of Table : Appointment ------
create table Appointment (
patient_id int foreign key references patient (patient_id) on delete cascade,
doctor_id int foreign key references doctor (doctor_id) on delete cascade,
appointment_date Date,
appointment_time varchar(20) unique ,
appointment_reason varchar(100) 
constraint pk1_ids primary key clustered (doctor_id , patient_id ))


-----creation of table : Prescription------
create table Prescription (
medicine_id int foreign key references medicines (medicine_id) on delete cascade,
potency varchar(20) ,
patient_id int foreign key  references patient (patient_id) on delete cascade,
doctor_id int  foreign key  references doctor (doctor_id) on delete cascade,
when_to_take varchar(100) Not Null ,
amount int  Not Null ,
special_insrtruction varchar(100)  Not Null ,
duration varchar(100)  Not Null ,
constraint p_prec1 primary key ( medicine_id, patient_id , doctor_id ))



------creation of Table : Supplier ------
create table Supplier (
Supplier_id int identity primary key  Not Null,
Supplier_name varchar(100) Not Null,
Supplier_address varchar(100) Not Null ,
Supplier_phone varchar(11) Not Null unique ,
Supplier_email varchar(100) Not Null )


--------creation of table : Stock---------
create table stock (
stock_id int primary key not null,
stock_name varchar(100) Not Null ,
expiry date Not Null ,
quantity int Not Null ,
rate int Not Null ,
medicine_id int foreign key  references medicines (medicine_id) on delete cascade Not Null ,
supplier_id int foreign key  references  Supplier(Supplier_id) on delete cascade Not Null)


------creation of tables : Orders-----------
create TABLE Orders (
  order_id INT PRIMARY KEY identity not null,
  patient_id INT NOT NULL FOREIGN KEY REFERENCES Patient (patient_id) on delete cascade on update cascade,
  order_date varchar(100) Not Null , 
  emp_id int  foreign key(emp_id) references Employee(emp_id))


--------creation of table : Bill---------
create TABLE Bill (
   BillID INT identity primary key not null ,
   order_id INT foreign key  references Orders (order_id),
   patient_id INT  foreign key  references patient (patient_id),
   BillDate Date,
   TotalAmount int ,
   PaymentMethod VARCHAR(50))

  -------------Creation of table : Feedback------------
create table feedback(
feedback_id int identity ,
patient_id int foreign key  references patient (patient_id) NOt NULL ,
order_id int foreign key  references Orders (order_id) NOt NULL ,
emp_id int foreign key(emp_id) references Employee(emp_id) not null,
Rating int NOT NUll ,
comments varchar(255) ,
constraint fc_pk primary key (feedback_id ,patient_id))




------creation of tables : order item-----------
create TABLE OrderItems (
  orderItem_id int not NULL primary key identity,
  order_id INT FOREIGN KEY REFERENCES Orders( order_id) NOT NULL,
  medicine_id INT FOREIGN KEY REFERENCES medicines (medicine_id) NOT NULL,
  Quantity INT NOT NULL)