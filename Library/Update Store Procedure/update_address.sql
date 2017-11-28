

/*exec update_address @AddressID =15, @Address ='Ruten 3, st tv', @ZipCode= '2700';*/

USE [Finallibrary]
GO
create procedure update_address(
@AddressID int,
@Address varchar(150),
@ZipCode varchar(8)
)
as 
begin

UPDATE [dbo].[Addresses]
   SET [AddressID] = @AddressID
      ,[Address] = @Address
      ,[ZipCode] = @ZipCode
		WHERE AddressID =@AddressID
 end
GO