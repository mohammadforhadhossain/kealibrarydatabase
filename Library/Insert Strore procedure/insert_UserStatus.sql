
/*exec insert_UserStatus @UserStatusID=2 ,@Status='Block' ;*/

USE [Finallibrary]
GO
create procedure insert_UserStatus(
			@UserStatusID int,
            @Status varchar(15)
)
as 
begin

INSERT INTO [dbo].[UserStatus]
           ([UserStatusID],
            [Status])
     VALUES
           (@UserStatusID ,
            @Status )

		   end
GO