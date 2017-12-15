/* CANCEL RESERVATION
		PRETTY FORWARD	
	 */


DROP PROCEDURE IF EXISTS cancel_reservation
GO
CREATE PROCEDURE cancel_reservation(
@UserID uniqueidentifier,
@ReservationID uniqueidentifier = null,
@BookID uniqueidentifier = null
)
AS  										
	DELETE FROM ReservationQueue WHERE BookReservationID = @ReservationID							
GO
