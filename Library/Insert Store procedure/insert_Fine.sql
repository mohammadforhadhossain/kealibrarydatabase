
/*exec insert_Fine @FineID=80000 ,@LoanID=70000 ,@Amount=25.00 ,@IsPaid=1 ,@PaymentDate='2017-06-10 10:06:20.000';*/


USE [Finallibrary]
GO
create procedure insert_Fine(
		   @FineID int,
           @LoanID int,
           @Amount float,
           @IsPaid bit,
           @PaymentDate datetime)
as 
begin

INSERT INTO [dbo].[Fine]
           ([FineID]
           ,[LoanID]
           ,[Amount]
           ,[IsPaid]
           ,[PaymentDate])
     VALUES
           (@FineID ,
			@LoanID ,
			@Amount ,
			@IsPaid ,
			@PaymentDate)

		   end
GO