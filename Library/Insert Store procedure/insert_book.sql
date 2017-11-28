


/*exec insert_book @BookID= 11, @Name= 'A Beautyfil Mind', @PublishYear =2010, 
@IsbnNo='9783000617680', @Language='English',@BookTypeID= 20002;*/

USE [Finallibrary]
GO
create procedure insert_book(
@BookID int,
@Name varchar(50),
@PublishYear smallint,
@IsbnNo varchar(13),
@Language varchar(13),
@BookTypeID int
)
as 
begin

INSERT INTO [dbo].[Book]
           ([BookID]
           ,[Name]
           ,[PublishYear]
		   ,[IsbnNO]
		   ,[Language]
		   ,[BookTypeID])
     VALUES
           (@BookID,
			@Name,
			@PublishYear,
			@IsbnNo,
			@Language,
			@BookTypeID 
			)
		   end
GO