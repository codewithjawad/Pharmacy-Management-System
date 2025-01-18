
------creation of tables : order item-----------
create TABLE OrderItems (
  orderItem_id int not NULL primary key identity,
  order_id INT FOREIGN KEY REFERENCES Orders( order_id) NOT NULL,
  medicine_id INT FOREIGN KEY REFERENCES medicines (medicine_id) NOT NULL,
  Quantity INT NOT NULL)


---------------Insertion in orderItems------------
alter PROCEDURE insertorderItem
    @medicine_name VARCHAR(50),
    @quantity INT,
    @emp_name VARCHAR(50),
    @order_id INT
AS
BEGIN
    DECLARE @medicine_id INT,
            @emp_id INT

    -- Check if the provided medicine name exists
    SELECT @medicine_id = medicine_id FROM medicines WHERE medicine_name = @medicine_name;

    IF @medicine_id IS NULL
    BEGIN
        PRINT 'Invalid medicine name!';
        RETURN;
    END

    -- Check if the provided employee name exists
    SELECT @emp_id = emp_id FROM Employee WHERE emp_name = @emp_name;

    IF @emp_id IS NULL
    BEGIN
        PRINT 'Invalid employee name!';
        RETURN;
    END

    -- Check if the provided order ID exists
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE order_id = @order_id)
    BEGIN
        PRINT 'Invalid order ID!';
        RETURN;
    END

    -- Check if the medicine is available in stock
    IF ((SELECT quantity FROM stock WHERE medicine_id = @medicine_id) < @quantity)
    BEGIN
        PRINT 'This medicine is not available right now!';
        RETURN;
    END

    -- Insert into OrderItems
    INSERT INTO OrderItems (order_id, medicine_id, quantity)
    VALUES (@order_id, @medicine_id, @quantity);

    -- Update the quantity in the stock table
    UPDATE stock
    SET quantity = quantity - @quantity
    WHERE medicine_id = @medicine_id;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Failed to insert order item or update stock.';
        RETURN;
    END

    PRINT 'Order item inserted successfully.';
END


select * from medicines
exec  insertorderItem 'rigix',5,'usman',1

-------------execution of order items through procedure ------------------
create procedure proorderitems
as
begin
select orderItem_id ,order_id,medicine_id, quantity from OrderItems
end 

exec proorderitems


CREATE PROCEDURE updateOrderItem
    @order_item_id INT,
    @quantity INT
AS
BEGIN
    -- Check if the order item exists
    IF NOT EXISTS (SELECT 1 FROM OrderItems WHERE orderItem_id = @order_item_id)
    BEGIN
        -- If the order item does not exist, raise an error
        RAISERROR('Order item with ID %d does not exist.', 16, 1, @order_item_id);
        RETURN; -- Exit the procedure
    END

    -- Check if the new quantity is valid (greater than 0)
    IF @quantity <= 0
    BEGIN
        RAISERROR('Quantity must be greater than 0.', 16, 1);
        RETURN; -- Exit the procedure
    END

    DECLARE @old_quantity INT,
            @medicine_id INT

    -- Get the current quantity and medicine ID of the order item
    SELECT @old_quantity = quantity,
           @medicine_id = medicine_id
    FROM OrderItems
    WHERE orderItem_id = @order_item_id;

    -- Check if the updated quantity is valid (not exceeding stock)
    IF ((SELECT quantity FROM stock WHERE medicine_id = @medicine_id) + @old_quantity - @quantity) < 0
    BEGIN
        RAISERROR('Updated quantity exceeds available stock.', 16, 1);
        RETURN; -- Exit the procedure
    END

    -- Update the order item
    UPDATE OrderItems
    SET quantity = @quantity
    WHERE orderItem_id = @order_item_id;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update order item with ID %d.', 16, 1, @order_item_id);
    END
    ELSE
    BEGIN
        -- Update the quantity in the stock table
        UPDATE stock
        SET quantity = quantity + @old_quantity - @quantity
        WHERE medicine_id = @medicine_id;

        PRINT 'Order item updated successfully.';
    END
END

exec updateOrderItem  2,8

------------------------------------------------
CREATE PROCEDURE deleteOrderItem
    @order_item_id INT
AS
BEGIN
    -- Check if the order item exists
    IF NOT EXISTS (SELECT 1 FROM OrderItems WHERE orderItem_id = @order_item_id)
    BEGIN
        -- If the order item does not exist, raise an error
        RAISERROR('Order item with ID %d does not exist.', 16, 1, @order_item_id);
        RETURN; -- Exit the procedure
    END

    DECLARE @quantity INT,
            @medicine_id INT

    -- Get the quantity and medicine ID of the order item
    SELECT @quantity = quantity,
           @medicine_id = medicine_id
    FROM OrderItems
    WHERE orderItem_id = @order_item_id;

    -- Delete the order item
    DELETE FROM OrderItems
    WHERE orderItem_id = @order_item_id;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete order item with ID %d.', 16, 1, @order_item_id);
    END
    ELSE
    BEGIN
        -- Update the quantity in the stock table
        UPDATE stock
        SET quantity = quantity + @quantity
        WHERE medicine_id = @medicine_id;

        PRINT 'Order item deleted successfully.';
    END
END


exec proorderitems
