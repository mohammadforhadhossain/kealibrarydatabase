/*
exec insert_bookauthor @AuthorID= '555D33D4-F0F2-445B-B7D8-F47757CD1213', @BookID= '0BD0C653-E8FB-4437-9F46-02B9C366B3A4';
*/
/*
	select * from Author
	select * from Book
	select * from BookAuthor
*/
USE [library_finall]
GO
create procedure insert_bookauthor
(
	@AuthorID uniqueidentifier,
	@BookID uniqueidentifier
)
as 
begin

INSERT INTO [dbo].[BookAuthor]
           (
		   [AuthorID]
           ,[BookID]
		   )
     VALUES
           (
		    @AuthorID,
			@BookID
			)
		   end
GO