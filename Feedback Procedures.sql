
----------------------------------------------------------------------------------------------------------------------------

-------------Creation of table : Feedback------------

create table feedback(
feedback_id int identity ,
patient_id int foreign key  references patient (patient_id) NOt NULL ,
order_id int foreign key  references Orders (order_id) NOt NULL ,
emp_id int foreign key(emp_id) references Employee(emp_id) not null,
Rating int NOT NUll ,
comments varchar(255) ,
constraint fc_pk primary key (feedback_id ,patient_id))



-------------Insertion in feeedbacck -----------------------
CREATE PROCEDURE InsertFeedback
  @order_id INT,
  @patient_id int,
  @Rating INT,
  @Comment VARCHAR(255),
  @emp_id int
AS
BEGIN
  SET NOCOUNT ON;

  -- Check if the patient has placed an order for the given order ID
  IF EXISTS (SELECT 1 FROM Orders WHERE order_id = @order_id AND patient_id = @patient_id)
  BEGIN
    -- Check if the employee ID is valid
    IF EXISTS (SELECT 1 FROM Employee WHERE emp_id = @emp_id)
    BEGIN
      -- Insert the feedback into the Feedback table
      INSERT INTO Feedback(order_id, patient_id, emp_id, Rating, Comments)
      VALUES (@order_id, @patient_id, @emp_id, @Rating, @Comment);

      PRINT 'Feedback has been successfully inserted.';
    END
    ELSE
    BEGIN
      PRINT 'Invalid employee ID.';
    END
  END
  ELSE
  BEGIN
    PRINT 'The patient has not placed an order for the given order ID.';
  END
END;



exec InsertFeedback 1,1,9,'great',1

exec Listfeeedback

---------------execution of feedback through procedure--------------------
create procedure Listfeeedback
as
begin 
select feedback_id ,order_id, patient_id, Rating, Comments from feedback
end 

exec Listfeeedback


CREATE PROCEDURE updateFeedback
    @FeedbackID int,
    @Rating int,
    @Comment varchar(255)
AS
BEGIN
    -- Check if the feedback exists
    IF NOT EXISTS (SELECT 1 FROM Feedback WHERE feedback_id = @FeedbackID)
    BEGIN
        -- If the feedback does not exist, raise an error
        RAISERROR('Feedback with ID %d does not exist.', 16, 1, @FeedbackID);
        RETURN; -- Exit the procedure
    END

    -- Update the feedback
    UPDATE Feedback
    SET Rating = @Rating,
        Comments = @Comment
    WHERE feedback_id = @FeedbackID;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to update feedback with ID %d.', 16, 1, @FeedbackID);
    END
END
 exec updateFeedback 1,5,'nice'

 exec Listfeeedback



 CREATE PROCEDURE deleteFeedback
    @FeedbackID int
AS
BEGIN
    -- Check if the feedback exists
    IF NOT EXISTS (SELECT 1 FROM Feedback WHERE feedback_id = @FeedbackID)
    BEGIN
        -- If the feedback does not exist, raise an error
        RAISERROR('Feedback with ID %d does not exist.', 16, 1, @FeedbackID);
        RETURN; -- Exit the procedure
    END

    -- Delete the feedback
    DELETE FROM Feedback WHERE feedback_id = @FeedbackID;

    IF @@ROWCOUNT = 0
    BEGIN
        -- If no rows were affected, raise an error
        RAISERROR('Failed to delete feedback with ID %d.', 16, 1, @FeedbackID);
    END
END

exec deleteFeedback 1
