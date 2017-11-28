
/*exec update_ReservationQueue @BookReservationID=1003 ,@BookID=1 , @ReservationDate = '2017-11-24 16:45:53.067', 
@UserID='0101901100',@EmailSendDate = null;*/

/*select * from ReservationQueue*/

USE [Finallibrary]
GO
create procedure update_ReservationQueue(
		   @BookReservationID int,
           @BookID int,
		   @ReservationDate datetime,
           @UserID varchar(11),
		   @EmailSendDate datetime
		   )
as 
begin
UPDATE [dbo].[ReservationQueue]
   SET [BookReservationID] = @BookReservationID
      ,[BookID] = @BookID
      ,[ReservationDate] = @ReservationDate
      ,[UserID] = @UserID
      ,[EmailSendDate] = @EmailSendDate
	WHERE BookReservationID =@BookReservationID
 end
GO




