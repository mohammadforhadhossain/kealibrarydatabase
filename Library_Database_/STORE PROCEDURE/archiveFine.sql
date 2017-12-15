/**
ARCHIVE THE FINE AFTER IT WAS PAYED
*/

CREATE PROCEDURE archiveFine(
@LoanID uniqueidentifier)
AS
BEGIN
	DECLARE
		@ErrorMessage AS NVARCHAR(1000),
		@ErrorNumber AS SMALLINT,
		@ErrorSeverity AS SMALLINT,
		@ErrorState AS SMALLINT,
		@ErrorProcedure AS SMALLINT,
		@ErrorLine AS SMALLINT

	BEGIN TRY
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION ONFINE
	
	DECLARE @fineID uniqueidentifier,@isPaid bit,@amount float,@paymentDate datetime

	SELECT @fineID=Fine.FineID,@loanID=Fine.LoanID,@amount=Fine.Amount,@isPaid=Fine.IsPaid,
	@paymentDate=Fine.PaymentDate FROM FINE WHERE @loanID=FINE.LoanID


	INSERT INTO ArchivedFine VALUES(@fineID,@loanID,@amount,@isPaid,@paymentDate);

	DELETE FROM Fine WHERE LoanID = @LoanID;
	
	COMMIT TRANSACTION ONFINE

	END TRY

	BEGIN CATCH
	
		SELECT
        @ErrorNumber=ERROR_NUMBER(),
        @ErrorSeverity=ERROR_SEVERITY(),
        @ErrorState=ERROR_STATE(),
        @ErrorProcedure=ERROR_PROCEDURE(),
        @ErrorLine=ERROR_LINE(),
        @ErrorMessage=ERROR_MESSAGE()

		ROLLBACK TRANSACTION ONFINE
		SET @ErrorMessage= 'Error detected during archiving Fine ' +@ErrorMessage
		RAISERROR ( @ErrorMessage,@ErrorSeverity, @ErrorState) WITH NOWAIT 

	 
	END CATCH
END
