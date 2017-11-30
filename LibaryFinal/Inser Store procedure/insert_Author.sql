
/*
exec insert_Author @FirstName = 'Simon', @LastName= 'John';
*/
/*
select * from Author
*/


USE [library_finall]
GO
create procedure insert_Author(
@FirstName varchar(50),
@LastName varchar(50)
)
as 
begin
INSERT INTO [dbo].[Author]
           (
		   [FirstName]
           ,[LastName]
		   )
     VALUES
           (
		   @FirstName,
           @LastName
		   )

		   end
GO