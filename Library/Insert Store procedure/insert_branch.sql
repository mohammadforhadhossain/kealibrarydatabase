
/*exec insert_branch @BranchID= 3, @Name= 'N�rrebro Library', @AddressID= 15, @MaximumBookStorage= 50000;*/

USE [Finallibrary]
GO
create procedure insert_branch(
@BranchID int,
@Name varchar(100),
@AddressID int,
@MaximumBookStorage int
)
as 
begin

INSERT INTO [dbo].[Branch]
           ([BranchID]
           ,[Name]
		   ,[AddressID]
		   ,[MaximumBookStorage])
     VALUES
           (@BranchID,
			@Name,
			@AddressID,
			@MaximumBookStorage 
			)
		   end
GO