
/*exec insert_zip @ZipCode ='2605', @City = 'Brøndby', @Country= 'Denmark';*/

USE [Finallibrary]
GO
create procedure insert_zip(
@ZipCode varchar(8),
@City varchar(50),
@Country varchar(50)
)
as 
begin

INSERT INTO [dbo].[Zip]
           ([ZipCode]
           ,[City]
           ,[Country])
     VALUES
           (@ZipCode,
			@City,
			@Country 
			)
		   end
GO


