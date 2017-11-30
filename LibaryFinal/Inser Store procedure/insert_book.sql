/*
exec insert_book @Name= 'A Mind Reader', @PublishYear =2010, 
@IsbnNo='9783000617680', @Language='English',@BookTypeID= 'B93FA8D3-81E4-4D22-B5D8-6C6B46F7AF14';
*/
/*
select * from Book
select * from BookItem
select * from BookType
*/
USE [library_finall]
GO
create procedure insert_book(
@Name varchar(50),
@PublishYear smallint,
@IsbnNo varchar(13),
@Language varchar(13),
@BookTypeID uniqueidentifier
)
as 
begin

INSERT INTO [dbo].[Book]
           (
			[Name]
           ,[PublishYear]
		   ,[IsbnNO]
		   ,[Language]
		   ,[BookTypeID])
     VALUES
           (
			@Name,
			@PublishYear,
			@IsbnNo,
			@Language,
			@BookTypeID 
			)
		   end
GO