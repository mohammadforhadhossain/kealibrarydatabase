
/*exec insert_Author @AuthorID =30010, @FirstName = 'Simon', @LastName= 'John';*/

select * from Author

USE [Finallibrary]
GO
create procedure insert_Author(
@AuthorID int,
@FirstName varchar(50),
@LastName varchar(50)
)
as 
begin
INSERT INTO [dbo].[Author]
           ([AuthorID]
           ,[FirstName]
           ,[LastName])
     VALUES
           (@AuthorID,
           @FirstName,
           @LastName)

		   end
GO