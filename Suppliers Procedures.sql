
------creation of Table : Supplier ------
create table Supplier (
Supplier_id int identity primary key  Not Null,
Supplier_name varchar(100) Not Null,
Supplier_address varchar(100) Not Null ,
Supplier_phone varchar(11) Not Null unique ,
Supplier_email varchar(100) Not Null )


------insertion in Supploer -------
CREATE PROCEDURE InsertSupplier
    @Supplier_name varchar(100),
    @Supplier_address varchar(100),
    @Supplier_phone varchar(11),
    @Supplier_email varchar(100)
AS
BEGIN
    -- Check if the supplier already exists based on supplier name
    IF EXISTS (SELECT 1 FROM Supplier WHERE Supplier_name = @Supplier_name)
    BEGIN
        RAISERROR('A supplier with the name %s already exists.', 16, 1, @Supplier_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the supplier already exists based on supplier email
    IF EXISTS (SELECT 1 FROM Supplier WHERE Supplier_email = @Supplier_email)
    BEGIN
        RAISERROR('A supplier with the email %s already exists.', 16, 1, @Supplier_email);
        RETURN; -- Exit the procedure
    END

    -- Insert new supplier
    INSERT INTO Supplier (Supplier_name, Supplier_address, Supplier_phone, Supplier_email)
    VALUES (@Supplier_name, @Supplier_address, @Supplier_phone, @Supplier_email)
END


exec  InsertSupplier  'Saad' , 'Gulshan-e-Iqbal' , '021-1234212' , 'saad@gmail.com' 
exec  InsertSupplier 'azaan' , 'Gulshan-e-Iqbal' , '021-1234202' , 'Azaan@gmail.com' 

-------execution of the Supplier theough procedures ----- 
create procedure ListSupplier 
as 
begin
select Supplier_id , Supplier_name , Supplier_address ,Supplier_phone , Supplier_email from Supplier
end

exec ListSupplier


-----Updation in Suppplier-----
CREATE PROCEDURE updateSupplier
    @Supplier_name varchar(100),
    @Supplier_address varchar(100),
    @Supplier_phone varchar(11),
    @Supplier_email varchar(100)
AS
BEGIN
    DECLARE @Supplier_id int

    -- Check if the supplier exists
    SELECT @Supplier_id = Supplier_id FROM Supplier WHERE Supplier_name = @Supplier_name
    IF @Supplier_id IS NULL
    BEGIN
        -- If supplier does not exist, raise an error
        RAISERROR('Supplier with name %s does not exist.', 16, 1, @Supplier_name);
        RETURN; -- Exit the procedure
    END

    -- Update supplier details
    UPDATE Supplier
    SET Supplier_address = @Supplier_address,
        Supplier_phone = @Supplier_phone,
        Supplier_email = @Supplier_email
    WHERE Supplier_id = @Supplier_id

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update supplier with name %s.', 16, 1, @Supplier_name);
    END
END


exec updateSupplier 'saad' ,'Gulshan-e-iqbal' , '123456','saad@gmail.com' 

exec ListSupplier 


-----Deletion in Supplier-----
alter PROCEDURE DeleteSupplier
    @Supplier_name varchar(100)
AS
BEGIN
    DECLARE @Supplier_id int

    -- Check if the supplier exists
    SELECT @Supplier_id = Supplier_id FROM Supplier WHERE Supplier_name = @Supplier_name
    IF @Supplier_id IS NULL
    BEGIN
        -- If supplier does not exist, raise an error
        RAISERROR('Supplier with name %s does not exist.', 16, 1, @Supplier_name);
        RETURN; -- Exit the procedure
    END

    -- Delete supplier
    DELETE FROM Supplier WHERE Supplier_id = @Supplier_id

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete supplier with name %s.', 16, 1, @Supplier_name);
    END
END


exec DeleteSupplier 'azaan'

exec ListSupplier
