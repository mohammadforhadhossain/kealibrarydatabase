/*	
	- LOCKING : NO ISOLATION LEVEL IS REQIUREED HERE, BECAUSE WE KNOW THAT WHEN A BOOK IS RETURNED IT WILL NEVER BE UPDATED.

	- TRANANSACTION: NO TRANASACTION IS REQRUIED BECAUSE WE DO NOT HAVE ANY CONFILICTS 
*/
USE Library_Database_

DROP procedure if exists archiveLoan

GO
CREATE PROCEDURE archiveLoan(
@LoanID uniqueidentifier)
AS
				
	DECLARE @UserID uniqueidentifier, @BookItemID uniqueidentifier, @LoanActualReturnTime DATETIME;

	SELECT	@UserID = UserID,
			@BookItemID = BookItemID,
			@LoanActualReturnTime = LoanActualReturnTime
			FROM Loan WHERE LoanID = @LoanID;		

	print @LoanActualReturnTime

	INSERT INTO ArchivedLoan VALUES(@LoanID, @UserID, @BookItemID, @LoanActualReturnTime);

	IF NOT EXISTS(SELECT * FROM Fine WHERE LoanID = @LoanID) 
		DELETE FROM Loan WHERE LoanID = @LoanID
	
GO


/*SELECT * FROM Loan
SELECT * FROM ArchivedLoan WHERE LoanID = '68E0AEE1-0FEF-91E9-A859-00004AA2B459'
EXEC archiveLoan '68E0AEE1-0FEF-91E9-A859-00004AA2B459'*/


