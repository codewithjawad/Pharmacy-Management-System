----displays the appointments made by patients, along with the doctor's information.
CREATE VIEW PatientAppointments AS
SELECT 
    P.patient_name AS PatientName,
    P.patient_gender AS Gender,
    P.patient_DOB AS DateOfBirth,
    P.patient_email AS Email,
    P.patient_address AS Address,
    P.patient_contact AS Contact,
    D.doctor_name AS DoctorName,
    A.appointment_date AS AppointmentDate,
    A.appointment_time AS AppointmentTime,
    A.appointment_reason AS Reason
FROM 
    Patient P
INNER JOIN 
    Appointment A ON P.patient_id = A.patient_id
INNER JOIN 
    Doctor D ON A.doctor_id = D.doctor_id;
select * from PatientAppointments

---shows the current stock of medicines along with their details
CREATE VIEW MedicineStock AS
SELECT 
    M.medicine_id AS MedicineID,
    M.Medicine_name AS MedicineName,
    S.expiry AS ExpiryDate,
    S.quantity AS Quantity,
    S.rate AS Rate,
    SU.Supplier_name AS SupplierName
FROM 
    medicines M
INNER JOIN 
    stock S ON M.medicine_id = S.medicine_id
INNER JOIN 
    Supplier SU ON S.supplier_id = SU.Supplier_id;

select * from MedicineStock


-----provides details of employees including their position and salary.

CREATE VIEW EmployeeDetails AS
SELECT 
    emp_id AS EmployeeID,
    emp_name AS EmployeeName,
    emp_address AS Address,
    emp_phone AS Phone,
    emp_email AS Email,
    emp_DOB AS DateOfBirth,
    emp_DOJ AS DateOfJoining,
    emp_position AS Position,
    emp_salary AS Salary
FROM 
    Employee;

	select * from EmployeeDetails


	----displays details of the suppliers along with their contact information.

CREATE VIEW SupplierDetails AS
SELECT 
    Supplier_id AS SupplierID,
    Supplier_name AS SupplierName,
    Supplier_address AS Address,
    Supplier_phone AS Phone,
    Supplier_email AS Email
FROM 
    Supplier;


	select * from SupplierDetails

-----summarizes the feedback provided by patients for their orders.
CREATE VIEW FeedbackSummary AS
SELECT 
    f.order_id,
    f.patient_id,
    f.emp_id,
    f.Rating,
    f.comments,
    o.order_date,
    e.emp_name
FROM 
    feedback f
INNER JOIN 
    Orders o ON f.order_id = o.order_id
INNER JOIN 
    Employee e ON f.emp_id = e.emp_id;

	select * from FeedbackSummary

