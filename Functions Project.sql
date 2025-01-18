
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




