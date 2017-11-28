/*exec insert_bookauthor @AuthorID= 30000, @BookID= 6;*/

USE [Finallibrary]
GO
create procedure insert_bookauthor(
@AuthorID int,
@BookID int
)
as 
begin

INSERT INTO [dbo].[BookAuthor]
           ([AuthorID]
           ,[BookID]
		   )
     VALUES
           (@AuthorID,
			@BookID
			)
		   end
GO