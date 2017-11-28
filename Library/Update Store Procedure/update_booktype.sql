
/*exec update_booktype @BookTypeID =20005, @TypeName = 'Medicle Science';*/


USE [Finallibrary]
GO
create procedure update_booktype(
@BookTypeID int,
@TypeName varchar(50)
)
as 
begin

UPDATE [dbo].[BookType]
   SET [BookTypeID] = @BookTypeID
      ,[TypeName] = @TypeName
 WHERE BookTypeID = @BookTypeID

		   end
GO


