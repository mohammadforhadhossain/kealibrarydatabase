-- find out the name of your default constraint - 
-- assuming this is the only default constraint on your table
DECLARE @defaultconstraint sysname

SELECT @defaultconstraint = NAME 
FROM sys.default_constraints 
WHERE parent_object_id = object_ID('dbo.ReservationQueue')

-- declare a "DROP" statement to drop that default constraint
DECLARE @DropStmt NVARCHAR(500)

SET @DropStmt = 'ALTER TABLE dbo.ReservationQueue DROP CONSTRAINT ' + @defaultconstraint

-- drop the constraint
EXEC(@DropStmt)

-- alternatively: if you know the name of the default constraint - you can do this
-- more easily just by executing this single line of T-SQL code:

-- ALTER TABLE dbo.mytable DROP CONSTRAINT (fill in name of constraint here)

-- modify the column's datatype        
ALTER TABLE dbo.ReservationQueue
/*Alter Column LoanActualReturnTime datetime*/
ADD UserID VARCHAR(11) NOT NULL, EmailSendDate DateTime NULL
foreign key (UserID) references UserInfo (UserID) on delete cascade ;  

-- re-apply a default constraint - hint: give it a sensible name!
ALTER TABLE dbo.ReservationQueue
ADD CONSTRAINT DF_RQ_RQID DEFAULT 1 FOR BookReservationID