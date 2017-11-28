
/*exec insert_Comments @CommentsID=40010,@Comments='Nice',@BookID=5,@UserID=1001902500,@Score=4;*/


USE [Finallibrary]
GO
create procedure insert_Comments(
		@CommentsID int,
		@Comments varchar(255),
        @BookID int,
        @UserID varchar(11),
        @Score tinyint)
as 
begin

INSERT INTO [dbo].[Comments]
           ([CommentsID],
			[Comments],
			[BookID],
			[UserID],
			[Score])
     VALUES
           (@CommentsID,
			@Comments,
			@BookID,
			@UserID,
			@Score )

		   end
GO