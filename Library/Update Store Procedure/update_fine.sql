
/*exec update_fine @FineID = 80000,
@LoanID = 70000 ,
@Amount = 35.35,
@IsPaid = 1 ,
@PaymentDate = '2017-05-08 12:35:29.123';*/

/*select * from Fine*/

USE [Finallibrary]
GO
create procedure update_fine(
@FineID int,
@LoanID int,
@Amount float,
@IsPaid bit,
@PaymentDate datetime
)
as 
begin

UPDATE [dbo].[Fine]
   SET [FineID] = @FineID
      ,[LoanID] = @LoanID
      ,[Amount] = @Amount
      ,[IsPaid] = @IsPaid
      ,[PaymentDate] = @PaymentDate
 WHERE FineID = @FineID
end
GO
