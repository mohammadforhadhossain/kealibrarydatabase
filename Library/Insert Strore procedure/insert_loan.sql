/*
exec insert_loan @LoanID= 70010, @BookItemID= 10000, @UserId = '0101901100',
@loanTime ='2017-05-08 12:35:29.123',@LoanPickupDate = NULL,@LoanReturnTime='2017-06-07 12:35:29.123', 
@LoanActualReturnTime= NULL;

*/



USE [Finallibrary]
GO
create procedure insert_loan(
@LoanID int,
@BookItemID int,
@UserID varchar(11),
@loanTime datetime,
@LoanPickupDate datetime,
@LoanReturnTime datetime,
@LoanActualReturnTime datetime
)
as 
begin

INSERT INTO [dbo].[Loan]
           ([LoanID]
           ,[BookItemID]
           ,[UserID]
		   ,[LoanTime]
		   ,[LoanPickupDate]
		   ,[LoanReturnTime]
		   ,[LoanActualReturnTime]
		   )
     VALUES
           (@LoanID,
			@BookItemID,
			@UserID,
			@loanTime,
			@LoanPickupDate,
			@LoanReturnTime,
			@LoanActualReturnTime
			)
		   end
GO