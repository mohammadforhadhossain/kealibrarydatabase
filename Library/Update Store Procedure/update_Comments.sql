
/*exec update_Comments @CommentsID=40008,@Comments='Basic level book',@BookID=4,@UserID=1001902500,@Score=3;*/


USE [Finallibrary]
GO
create procedure update_Comments(
		@CommentsID int,
		@Comments varchar(255),
        @BookID int,
        @UserID varchar(11),
        @Score tinyint)
as 
begin

UPDATE [dbo].[Comments]
   SET [CommentsID] = @CommentsID
      ,[Comments] = @Comments
      ,[BookID] = @BookID
      ,[UserID] = @UserID
      ,[Score] = @Score
 WHERE CommentsID = @CommentsID
 end
GO



