
------creation of Table : medicine ------
create table medicines (
medicine_id int primary key not null,
Medicine_name varchar(100) Not Null ,
medicine_price int Not Null ,
medicine_MFG varchar(100) Not Null ,
medicine_Expiry varchar(100) Not Null ,
potency varchar(20) ,
manufacturer_id int not null foreign key references manufacturer (manufacturer_id) on delete cascade )

select * from medicines

------insertion in Medicine -------
ALTER PROCEDURE InsertMedicines
    @medicine_id INT,
    @medicine_name VARCHAR(100),
    @medicine_price INT,
    @medicine_MFG VARCHAR(100),
    @medicine_Expiry VARCHAR(100),
    @potency VARCHAR(20),
    @manufacturer_name VARCHAR(100)
AS
BEGIN
    DECLARE @manufacturer_id INT;

    -- Retrieve the manufacturer_id based on the manufacturer_name
    SELECT @manufacturer_id = manufacturer_id 
    FROM manufacturer 
    WHERE manufacturer_name = @manufacturer_name;

    -- Check if manufacturer_id is NULL
    IF @manufacturer_id IS NULL
    BEGIN
        -- If no rows were affected, the record did not exist
        RAISERROR('Record with manufacturer_name %s does not exist.', 16, 1, @manufacturer_name);
        RETURN;
    END

    -- Insert into medicines table
    INSERT INTO medicines (medicine_id, medicine_name, medicine_price, medicine_MFG, medicine_Expiry, potency, manufacturer_id)
    VALUES (@medicine_id, @medicine_name, @medicine_price, @medicine_MFG, @medicine_Expiry, @potency, @manufacturer_id);
END;

EXEC InsertMedicines 
    @medicine_id = 3, 
    @medicine_name = 'panadol', 
    @medicine_price = 200, 
    @medicine_MFG = '2024/12/20', 
    @medicine_Expiry = '2023/06/12', 
    @potency = '5mg', 
    @manufacturer_name = 'Ali';


exec ListMedicine
--select * from manufacturer

-------execution of the Medicine by procedure-------
create procedure ListMedicine
as 
begin
select * from medicines
end

exec ListMedicine



-----Updation in Medicine-----
ALTER PROCEDURE updateMedicine2
    @medicine_id int,
    @Medicine_name varchar(100),
    @medicine_price int,
    @medicine_MFG varchar(100),
    @medicine_Expiry varchar(100),
    @potency varchar(20),
    @manufacturer_name varchar(100)
AS
BEGIN
    DECLARE @manufacturer_id int

    -- Check if the manufacturer exists
    SELECT @manufacturer_id = manufacturer_id FROM manufacturer WHERE manufacturer_name = @manufacturer_name

    IF @manufacturer_id IS NULL
    BEGIN
        -- If manufacturer does not exist, raise an error
        RAISERROR('Manufacturer with name %s does not exist.', 16, 1, @manufacturer_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_id = @medicine_id)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with ID %d does not exist.', 16, 1, @medicine_id);
        RETURN; -- Exit the procedure
    END

    -- Update the medicine
    UPDATE medicines
    SET medicine_name = @Medicine_name,
        medicine_price = @medicine_price,
        medicine_MFG = @medicine_MFG,
        medicine_Expiry = @medicine_Expiry,
        manufacturer_id = @manufacturer_id,
        potency = @potency
    WHERE medicine_id = @medicine_id;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('No rows were updated for medicine with ID %d.', 16, 1, @medicine_id);
    END
END




exec updateMedicine2 2,'rigix',200,'2024/12/12','2025/5/20','10mg','Ali'
exec ListManufacturer
exec ListMedicine


-----Deletion in Medicine-----
create procedure DeleteMedicine
@Medicine_id int ,
@potency varchar(20)
as
begin
delete medicines where medicine_id = @medicine_id and potency =@potency
end

exec DeleteMedicine 1 , '10mg'

exec ListMedicine


