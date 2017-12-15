/*
	- LOCKING : WE CHOOSE ISOLATION LEVEL OF REPEATABLE READ BECAUSE WE DON'T WANT TWO TRANSACTIONS TO SELECT IF THE BOOK IS AVAILABLE AT THE SAME TIME
	- TRANSACTION: WE NEED IT BECAUSE DO AN INSERT AND AN UPDATE FOLLOWING IT, IF UPDATE GOES WRONG THEN INSERT IS ROLLED BACK
*/

USE Library_Database_
DROP PROCEDURE IF EXISTS create_loan
GO
CREATE PROCEDURE create_loan(

@BookItemID uniqueidentifier,
@UserID uniqueidentifier,
@BranchID uniqueidentifier,
@LoanDuration INT,
@PickUpDate DATETIME = NULL
)
AS  		
	
DECLARE @isUserActive INT;
DECLARE @isBookAvailable INT;

	SET @isUserActive = (SELECT count(UserStatusID) FROM UserInfo
	WHERE UserStatusID = 1 and UserID = @UserID);
	

	BEGIN TRY
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	BEGIN TRAN T1
	IF (@isUserActive = 1) 										
		BEGIN			
			INSERT INTO [dbo].[Loan]
					([BookItemID]
					,[BranchID]
					,[UserID]
					,[LoanReturnTime]
					,[LoanTime]
					,[LoanActualReturnTime]
					,[LoanPickupDate]
					)
					VALUES
					(
					@BookItemID,
					@BranchID,
					@UserID,
					DATEADD(DAY, @LoanDuration, GETDATE()),
					GETDATE(),
					null,
					@PickUpDate
					);				
			SET @isBookAvailable  = (SELECt IsAvailable FROM BookItem WHERE BookItemID = @BookItemID);

			IF (@isBookAvailable = 1)							
				BEGIN
					UPDATE BookItem SET IsAvailable = 0 WHERE BookItemID = @BookItemID				
					COMMIT  TRAN T1;	
				END				
			ELSE
				BEGIN					
					ROLLBACK TRAN T1				
					PRINT 'BOOK NOT AVAILABLE, '
				END
		END		
	ELSE 		
		BEGIN
			SELECT 'USER BLOCKED OR NOT FOUND' as errorMessage;								
				ROLLBACK TRAN T1;	
		END
	END TRY
	BEGIN CATCH
			SELECT 'UNEXPECTED ERROR' as errorMessage
			ROLLBACK TRAN T1;	
			SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage	
	END CATCH		 											
GO
