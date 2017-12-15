/* EXTEND LOAN 
	IT FORWARD PRTTY STRAIGHT
*/

DROP PROCEDURE IF EXISTS extend_loan
GO
CREATE PROCEDURE extend_loan(
@UserID uniqueidentifier,
@BookItemID uniqueidentifier = null
)
AS  								
		DECLARE @LoanID uniqueidentifier;
		DECLARE @BranchID uniqueidentifier;
		DECLARE @LoanCount int;
		DECLARE @DATENOW DATETIME;



		BEGIN TRY
			

			SET @DATENOW = GETDATE();
			SELECT @LoanID = LoanID,@BranchID = BranchID FROM Loan WHERE BookItemID = @BookItemID AND UserID = @UserID;
				
			/* CHECK IF IS IN TOP 3 */
				
			SELECT UserID FROM (SELECT TOP 3 UserID FROM ArchivedLoan WITH (ROWLOCK) WHERE BookItemID = @BookItemID ORDER BY ActualReturnTime DESC)T WHERE UserID = @UserID; 

			
			IF (@@ROWCOUNT > 2)						
				BEGIN
				SELECT 'You cannot extend the loan more than three time before returning the book' as ErrorMessage				
				END		
			ELSE
			BEGIN
				exec create_loan @BookItemID, @UserID, @BranchID,30,@DATENOW				
			END
			END TRY
		BEGIN CATCH

				
		PRINT 'Error detected during archiving loan, all changes reversed'
		 

	SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
	END CATCH

GO
