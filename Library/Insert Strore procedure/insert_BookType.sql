
/*exec insert_BookType @BookTypeID =20010, @TypeName = 'Computer Science';*/


USE [Finallibrary]
GO
create procedure insert_BookType(
@BookTypeID int,
@TypeName varchar(50)
)
as 
begin

INSERT INTO [dbo].[BookType]
           ([BookTypeID],
			[TypeName])
     VALUES
           (@BookTypeID,
           @TypeName)

		   end
GO