
/*
exec delete_loan @LoanID=70000
*/
/*
select * from Fine
select * from Loan
*/
USE [Finallibrary]
GO
create procedure delete_loan(
@LoanID varchar(11)
)
as 
begin

DELETE FROM [dbo].[Loan]
      WHERE LoanID = @LoanID
end
GO

