
/*exec update_loan @LoanID= 70000, @BookItemID= 10000, @UserId = '0101901100',
@loanTime ='2017-05-08 12:35:29.123',@LoanPickupDate = '2017-05-08 12:35:29.123',@LoanReturnTime='2017-06-07 12:35:29.123', 
@LoanActualReturnTime= '2017-05-08 12:35:29.123';
*/

/*select * from Loan*/

USE [Finallibrary]
GO
create procedure update_loan(
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

UPDATE [dbo].[Loan]
   SET [LoanID] = @LoanID
      ,[BookItemID] = @BookItemID
      ,[UserID] = @UserID
      ,[LoanTime] = @LoanTime
	  ,[LoanPickupDate]=@LoanPickupDate
      ,[LoanReturnTime] = @LoanReturnTime
      ,[LoanActualReturnTime] = @LoanActualReturnTime
 WHERE LoanID = @LoanID
		   end
GO
