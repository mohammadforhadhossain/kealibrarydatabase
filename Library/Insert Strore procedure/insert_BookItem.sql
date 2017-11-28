
/*exec insert_BookItem @BookItemID =10018, @BranchID=1, @BookID = 10, @IsAvailable= 1, @LocationOnShelf='LOC-010101';*/


USE [Finallibrary]
GO
create procedure insert_BookItem(
@BookItemID int,
@BranchID int,
@BookID int,
@IsAvailable bit,
@LocationOnShelf varchar(10)
)
as 
begin

INSERT INTO [dbo].[BookItem]
           ([BookItemID]
		   ,[BranchID]
           ,[BookID]
           ,[IsAvailable]
		   ,[LocationOnShelf])
     VALUES
           (@BookItemID,
		   @BranchID,
           @BookID,
           @IsAvailable,
		   @LocationOnShelf)

		   end
GO