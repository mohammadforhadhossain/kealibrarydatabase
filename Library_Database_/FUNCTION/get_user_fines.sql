/* LIST OF FINES FOR A SINGLE USER
	
	
	STRAIGHT FORWARD NO NEED FOR ANYTHING

	
	*/
USE Library_Database_
DROP FUNCTION IF EXISTS dbo.get_user_fines
GO
CREATE FUNCTION dbo.get_user_fines(@UserID uniqueidentifier)
RETURNS TABLE
	AS
		
		RETURN (SELECT FineID from Loan INNER JOIN FINE On FINE.LoanID = Loan.LoanID WHERE Loan.UserID = @UserID AND Fine.IsPaid = 0)

	GO
