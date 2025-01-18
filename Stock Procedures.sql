
--------creation of table : Stock---------
create table stock (
stock_id int primary key not null,
stock_name varchar(100) Not Null ,
expiry date Not Null ,
quantity int Not Null ,
rate int Not Null ,
medicine_id int foreign key  references medicines (medicine_id) on delete cascade Not Null ,
supplier_id int foreign key  references  Supplier(Supplier_id) on delete cascade Not Null)

------insertion in Stock -------
CREATE PROCEDURE InsertStock
    @stock_id int,
    @stock_name varchar(100),
    @medicine_name varchar(100),
    @supplier_name varchar(100),
    @expiry date,
    @quantity int,
    @rate int
AS
BEGIN
    DECLARE @medicine_id int
    DECLARE @supplier_id int

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_name = @medicine_name)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with name %s does not exist.', 16, 1, @medicine_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the supplier exists
    IF NOT EXISTS (SELECT 1 FROM supplier WHERE supplier_name = @supplier_name)
    BEGIN
        -- If supplier does not exist, raise an error
        RAISERROR('Supplier with name %s does not exist.', 16, 1, @supplier_name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve medicine_id and supplier_id
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name
    SELECT @supplier_id = supplier_id FROM supplier WHERE supplier_name = @supplier_name

    -- Insert new stock
    INSERT INTO stock (stock_id, stock_name, expiry, quantity, rate, medicine_id, supplier_id)
    VALUES (@stock_id, @stock_name, @expiry, @quantity, @rate, @medicine_id, @supplier_id)
END


exec Insertstock 1,'bluedol','panadol','azaan','2026-01-12' , 50 , 20 
select * from medicines 
select * from stock


-------execution of the stock theough procedures ----- 
create procedure ListStock
as 
begin
select stock_id ,stock_name ,expiry  ,quantity  ,rate ,medicine_id  ,supplier_id   from stock
end

exec Liststock

-----Updation in Suppplier-----
CREATE PROCEDURE updateStock
    @stock_id int,
    @stock_name varchar(100),
    @medicine_name varchar(100),
    @Supplier_Name varchar(100),
    @expiry date,
    @quantity int,
    @rate int
AS
BEGIN
    DECLARE @medicine_id int
    DECLARE @supplier_id int

    -- Check if the medicine exists
    IF NOT EXISTS (SELECT 1 FROM medicines WHERE medicine_name = @medicine_name)
    BEGIN
        -- If medicine does not exist, raise an error
        RAISERROR('Medicine with name %s does not exist.', 16, 1, @medicine_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the supplier exists
    IF NOT EXISTS (SELECT 1 FROM supplier WHERE supplier_name = @Supplier_Name)
    BEGIN
        -- If supplier does not exist, raise an error
        RAISERROR('Supplier with name %s does not exist.', 16, 1, @Supplier_Name);
        RETURN; -- Exit the procedure
    END

    -- Retrieve medicine_id and supplier_id
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name
    SELECT @supplier_id = supplier_id FROM supplier WHERE supplier_name = @Supplier_Name

    -- Update stock entry
    UPDATE stock
    SET stock_name = @stock_name,
        medicine_id = @medicine_id,
        supplier_id = @supplier_id,
        expiry = @expiry,
        quantity = @quantity,
        rate = @rate
    WHERE stock_id = @stock_id;

    -- Check if the update operation affected any rows
    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update stock with ID %d.', 16, 1, @stock_id);
    END
END

select * from supplier
exec updateStock 1,'newdol','panadol','saad','2023-12-1',100,200

exec ListStock


-----Deletion in Supplier-----
CREATE PROCEDURE DeleteStock
    @stock_id int,
    @stock_name varchar(100)
AS
BEGIN
    -- Check if the stock exists
    IF NOT EXISTS (SELECT 1 FROM stock WHERE stock_id = @stock_id AND stock_name = @stock_name)
    BEGIN
        -- If stock does not exist, raise an error
        RAISERROR('Stock with ID %d and name %s does not exist.', 16, 1, @stock_id, @stock_name);
        RETURN; -- Exit the procedure
    END

    -- Delete stock
    DELETE FROM stock WHERE stock_id = @stock_id AND stock_name = @stock_name

    -- Check if the delete operation affected any rows
    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete stock with ID %d and name %s.', 16, 1, @stock_id, @stock_name);
    END
END


exec DeleteStock 1,'bluedol'
exec ListStock
