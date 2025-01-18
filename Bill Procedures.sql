
--------creation of table : Bill---------
create TABLE Bill (
   BillID INT identity primary key not null ,
   order_id INT foreign key  references Orders (order_id),
   patient_id INT  foreign key  references patient (patient_id),
   BillDate Date,
   TotalAmount int ,
   PaymentMethod VARCHAR(50))

-------Insertion in Bill--------
select * from bill


CREATE PROCEDURE insertBill
    @order_id int,
    @TotalAmount int,
    @paymentmethod varchar(50)
AS
BEGIN
    DECLARE @patient_id int

    -- Check if the order exists and retrieve patient ID
    SELECT @patient_id = patient_id 
    FROM Orders 
    WHERE order_id = @order_id

    -- Check if the order exists
    IF @patient_id IS NULL
    BEGIN
        -- If the order does not exist, raise an error
        RAISERROR('Order with ID %d does not exist.', 16, 1, @order_id);
        RETURN; -- Exit the procedure
    END

    -- Insert into Bill
    INSERT INTO Bill (order_id, patient_id, BillDate, TotalAmount, PaymentMethod)
    VALUES (@order_id, @patient_id, GETDATE(), @TotalAmount, @paymentmethod);
END


select * from patient
exec insertBill 1,10000,'cheque'


   exec listBill 

   ----------------execution of  Bill through procedure ----------------------
create PROCEDURE listBill
AS
BEGIN
    SELECT BillID,
           order_id,
           patient_id,
           BillDate,
           TotalAmount,
           PaymentMethod
    FROM Bill;
END


   exec listBill 

   -------Generating bill --------------
   exec insertBill 1,'4000','cash'
      exec listBill 

select * from Orders


ALTER PROCEDURE updateBill
    @BillID int,
    @order_id int,
    @TotalAmount int,
    @PaymentMethod varchar(50)
AS
BEGIN
	    DECLARE @patient_id int
    -- Check if the bill exists
    IF NOT EXISTS (SELECT 1 FROM Bill WHERE BillID = @BillID)
    BEGIN
        -- If the bill does not exist, raise an error
        RAISERROR('Bill with ID %d does not exist.', 16, 1, @BillID);
        RETURN; -- Exit the procedure
    END

    -- Check if the order exists and retrieve patient ID
    SELECT @patient_id = patient_id 
    FROM Orders 
    WHERE order_id = @order_id
    -- Check if the provided patient ID exists in the parent table
    IF NOT EXISTS (SELECT 1 FROM Patient WHERE patient_id = @patient_id)
    BEGIN
        -- If the patient ID does not exist in the parent table, raise an error
        RAISERROR('Patient with ID %d does not exist in the parent table.', 16, 1, @patient_id);
        RETURN; -- Exit the procedure
    END

    -- Update the bill
    UPDATE Bill
    SET order_id = @order_id,
        patient_id = @patient_id,
        TotalAmount = @TotalAmount,
        PaymentMethod = @PaymentMethod
    WHERE BillID = @BillID;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update bill with ID %d.', 16, 1, @BillID);
    END
END



exec updateBill 2,1,5000,'cash'

exec listBill



CREATE PROCEDURE deleteBill
    @BillID int
AS
BEGIN
    -- Check if the bill exists
    IF NOT EXISTS (SELECT 1 FROM Bill WHERE BillID = @BillID)
    BEGIN
        -- If the bill does not exist, raise an error
        RAISERROR('Bill with ID %d does not exist.', 16, 1, @BillID);
        RETURN; -- Exit the procedure
    END

    -- Delete the bill
    DELETE FROM Bill WHERE BillID = @BillID;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete bill with ID %d.', 16, 1, @BillID);
    END
END


exec deleteBill 2

exec listBill