
/*exec update_branch @BranchID= 3, @Name= 'Nørrebro Library', @AddressID= 15, @MaximumBookStorage = 80000;*/


USE [Finallibrary]
GO
create procedure update_branch(
@BranchID int,
@Name varchar(100),
@AddressID int,
@MaximumBookStorage int
)
as 
begin

UPDATE [dbo].[Branch]
   SET [BranchID] = @BranchID
      ,[Name] = @Name
      ,[AddressID] = @AddressID
	  ,[MaximumBookStorage] = @MaximumBookStorage
 WHERE BranchID = @BranchID
 
 end
GO



