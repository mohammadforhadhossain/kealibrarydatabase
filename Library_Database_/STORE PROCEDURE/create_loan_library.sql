/*
	LOCKING: WE DO NOT NEED LOCKING BECAUSE WE HAVE A IF ELSE STATEMENT SO WE DO NOT EXECUTE TWO TRANASCTIONS IN THE SAME QUERY, AS FOR THE LOAN ID, IT IS UNIQUE
		AND WILL NEVER BE SELECTED TWICE AT THE SAME TIME
	TRANSACTION: WE DO NEED REQUIRE IT BECAUSE IT IS THE SAME AS ABOVE
*/



DROP PROCEDURE IF EXISTS create_loan_library
GO
CREATE PROCEDURE create_loan_library(

@UserID uniqueidentifier,
@BookItemID uniqueidentifier,
@BranchID uniqueidentifier,
@LoanDuration INT = 30

)
AS  		
	

	DECLARE @LoanID uniqueidentifier;
	DECLARE @PickUpDateNow DATETIME;
	SET @PickUpDateNow = GETDATE();


	SET @LoanID = (SELECT l.LoanID FROM Loan as l WHERE l.BookItemID = @BookItemID AND l.LoanPickupDate is null);

	BEGIN TRY
	

	/*  IF LOANED FROM WEB SITE  */
	IF @LoanID IS NOT NULL		
		BEGIN
			UPDATE Loan SET LoanPickupDate = GETDATE() WHERE LoanID = @LoanID; 							
		END
	/* IF NOT LOANED FROM WEB SITE*/	
	ELSE 
		BEGIN		
			EXEC create_loan @BookItemID, @UserID, @BranchID, @LoanDuration, @PickUpDateNow
		END
		
	END TRY
	BEGIN CATCH
			SELECT 'UNEXPECTED ERROR' as errorMessage			
			SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage	
	END CATCH		 											
GO
