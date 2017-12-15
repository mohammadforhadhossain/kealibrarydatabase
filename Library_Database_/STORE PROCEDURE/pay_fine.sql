/* Pay Fine sotred procedure  TODO DELETE LOAN AND FINE*/
	

DROP PROCEDURE IF EXISTS pay_fine
GO
CREATE PROCEDURE pay_fine(
@UserID uniqueidentifier,
@FineID uniqueidentifier
)
AS  	

		BEGIN TRY
		BEGIN TRAN TRAN1											 		
		UPDATE FINE SET IsPaid = 1,PaymentDate = GETDATE() WHERE FineID = @FineID 		

		if((SELECT count(*) from Loan INNER JOIN FINE On FINE.LoanID = Loan.LoanID WHERE Loan.UserID = @UserID) = 0)
			BEGIN
				/* UNBLOCK USER */
				 UPDATE UserInfo SET UserStatusID = 1 WHERE UserID = @UserID;		
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
		
GO

