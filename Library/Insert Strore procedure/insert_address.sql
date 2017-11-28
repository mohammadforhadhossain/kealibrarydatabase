

/*exec insert_address @AddressID =15, @Address ='Ruten 3, st th', @ZipCode= '2700';*/

USE [Finallibrary]
GO
create procedure insert_address(
@AddressID int,
@Address varchar(150),
@ZipCode varchar(8)
)
as 
begin

INSERT INTO [dbo].[Addresses]
           ([AddressID]
           ,[Address]
           ,[ZipCode])
     VALUES
           (@AddressID,
			@Address,
			@ZipCode 
			)
		   end
GO


