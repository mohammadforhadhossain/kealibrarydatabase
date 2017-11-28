
/*exec update_UserInfo @UserID='2801907700' ,@HashedPassword='password' ,@FirstName='Tofazzal' ,@LastName='Hossain' ,
		@Email='tofazzal@yahoo.com' , @Phone='21223301' ,@AddressID=7 ,@BranchID=1 ,@UserStatusID=1;*/


USE [Finallibrary]
GO
create procedure update_UserInfo(
		   @UserID varchar(11),
           @HashedPassword varchar(128),
           @FirstName varchar(50),
           @LastName varchar(50),
           @Email varchar(50),
           @Phone varchar(12),
           @AddressID int,
           @BranchID int,
           @UserStatusID int)
as 
begin

UPDATE [dbo].[UserInfo]
   SET [UserID] = @UserID
      ,[HashedPassword] = @HashedPassword
      ,[FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[Phone] = @Phone
      ,[AddressID] = @AddressID
      ,[BranchID] = @BranchID
      ,[UserStatusID] = @UserStatusID
	WHERE UserID=@UserID
end
GO

