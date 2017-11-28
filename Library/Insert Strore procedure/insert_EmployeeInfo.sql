
/*exec insert_EmployeeInfo @EmployeeID=4 ,@FirstName='Bob' ,@LastName='Johansson' ,@Salary=42000 ,
@Email='bob@gmail.com' ,@Phone='22885412' ,@AddressID=5 ,@HashedPassword='password' ,@BranchID=1;*/


USE [Finallibrary]
GO
create procedure insert_EmployeeInfo(
		   @EmployeeID int,
           @FirstName varchar(50),
           @LastName varchar(50),
           @Salary float,
           @Email varchar(50),
           @Phone varchar(12),
		   @AddressID int,
           @HashedPassword varchar(30),
           @BranchID int)
as 
begin

INSERT INTO [dbo].[EmployeeInfo]
           ([EmployeeID]
           ,[FirstName]
           ,[LastName]
           ,[Salary]
           ,[Email]
           ,[Phone]
           ,[AddressID]
           ,[HashedPassword]
           ,[BranchID])
     VALUES
          (@EmployeeID ,
           @FirstName ,
           @LastName ,
           @Salary ,
           @Email ,
           @Phone ,
		   @AddressID ,
           @HashedPassword ,
           @BranchID )

		   end
GO