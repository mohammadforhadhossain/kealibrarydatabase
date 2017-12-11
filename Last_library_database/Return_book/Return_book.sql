/*
	- LOCKING : WE ARE USING REPEATABLE READ BECAUSE WE DO NOT WANT TO SLEECT THE TOP USER TWICE IF TWO BOOKS ARE RETURN AT THE SAME TIME, AND WE ARE USING
		ROWLOCK BECAUSE WE DO NOT WANT TO BLOCK OTHER TRANCASCTIONS THAT SELECT TOP USER IN QUEUE FOR ANOTHER BOOK.
		
	- TRANSACTION: EVERYTHING IS INSIDE A TRANSACTION, BECAUSE WE HAVE MULTIPLE DML and we rollback the moment an error occurs.
*/

DROP PROCEDURE IF EXISTS return_book

USE Last_library_database

	GO		

create procedure return_book(
	@BookItemID uniqueidentifier,
	@CurrentBranchID uniqueidentifier,
	@LoanDuration int = 7)
	as 
	begin		
			

		DECLARE @OriginalBranchId uniqueidentifier;
		DECLARE @BookId uniqueidentifier;
		DECLARE @LoanID uniqueidentifier;
		DECLARE @TopUserOnQueueId uniqueidentifier;
		DECLARE @TopReservationID uniqueidentifier;
				
		SET @LoanID = (SELECT LoanID from Loan WHERE BookItemID = @BookItemID AND LoanActualReturnTime IS NOT NULL);
		SET @OriginalBranchId = (SELECT BranchID from BookItem WHERE @BookItemID = BookItemID);
		SET @BookId = (SELECT BookID from BookItem WHERE @BookItemID = BookItemID );
						
		BEGIN TRY

		SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

		BEGIN TRANSACTION TRAN1


			UPDATE Loan SET LoanActualReturnTime = GETDATE() WHERE LoanID = @LoanID; 

			UPDATE BookItem SET CurrentBranchID = @CurrentBranchID WHERE BookItemID = @BookItemID;			

			/* ARCHIVE LOAN */			
			EXEC archiveLoan @LoanID; 
			


			IF(@OriginalBranchId = @CurrentBranchID)
				BEGIN								

					UPDATE BookItem SET IsAvailable = 1 WHERE BookItemID = @BookItemID
					/* TAKE TOP GUY FROM QUEUE ON THIS BOOK ITEM */		
					SELECT TOP 1 @TopUserOnQueueId = UserID, @TopReservationID = BookReservationID FROM ReservationQueue WITH (ROWLOCK)
											 WHERE BookID = @BookId									 
											 ORDER By ReservationDate;
											 					
					IF (@TopUserOnQueueId IS NOT NULL)																
						BEGIN
							EXEC create_loan @BookItemId, @TopUserOnQueueId, @OriginalBranchId, @LoanDuration
							/* REMOVE TOP USER FORM QUEUE , || CHANGE TO ARCHIVE PROC WHEN READY */						
							DELETE FROM ReservationQueue WHERE BookReservationID = @TopReservationID				
						END

				END			
				

			COMMIT TRAN TRAN1
			END TRY
			BEGIN CATCH				
				ROLLBACK TRAN TRAN1

						SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
			END CATCH
		END
GO