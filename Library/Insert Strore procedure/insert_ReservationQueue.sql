
/*exec insert_ReservationQueue @BookReservationID=60001 ,@BookID=1 ,@UserID='0101901100';*/

USE [Finallibrary]
GO
create procedure insert_ReservationQueue(
		   @BookReservationID int,
           @BookID int,
           @UserID varchar(11)
		   )
as 
begin

INSERT INTO [dbo].[ReservationQueue]
           ([BookReservationID]
           ,[BookID]
           ,ReservationDate
		   ,UserID
		   ,EmailSendDate)
     VALUES
           (@BookReservationID ,
			@BookID ,
			GETDATE(),
			@UserID,
			null
			)

		   end
GO