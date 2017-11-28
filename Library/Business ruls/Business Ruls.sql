CREATE LOAN / RESERVATION
website:
	- book availabe => create loan, 7 days to pick up and update bookItem actual branch id to null
	- book not availabe => make reservation, add to reservation queue in the selected branch



library:
	- book not availabe => make reservation, add to reservation queue oin the selected branch
	- book available	- create loan, pick up date is now, and loan date is now 
				- pick up book from a created loan => update pickup date and expected return time and update bookItem actual branch id to null
	
System:
	- book returned => create loan, 7days to pick up 


libarairian:
	- The lady will get a view on her screen on books that are loaned and not picked up yet

RETURN BOOK

libarary: 
	- original branch: set book branchId to the return branch and create loan for first reserved in the picked up branch
	- not original branch: set book branchId to the return branch and add to transport book
	

FINE : 
	- event happens ever night checks all loans if the expected time is less than date now, if not than create a fine.
	- if fine is not payed than user is blocked.
