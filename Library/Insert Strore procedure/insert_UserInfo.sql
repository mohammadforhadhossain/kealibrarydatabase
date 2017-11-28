
/*exec insert_UserInfo @UserID='2801907800' ,@HashedPassword='password' ,@FirstName='Nina' ,@LastName='Nikolaj' ,
		@Email='nina@yahoo.com' , @Phone='68658974' ,@AddressID=7 ,@BranchID=1 ,@UserStatusID=1;*/

USE [Finallibrary]
GO
create procedure insert_UserInfo(
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

INSERT INTO [dbo].[UserInfo]
          ([UserID],
           [HashedPassword],
           [FirstName],
           [LastName],
           [Email],
           [Phone],
           [AddressID],
           [BranchID],
           [UserStatusID])
     VALUES
          (@UserID ,
           @HashedPassword ,
           @FirstName ,
           @LastName ,
           @Email ,
           @Phone ,
           @AddressID ,
           @BranchID ,
           @UserStatusID)

		   end
GO