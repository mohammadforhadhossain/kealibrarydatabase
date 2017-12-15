/*
	LOCKING : NO LOCK IS REQUIRED HERE, THE PROCEDURE CREATE_LOAN HANDLES IT
	TRANSACTION : WE ONLY CALL THE SUB PROCEDURE SO NO TRANSACTION IS REQUIRED.
*/



DROP PROCEDURE IF EXISTS create_loan_website
GO
CREATE PROCEDURE create_loan_website(
@UserID uniqueidentifier,
@BranchID uniqueidentifier,
@BookID uniqueidentifier,
@LoanDuration INT = 7
)
AS  					
	/* SELECT BOOKITEM ID */

	DECLARE @BookItemID uniqueidentifier;


	SET @BookItemID = (SELECT TOP 1 BookItemID from BookItem Where BookID = @BookID AND IsAvailable = 1 AND BranchID = @BranchID);

	

	BEGIN TRY
	IF @BookItemID IS NOT NULL
		BEGIN 
			EXEC create_loan @BookItemID,@UserID,@BranchID,@LoanDuration
		END
	
	END TRY
	BEGIN CATCH						
			SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage	
	END CATCH		 											
GO

	