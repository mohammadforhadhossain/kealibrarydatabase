
/*exec update_employeeInfo @EmployeeID=3 ,@FirstName='Nomal Ali' ,@LastName='Khan' ,@Salary=42000 ,
@Email='nomanalikhan@gmail.com' ,@Phone='22885412' ,@AddressID=3 ,@HashedPassword='password' ,@BranchID=1;*/


USE [Finallibrary]
GO
create procedure update_employeeInfo(
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

UPDATE [dbo].[EmployeeInfo]
   SET [EmployeeID] = @EmployeeID
      ,[FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Salary] = @Salary
      ,[Email] = @Email
      ,[Phone] = @Phone
      ,[AddressID] = @AddressID
      ,[HashedPassword] = @HashedPassword
      ,[BranchID] = @BranchID
 WHERE EmployeeID = @EmployeeID

		   end
GO