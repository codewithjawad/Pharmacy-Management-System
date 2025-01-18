
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table Appointment (
patient_id int foreign key references patient (patient_id) on delete cascade,
doctor_id int foreign key references doctor (doctor_id) on delete cascade,
appointment_date Date,
appointment_time varchar(20) unique ,
appointment_reason varchar(100) 
constraint pk1_ids primary key clustered (doctor_id , patient_id ))


------insertion in Appointment -------
alter PROCEDURE InsertAppointment
    @doctor_name varchar(100),
    @patient_name varchar(100),
    @appointment_date varchar(20),
    @appointment_time varchar(20),
    @appointment_reason varchar(100)
AS
BEGIN
    DECLARE @doctor_id int
    DECLARE @patient_id int

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM Doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM Patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve doctor_id and patient_id
    SELECT @doctor_id = doctor_id FROM Doctor WHERE doctor_name = @doctor_name
    SELECT @patient_id = patient_id FROM Patient WHERE patient_name = @patient_name

    -- Insert appointment
    INSERT INTO Appointment (patient_id, doctor_id, appointment_date, appointment_time, appointment_reason)
    VALUES (@patient_id, @doctor_id, @appointment_date, @appointment_time, @appointment_reason)
END

select * from Patient
select * from Doctor
exec InsertAppointment 'ayesha','usman','2023/6/20','12am','stomachache'

exec ListAppointment


-------execution of the Appointment BY procedure----- 
create procedure ListAppointment
as 
begin
select doctor_id ,patient_id , appointment_date , appointment_time , appointment_reason from Appointment
end

exec ListAppointment


-----Updation in Appointment-----
CREATE PROCEDURE updateAppointment
    @doctor_name varchar(100),
    @patient_name varchar(100),
    @appointment_date varchar(20),
    @appointment_time varchar(20),
    @appointment_reason varchar(100)
AS
BEGIN
    DECLARE @doctor_id int
    DECLARE @patient_id int

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM Doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM Patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve doctor_id and patient_id
    SELECT @doctor_id = doctor_id FROM Doctor WHERE doctor_name = @doctor_name
    SELECT @patient_id = patient_id FROM Patient WHERE patient_name = @patient_name

    -- Update appointment
    UPDATE Appointment
    SET appointment_date = @appointment_date,
        appointment_time = @appointment_time,
        appointment_reason = @appointment_reason
    WHERE doctor_id = @doctor_id AND patient_id = @patient_id

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No appointment found for doctor %s and patient %s.', 16, 1, @doctor_name, @patient_name);
    END
END


exec updateAppointment 'ayesha' ,'usman' ,'2023/12/4' ,'4pm','stomacheache'
select * from doctor
select * from patient
exec ListAppointment



-----Deletion in Appointment -----
CREATE PROCEDURE DeleteAppointment
    @doctor_name varchar(100),
    @patient_name varchar(100)
AS
BEGIN
    DECLARE @doctor_id int
    DECLARE @patient_id int

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM Doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM Patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve doctor_id and patient_id
    SELECT @doctor_id = doctor_id FROM Doctor WHERE doctor_name = @doctor_name
    SELECT @patient_id = patient_id FROM Patient WHERE patient_name = @patient_name

    -- Delete appointment
    DELETE FROM Appointment
    WHERE doctor_id = @doctor_id AND patient_id = @patient_id

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No appointment found for doctor %s and patient %s.', 16, 1, @doctor_name, @patient_name);
    END
END


exec DeleteAppointment 'ayesha','usman'
select * from appointment


