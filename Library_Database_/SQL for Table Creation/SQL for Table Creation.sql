use Library_Database_

DROP TABLE IF EXISTS Zip;

CREATE TABLE Zip(
  ZipCode VARCHAR(8) NOT NULL,
  City VARCHAR(50) NOT NULL,
  Country VARCHAR(50) NOT NULL,
  PRIMARY KEY (ZipCode)
);

DROP TABLE IF EXISTS Addresses;

CREATE TABLE Addresses(
  AddressID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
  Address VARCHAR(150) NOT NULL,
  ZipCode VARCHAR(8) NOT NULL,
  PRIMARY KEY (AddressID),
  FOREIGN KEY (ZipCode) REFERENCES Zip (ZipCode)
);

DROP TABLE IF EXISTS Branch;

CREATE TABLE Branch(
  BranchID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
  Name VARCHAR(100) NOT NULL,
  AddressID UNIQUEIDENTIFIER,
  MaximumBookStorage INT NOT NULL,
  PRIMARY KEY (BranchID),  
  FOREIGN KEY (AddressID ) REFERENCES Addresses (AddressID)
);


DROP TABLE IF EXISTS EmployeeInfo;

CREATE TABLE EmployeeInfo (
  EmployeeID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Salary FLOAT NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Phone VARCHAR(12) NOT NULL,
  AddressID UNIQUEIDENTIFIER NOT NULL,
  HashedPassword VARCHAR(30) NOT NULL,
  BranchID UNIQUEIDENTIFIER NOT NULL,
  PRIMARY KEY (EmployeeID ),
  FOREIGN KEY (AddressID) REFERENCES Addresses (AddressID),
  FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
);

DROP TABLE if EXISTS UserStatus;

CREATE TABLE UserStatus(
  UserStatusID INT NOT NULL,
  Status VARCHAR(15) NOT NULL,
  PRIMARY KEY (UserStatusID)
);

DROP TABLE if EXISTS UserInfo;

CREATE TABLE UserInfo (
  UserID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID(),
  HashedPassword  VARCHAR(128) NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Phone VARCHAR(12) NOT NULL,
  AddressID UNIQUEIDENTIFIER NOT NULL,
  BranchID  UNIQUEIDENTIFIER NOT NULL,
  UserStatusID int NOT NULL,
  PRIMARY KEY (UserID),
  FOREIGN KEY (AddressID) REFERENCES Addresses (AddressID),
  FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
  FOREIGN KEY (UserStatusID) REFERENCES UserStatus (UserStatusID)
);

DROP TABLE IF EXISTS BookType;

CREATE TABLE BookType(
BookTypeID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
TypeName VARCHAR(50) NOT NULL,
PRIMARY KEY NONCLUSTERED (BookTypeID)
);

DROP TABLE IF EXISTS Book;

CREATE TABLE Book (
  BookID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
  Name VARCHAR(100) NOT NULL,
  PublishYear SMALLINT NOT NULL,
  IsbnNO VARCHAR(13) NOT NULL UNIQUE,
  Language VARCHAR(20) NOT NULL,
  BookTypeID UNIQUEIDENTIFIER,
  PRIMARY KEY NONCLUSTERED (BookID),
  FOREIGN KEY (BookTypeID) REFERENCES BookType (BookTypeID),
  
);

DROP TABLE IF EXISTS BookItem;

CREATE TABLE BookItem (
BookItemID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
BranchID UNIQUEIDENTIFIER NOT NULL,
BookID UNIQUEIDENTIFIER NOT NULL,
IsAvailable BIT NOT NULL,
CurrentBranchID UNIQUEIDENTIFIER NOT NULL,
LocationOnShelfID VARCHAR(10) NOT NULL,
PRIMARY KEY (BookItemID),
FOREIGN KEY (BookID) REFERENCES Book (BookID),
FOREIGN KEY (BranchID) REFERENCES Branch (BranchID),
FOREIGN KEY (CurrentBranchID) REFERENCES Branch (BranchID)
);

DROP TABLE IF EXISTS Author;

CREATE TABLE Author (
AuthorID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
PRIMARY KEY (AuthorID)
);

DROP TABLE IF EXISTS Comments;

CREATE TABLE Comments (
CommentsID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
Comments VARCHAR(255) NOT NULL,
BookID 	UNIQUEIDENTIFIER NOT NULL,
UserID	UNIQUEIDENTIFIER NOT NULL,
Score TINYINT,
PRIMARY KEY (CommentsID),
FOREIGN KEY (BookID) REFERENCES Book (BookID),
FOREIGN KEY (UserID) REFERENCES UserInfo (UserID) 
);

DROP TABLE IF EXISTS BookAuthor;

CREATE TABLE BookAuthor (
AuthorID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
BookID	UNIQUEIDENTIFIER,
FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID) ,
FOREIGN KEY (BookID) REFERENCES Book (BookID) 
);

drop table if exists ReservationQueue;

CREATE TABLE ReservationQueue (
BookReservationID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
BookID UNIQUEIDENTIFIER NOT NULL,
ReservationDate	DATETIME NOT NULL,
UserID UNIQUEIDENTIFIER NOT NULL, 
BranchToReservedID UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY (BookReservationID),
FOREIGN KEY (BookID) REFERENCES Book (BookID) ,
FOREIGN KEY (UserID) REFERENCES UserInfo (UserID),
FOREIGN KEY (BranchToReservedID) REFERENCES Branch(BranchID) 
);
  
DROP TABLE IF EXISTS Loan;

CREATE TABLE Loan (
LoanID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
BookItemID UNIQUEIDENTIFIER NOT NULL,
UserID UNIQUEIDENTIFIER NOT NULL,
BranchID UNIQUEIDENTIFIER NOT NULL,
LoanTime DATETIME NOT NULL,
LoanPickupDate DATETIME, 
LoanReturnTime DATETIME NOT NULL,
LoanActualReturnTime DATETIME,
PRIMARY KEY (LoanID),
FOREIGN KEY (BookItemID) REFERENCES BookItem (BookItemID),
FOREIGN KEY (UserID) REFERENCES UserInfo (UserID),
FOREIGN KEY (BranchID) REFERENCES Branch (BranchID) 
);

DROP TABLE IF EXISTS Fine;

CREATE TABLE Fine (
  FineID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
  LoanID UNIQUEIDENTIFIER NOT NULL,
  Amount FLOAT,
  IsPaid BIT NOT NULL,
  PaymentDate DATETIME,
  PRIMARY KEY (FineID ),
  FOREIGN KEY (LoanID ) REFERENCES Loan (LoanID)
);

DROP TABLE IF EXISTS ArchivedLoan;

CREATE TABLE ArchivedLoan (
  LoanID UNIQUEIDENTIFIER NOT NULL,
  UserID UNIQUEIDENTIFIER NOT NULL,
  BookItemID UNIQUEIDENTIFIER NOT NULL,
  ActualReturnTime DATETIME NOT NULL
);

CREATE TABLE ArchivedFine (
  FineID uniqueidentifier not null ,
  LoanID uniqueidentifier not null,
  Amount float,
  IsPaid bit not null,
  PaymentDate datetime   
);