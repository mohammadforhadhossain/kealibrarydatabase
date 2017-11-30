--exec Create_Archived_Fine
--drop procedure Create_Archived_Fine
create procedure Create_Archived_Fine
AS 
BEGIN 

Declare @fineID as uniqueidentifier,
		@loanID as uniqueidentifier,
		@amount as float,
		@isPaid as bit,
		@paymentDate as datetime

DECLARE @error_status BIT
SET @error_status = CONVERT(BIT, 0)
DECLARE @variable_containing_error AS VARCHAR
SET @variable_containing_error='Error detected creating fine, all change reversed'

Declare TempFine CURSOR FOR
 
Select * from  Fine where IsPaid=1 
 
OPEN TempFine
    FETCH NEXT FROM TempFine INTO @fineID,@loanID,@amount,@IsPaid,@paymentDate
        WHILE @@FETCH_STATUS = 0
        BEGIN
			BEGIN TRY
			
			SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

			BEGIN TRANSACTION CreateArchivedFine

 			INSERT INTO [dbo].ArchivedFine
           ([FineID]
		   ,[LoanID]
           ,[Amount]
           ,[IsPaid]
           ,[PaymentDate]
		   )
     VALUES
           (@fineID,
			@loanID,
			@amount,
			@isPaid,
			@paymentDate
			)
		
		--Update Fine
		Delete from Fine where FineID=@fineID

		COMMIT TRANSACTION CreateArchivedFine
		END TRY

		BEGIN CATCH
		ROLLBACK TRANSACTION CreateArchivedFine

		RAISERROR ('%s',1, 1, @variable_containing_error)
        SET @error_status = CONVERT(BIT, 1)
		END CATCH

		FETCH NEXT FROM TempFine INTO @fineID,@loanID,@amount,@IsPaid,@paymentDate
		
		END
    CLOSE TempFine
DEALLOCATE TempFine

IF @error_status = CONVERT(BIT, 1)
    RAISERROR ('See preceding errors(s).',16, 1)

END

--COMMIT TRANSACTION CreateArchivedFine

--END TRY

--BEGIN CATCH

--ROLLBACK TRANSACTION CreateArchivedFine
--PRINT 'Error detected creating fine, all change reversed'

--SELECT
--	ERROR_NUMBER() AS EroorNumber,
--	ERROR_SEVERITY() AS ErrorSeverity,
--	ERROR_STATE() as ErrorState,
--	ERROR_PROCEDURE () AS ErrorProcedure,
--	ERROR_LINE () AS ErrorLine,
--	ERROR_MESSAGE() AS ErrorMessage
--END CATCH
	

