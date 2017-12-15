/*
	STRAIGHT FORWARD NO NEED FOR ANYTHING
*/


/*DROP PROCEDURE IF EXISTS reserve_book*/
GO
CREATE PROCEDURE reserve_book(
@UserID uniqueidentifier,
@BranchID uniqueidentifier,
@BookID uniqueidentifier
)
AS  					
	
	INSERT INTO ReservationQueue (BookID,ReservationDate,UserID,BranchToReservedID) VALUES
								 (@BookID,GETDATE(),@UserID,@BranchID)							
										
GO