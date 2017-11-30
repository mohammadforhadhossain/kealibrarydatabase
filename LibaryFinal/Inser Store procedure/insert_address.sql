

/*exec insert_address @Address ='Ruten 3, st th', @ZipCode= '2700';*/
/*
select * from Addresses
*/
/*
select * from Zip
*/
USE [library_finall]
GO
create procedure insert_address(
@Address varchar(150),
@ZipCode varchar(8)
)
as 
begin

INSERT INTO [dbo].[Addresses]
           ([Address]
           ,[ZipCode])
     VALUES
           (@Address,
			@ZipCode 
			)
		   end
GO


