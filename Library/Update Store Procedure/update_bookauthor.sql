/*exec update_bookauthor @AuthorID= 30005, @BookID= 5;*/

/*select * from BookAuthor*/

USE [Finallibrary]
GO
create procedure update_bookauthor(
@AuthorID int,
@BookID int
)
as 
begin

UPDATE [dbo].[BookAuthor]
   SET [AuthorID] = @AuthorID
      ,[BookID] = @BookID
		WHERE BookID=@BookID
 end
GO
