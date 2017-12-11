/*	
	- LOCKING : NO ISOLATION LEVEL IS REQIUREED HERE, BECAUSE WE KNOW THAT WHEN A BOOK IS RETURNED IT WILL NEVER BE UPDATED.

	- TRANANSACTION: NO TRANASACTION IS REQRUIED BECAUSE WE DO NOT HAVE ANY CONFILICTS 
*/
DROP procedure if exists archiveLoan

USE [library_finall]
GO
CREATE PROCEDURE archiveLoan(
@LoanID uniqueidentifier)
AS
				
	DECLARE @UserID uniqueidentifier, 
	@BookItemID uniqueidentifier, 
	@LoanActualReturnTime DATETIME;

	SELECT	@UserID = UserID,
			@BookItemID = BookItemID,
			@LoanActualReturnTime = LoanActualReturnTime
			FROM Loan WHERE LoanID = @LoanID;		


	print @LoanActualReturnTime

	INSERT INTO ArchivedLoan VALUES(@LoanID, @UserID, @BookItemID, @LoanActualReturnTime);

	IF NOT EXISTS(SELECT * FROM Fine WHERE LoanID = @LoanID) 
		DELETE FROM Loan WHERE LoanID = @LoanID
	
GO


/*
SELECT * FROM Loan
SELECT * FROM ArchivedLoan WHERE LoanID = 'B93FA8D3-81E4-4D22-B5D8-6C6B46F7AF38'
EXEC archiveLoan 'B93FA8D3-81E4-4D22-B5D8-6C6B46F7AF38'
*/



