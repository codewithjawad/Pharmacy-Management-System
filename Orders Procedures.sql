
------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------creation of Table : order ----------
create TABLE Orders (
  order_id INT PRIMARY KEY identity not null,
  patient_id INT NOT NULL FOREIGN KEY REFERENCES Patient (patient_id) on delete cascade on update cascade,
  order_date varchar(100) Not Null , 
  emp_id int  foreign key(emp_id) references Employee(emp_id))


--------------Insertion in order-----------------
CREATE PROCEDURE insertorders
    @patient_name varchar(50),
    @emp_name varchar(50),
    @order_date varchar(100)
AS
BEGIN
    DECLARE @patient_id int
    DECLARE @emp_id int

    -- Check if the patient exists
    SELECT @patient_id = patient_id FROM Patient WHERE patient_name = @patient_name
    IF @patient_id IS NULL
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the employee exists
    SELECT @emp_id = emp_id FROM Employee WHERE emp_name = @emp_name
    IF @emp_id IS NULL
    BEGIN
        -- If employee does not exist, raise an error
        RAISERROR('Employee with name %s does not exist.', 16, 1, @emp_name);
        RETURN; -- Exit the procedure
    END

    -- Insert order
    INSERT INTO Orders (patient_id, order_date, emp_id)
    VALUES (@patient_id, @order_date, @emp_id)

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to insert order.', 16, 1);
    END
END

   select * from patient
   select * from Employee

   exec insertorders 'usman','Ali','2024-03-01 '
   select * from orders

-------------execution of order through procedure--------------
create procedure ListOrder
as
select * from orders

exec ListOrder 



CREATE PROCEDURE updateorders
    @order_id int,
    @patient_name varchar(50),
    @emp_name varchar(50),
    @order_date varchar(100)
AS
BEGIN
    DECLARE @patient_id int
    DECLARE @emp_id int

    -- Check if the patient exists
    SELECT @patient_id = patient_id FROM Patient WHERE patient_name = @patient_name
    IF @patient_id IS NULL
    BEGIN
        -- If patient does not exist, raise an error
        RAISERROR('Patient with name %s does not exist.', 16, 1, @patient_name);
        RETURN; -- Exit the procedure
    END

    -- Check if the employee exists
    SELECT @emp_id = emp_id FROM Employee WHERE emp_name = @emp_name
    IF @emp_id IS NULL
    BEGIN
        -- If employee does not exist, raise an error
        RAISERROR('Employee with name %s does not exist.', 16, 1, @emp_name);
        RETURN; -- Exit the procedure
    END

    -- Update order
    UPDATE Orders
    SET patient_id = @patient_id,
        order_date = @order_date,
        emp_id = @emp_id
    WHERE order_id = @order_id;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update order with ID %d.', 16, 1, @order_id);
    END
END
exec updateorders 1,'usman','hasnain','2024-06-23'



CREATE PROCEDURE deleteorder
    @order_id int
AS
BEGIN
    -- Check if the order exists
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE order_id = @order_id)
    BEGIN
        -- If the order does not exist, raise an error
        RAISERROR('Order with ID %d does not exist.', 16, 1, @order_id);
        RETURN; -- Exit the procedure
    END

    -- Delete the order
    DELETE FROM Orders WHERE order_id = @order_id;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete order with ID %d.', 16, 1, @order_id);
    END
END


exec deleteorder 2

exec ListOrder
