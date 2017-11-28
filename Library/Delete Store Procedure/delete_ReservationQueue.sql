/*exec delete_ReservationQueue @BookReservationID =60001;*/


/*select * from ReservationQueue*/

USE [Finallibrary]
GO
create procedure delete_ReservationQueue(
@BookReservationID int
)
as 
begin

DELETE FROM [dbo].[ReservationQueue]
      WHERE BookReservationID = @BookReservationID
 end
GO





