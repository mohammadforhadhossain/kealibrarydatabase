
/*exec update_Author @AuthorID =30009, @FirstName = 'Mohammad', @LastName= 'Ali';*/

/*select * from Author*/

USE [Finallibrary]
GO
create procedure update_Author(
@AuthorID int,
@FirstName varchar(50),
@LastName varchar(50)
)
as 
begin
UPDATE [dbo].[Author]
   SET [AuthorID] = @AuthorID
      ,[FirstName] = @FirstName
      ,[LastName] = @LastName
		WHERE AuthorID = @AuthorID

end
GO