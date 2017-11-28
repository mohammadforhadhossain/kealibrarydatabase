
/*exec update_book @BookID= 11, @Name= 'A Mind Reader', @PublishYear =2002, 
@IsbnNo='9783000617680', @Language='English',@BookTypeID= 20002;*/

USE [Finallibrary]
GO
create procedure update_book(
@BookID int,
@Name varchar(50),
@PublishYear smallint,
@IsbnNo varchar(13),
@Language varchar(13),
@BookTypeID int
)
as 
begin

UPDATE [dbo].[Book]
   SET [BookID] = @BookID
      ,[Name] = @Name
      ,[PublishYear] = @PublishYear
      ,[IsbnNO] = @IsbnNo
      ,[Language] = @Language
      ,[BookTypeID] = @BookTypeID
 WHERE BookID =@BookID

end
GO
