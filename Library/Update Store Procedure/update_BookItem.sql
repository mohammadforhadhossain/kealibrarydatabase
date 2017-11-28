
/*exec update_BookItem @BookItemID =10010,@BranchID=1, @BookID = 4, @IsAvailable= 1,@LocationOnShelf = 'LOC-200001';*/

/*select * from BookItem*/

USE [Finallibrary]
GO
create procedure update_BookItem(
@BookItemID int,
@BranchID int,
@BookID int,
@IsAvailable bit,
@LocationOnShelf varchar(10)
)
as 
begin

UPDATE [dbo].[BookItem]
   SET [BookItemID] = @BookItemID
	  ,[BranchID] =@BranchID
      ,[BookID] = @BookID
      ,[IsAvailable] = @IsAvailable
	  ,[LocationOnShelf] = @LocationOnShelf
		WHERE BookItemID =  @BookItemID
end
GO

