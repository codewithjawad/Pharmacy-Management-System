alter TRIGGER trg_ManufacturerInsert
ON manufacturer
AFTER INSERT
AS
BEGIN
    DECLARE @error_message NVARCHAR(4000);

    BEGIN TRY
        -- Ensure phone number is numeric and of length 11
        IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE ISNUMERIC(manufacturer_phone) = 0 OR LEN(manufacturer_phone) <> 11
        )
        BEGIN
            SET @error_message = 'Invalid phone number format. Phone number should be numeric and have a length of 11.';
            RAISERROR (@error_message, 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Perform actions after a manufacturer is inserted
        DECLARE @manufacturer_name VARCHAR(100);
        SELECT @manufacturer_name = manufacturer_name FROM inserted;
        PRINT 'Manufacturer ' + @manufacturer_name + ' Inserted.';
    END TRY
    BEGIN CATCH
        -- Handle errors
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH;
END;



ALTER TRIGGER trg_ManufacturerUpdate
ON manufacturer
AFTER UPDATE
AS
BEGIN
    DECLARE @error_message NVARCHAR(4000);

    BEGIN TRY
        -- Ensure phone number is numeric and of length 11
        IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE TRY_CONVERT(BIGINT, manufacturer_phone) IS NULL OR PATINDEX('%[^0-9]%', manufacturer_phone) > 0 OR LEN(manufacturer_phone) <> 11
        )
        BEGIN
            SET @error_message = 'Invalid phone number format. Phone number should be numeric and have a length of 11.';
            RAISERROR (@error_message, 16, 1);
            RETURN;
        END

        -- Perform actions after a manufacturer is updated
        DECLARE @manufacturer_name VARCHAR(100);
        SELECT @manufacturer_name = manufacturer_name FROM inserted;
        PRINT 'Manufacturer ' + @manufacturer_name + ' Updated.';
    END TRY
    BEGIN CATCH
        -- Handle errors
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH;
END;





alter TRIGGER trg_ManufacturerDelete
ON manufacturer
AFTER DELETE
AS
BEGIN
    BEGIN TRY
        -- Perform actions after a manufacturer is deleted
        DECLARE @manufacturer_name VARCHAR(100);

        SELECT @manufacturer_name = manufacturer_name FROM deleted;

        PRINT 'Manufacturer ' + @manufacturer_name + ' Deleted.';
    END TRY
    BEGIN CATCH
        -- Handle errors
        DECLARE @error_message NVARCHAR(4000) = ERROR_MESSAGE();
        PRINT 'Error occurred: ' + @error_message;
    END CATCH;
END;

