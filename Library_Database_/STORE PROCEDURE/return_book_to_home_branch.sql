/*
	STRAIGHT FORWARD NO NEED FOR ANYTHING
*/


DROP PROCEDURE IF EXISTS return_book_to_home_branch
GO
CREATE PROCEDURE return_book_to_home_branch(
@BookItemID uniqueidentifier,
@CurrentBranchID uniqueidentifier
)
AS  						
		UPDATE BookItem SET  CurrentBranchID = @CurrentBranchID, IsAvailable = 0 WHERE BookItemID = @BookItemID; 				
GO
