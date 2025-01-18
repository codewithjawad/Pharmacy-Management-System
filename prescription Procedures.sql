
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

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


------insertion in Prescription -------
CREATE PROCEDURE InsertPrescription
    @medicine_name varchar(100),
    @patient_name varchar(100),
    @doctor_name varchar(100),
    @potency varchar(20),
    @when_to_take varchar(100),
    @amount int,
    @special_insrtruction varchar(100),
    @duration varchar(100)
AS
BEGIN
    DECLARE @medicine_id int
    DECLARE @doctor_id int
    DECLARE @patient_id int

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_name = @medicine_name)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with name %s does not exist.', 16, 1, @medicine_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve medicine_id, patient_id, and doctor_id
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name
    SELECT @patient_id = patient_id FROM patient WHERE patient_name = @patient_name
    SELECT @doctor_id = doctor_id FROM doctor WHERE doctor_name = @doctor_name

    -- Insert prescription
    INSERT INTO Prescription (medicine_id, potency, patient_id, doctor_id, when_to_take, amount, special_insrtruction, duration)
    VALUES (@medicine_id, @potency, @patient_id, @doctor_id, @when_to_take, @amount, @special_insrtruction, @duration)
END

select * from Patient
exec  InsertPrescription 'rigix','usman','ayesha','10mg','morning', 2 , 'rest well' ,'2 days'
exec  InsertPrescription 'panadol','usman','saad','5mg','morning,night', 2 , 'bed rest' ,'2 days'

exec ListPrescription

-------execution of the prescription by procedure-------
alter procedure ListPrescription
as 
begin
select medicine_id  , potency, patient_id , doctor_id  , when_to_take  ,amount , special_insrtruction , duration from prescription
end

exec ListPrescription



-----Updation in prescription-----
CREATE PROCEDURE updatePrescription
    @medicine_name varchar(100),
    @patient_name varchar(100),
    @doctor_name varchar(100),
    @potency varchar(20),
    @when_to_take varchar(100),
    @amount int,
    @special_insrtruction varchar(100),
    @duration varchar(100)
AS
BEGIN
    DECLARE @medicine_id int
    DECLARE @doctor_id int
    DECLARE @patient_id int

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_name = @medicine_name)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with name %s does not exist.', 16, 1, @medicine_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve medicine_id, patient_id, and doctor_id
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name
    SELECT @patient_id = patient_id FROM patient WHERE patient_name = @patient_name
    SELECT @doctor_id = doctor_id FROM doctor WHERE doctor_name = @doctor_name

    -- Update prescription
    UPDATE Prescription
    SET potency = @potency,
        when_to_take = @when_to_take,
        amount = @amount,
        special_insrtruction = @special_insrtruction,
        duration = @duration
    WHERE medicine_id = @medicine_id AND doctor_id = @doctor_id AND patient_id = @patient_id

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No prescription found for the specified medicine, doctor, and patient combination.', 16, 1);
    END
END


exec updatePrescription  'rigix','usman','ayesha','50mg','morning', 2 , 'rest well' ,'2 days'

exec ListPrescription


-----Deletion in Prescription -----
alter PROCEDURE DeletePrescription
    @doctor_name varchar(100),
    @patient_name varchar(100),
    @medicine_name varchar(100)
AS
BEGIN
    DECLARE @doctor_id int
    DECLARE @patient_id int
    DECLARE @medicine_id int

    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM doctor WHERE doctor_name = @doctor_name)
    BEGIN
        -- If doctor does not exist, raise an error
        RAISERROR('Doctor with name %s does not exist.', 16, 1, @doctor_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM patient WHERE patient_name = @patient_name)
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_name = @medicine_name)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with name %s does not exist.', 16, 1, @medicine_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve doctor_id, patient_id, and medicine_id
    SELECT @doctor_id = doctor_id FROM doctor WHERE doctor_name = @doctor_name
    SELECT @patient_id = patient_id FROM patient WHERE patient_name = @patient_name
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name

    -- Delete prescription
    DELETE FROM prescription
    WHERE medicine_id = @medicine_id AND doctor_id = @doctor_id AND patient_id = @patient_id 

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No prescription found for the specified doctor, patient, medicine, and potency combination.', 16, 1);
    END
END


exec DeletePrescription 'ayesha','usman','rigix'

exec ListPrescription
