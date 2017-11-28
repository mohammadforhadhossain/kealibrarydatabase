/*
select * from BookItem
*/
/*
select * from loan
*/
/*
select * from book
*/
/*
exec Create_loan_from_library @LoanID= 70004, @BookID= 1, @UserId = '0101901100', @BranchID=1;
*/

USE [Finallibrary]
GO
create procedure Create_loan_from_library(
@LoanID int,
@BookID int,
@UserID varchar(11),
@BranchID int
)
as 
begin

	/******Find user is active or not************/
	
	DECLARE @s INT;
	set @s = (select count(UserStatusID) from UserInfo
	where UserStatusID = 1 and UserID = @UserID)
	/*print @s;*/

	/*****************get the BookItemID if book is available********************************/
	DECLARE @d INT;
	set @d = (select top (1) BookItemID  from BookItem
	where BookID = @BookID and IsAvailable =1)
	
	/***condition user is active and BookItemID is available*********************************/
	if (@s = 1 AND @d is not null) 
		
	
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
			@d,
			@UserID,
			GETDATE(),
			GETDATE(),
			DATEADD(month, 1, GETDATE()),
			null
			)
			/*********Find book location**********************/
			DECLARE @blocation varchar(10);
			set @blocation = (select  LocationOnShelf from BookItem
			where BookItemID = @d)
			/****************execute book is not available********************************/
			exec update_BookItem @BookItemID =@d, @BranchID =@BranchID, 
			@BookID = @BookID, @IsAvailable= 0, @LocationOnShelf=@blocation;

			end
			
GO