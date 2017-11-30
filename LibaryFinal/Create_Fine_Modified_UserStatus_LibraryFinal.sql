--exec Create_Fine_Modified_UserStatus
--drop procedure Create_Fine_Modified_UserStatus
create procedure Create_Fine_Modified_UserStatus 
AS 
BEGIN 
--TRY
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--BEGIN TRANSACTION CREATEFINE

Declare @loanID as uniqueidentifier
Declare @loanReturnTime as datetime

DECLARE @error_status BIT
SET @error_status = CONVERT(BIT, 0)
DECLARE @variable_containing_error AS VARCHAR
SET @variable_containing_error='Error detected creating fine, all change reversed'
 
Declare TempLoan CURSOR FOR
 
Select LoanID,LoanReturnTime from  Loan where LoanActualReturnTime is null 
 
OPEN TempLoan
    FETCH NEXT FROM TempLoan INTO @loanID ,@loanReturnTime
        WHILE @@FETCH_STATUS = 0
        BEGIN
			BEGIN TRY
			
			SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

			BEGIN TRANSACTION CREATEFINE
			
 IF(GETDATE()>@loanReturnTime)
            if not exists (select LoanID from Fine where Fine.LoanID=@loanID)
			
			INSERT INTO [dbo].[Fine]
           ([LoanID]
           ,[Amount]
           ,[IsPaid]
           ,[PaymentDate]
		   )
     VALUES
           (@loanID,
			25.00,
			0,
			null)
		Update UserInfo
		set UserStatusID=2
		where UserID IN (select UserInfo.UserID from UserInfo inner join Loan 
		on UserInfo.UserID=Loan.UserID inner join Fine 
		on Loan.LoanID=Fine.LoanID where Fine.LoanID=@loanID)
       	
		COMMIT TRANSACTION CREATEFINE
		END TRY

		BEGIN CATCH
		ROLLBACK TRANSACTION CREATEFINE

		RAISERROR ('%s',1, 1, @variable_containing_error)
        SET @error_status = CONVERT(BIT, 1)
		END CATCH

		FETCH NEXT FROM TempLoan INTO @loanID ,@loanReturnTime
        END
    CLOSE TempLoan
DEALLOCATE TempLoan

IF @error_status = CONVERT(BIT, 1)
    RAISERROR ('See preceding errors(s).',16, 1)

END

--COMMIT TRANSACTION CREATEFINE

--END TRY

--BEGIN CATCH

--ROLLBACK TRANSACTION CREATEFINE
--PRINT 'Error detected creating fine, all change reversed'

--SELECT
--	ERROR_NUMBER() AS EroorNumber,
--	ERROR_SEVERITY() AS ErrorSeverity,
--	ERROR_STATE() as ErrorState,
--	ERROR_PROCEDURE () AS ErrorProcedure,
--	ERROR_LINE () AS ErrorLine,
--	ERROR_MESSAGE() AS ErrorMessage
--END CATCH 