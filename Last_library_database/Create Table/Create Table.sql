USE Last_library_database

DROP TABLE if exists Zip;

CREATE TABLE Zip(
  ZipCode varchar(8) not null,
  City varchar(50) not null,
  Country varchar(50) not null,
  primary key (ZipCode)
);

DROP TABLE if exists Addresses;

CREATE TABLE Addresses(
  AddressID uniqueidentifier not null DEFAULT newid(),
  Address varchar(150) not null,
  ZipCode varchar(8) not null,
  primary key (AddressID),
  foreign key (ZipCode) references Zip (ZipCode)
);

DROP TABLE if exists Branch;

CREATE TABLE Branch(
  BranchID uniqueidentifier not null DEFAULT newid(),
  Name varchar(100) not null,
  AddressID uniqueidentifier,
  MaximumBookStorage int not null,
  primary key (BranchID),  
  foreign key (AddressID ) references Addresses (AddressID)
);


DROP TABLE if exists EmployeeInfo;

CREATE TABLE EmployeeInfo (
  EmployeeID uniqueidentifier not null DEFAULT newid(),
  FirstName varchar(50) not null,
  LastName varchar(50),
  Salary float not null,
  Email varchar(50) not null unique,
  Phone varchar(12) not null,
  AddressID uniqueidentifier,
  HashedPassword varchar(30),
  BranchID uniqueidentifier,
  primary key (EmployeeID ),
  foreign key (AddressID) references Addresses (AddressID),
  foreign key (BranchID) references Branch (BranchID)
);

DROP TABLE if exists UserStatus;

CREATE TABLE UserStatus(
  UserStatusID int not null,
  Status varchar(15) not null,
  primary key (UserStatusID)
);

DROP TABLE if exists UserInfo;

CREATE TABLE UserInfo (
  UserID uniqueidentifier DEFAULT newid(),
  HashedPassword  varchar(128),
  FirstName varchar(50) not null,
  LastName varchar(50),
  Email varchar(50) not null unique,
  Phone varchar(12) not null,
  AddressID uniqueidentifier ,
  BranchID  uniqueidentifier,
  UserStatusID int,
  primary key (UserID),
  foreign key (AddressID) references Addresses (AddressID),
  foreign key (BranchID) references Branch (BranchID),
  foreign key (UserStatusID) references UserStatus (UserStatusID)
);

drop table if exists BookType;
create table BookType(
BookTypeID uniqueidentifier not null DEFAULT newid(),
TypeName varchar(50) not null,
primary key (BookTypeID)
);

DROP TABLE if exists Book;

CREATE TABLE Book (
  BookID uniqueidentifier not null DEFAULT newid(),
  Name varchar(100) not null,
  PublishYear smallint,
  IsbnNO varchar(13) unique,
  Language varchar(20),
  BookTypeID uniqueidentifier,
  primary key (BookID),
  foreign key (BookTypeID) references BookType (BookTypeID)

);

drop table if exists BookItem;
--BookItem should have an extra field isbookItemAvalible
create table BookItem (
BookItemID uniqueidentifier not null DEFAULT newid(),
BranchID uniqueidentifier not null,
BookID uniqueidentifier not null,
IsAvailable bit not null,
CurrentBranchID uniqueidentifier,
LocationOnShelfID varchar(10),
primary key (BookItemID),
Foreign key (BookID) references Book (BookID),
Foreign key (BranchID) references Branch (BranchID),
Foreign key (CurrentBranchID) references Branch (BranchID)
);


drop table if exists Author;

create table Author (
AuthorID uniqueidentifier not null DEFAULT newid(),
FirstName varchar(50) not null,
LastName varchar(50),
primary key (AuthorID)
);

drop table if exists Comments;

create table Comments (
CommentsID uniqueidentifier not null DEFAULT newid(),
Comments varchar(255) not null,
BookID 	uniqueidentifier,
UserID	uniqueidentifier,
Score	tinyint,
primary key (CommentsID),
foreign key (BookID) references Book (BookID),
foreign key (UserID) references UserInfo (UserID) 
);


drop table if exists BookAuthor;

create table BookAuthor (
AuthorID uniqueidentifier not null DEFAULT newid(),
BookID	uniqueidentifier,
foreign key (AuthorID) references Author (AuthorID) ,
foreign key (BookID) references Book (BookID) 
);

drop table if exists ReservationQueue;

create table ReservationQueue (
BookReservationID uniqueidentifier not null DEFAULT newid(),
BookID uniqueidentifier,
ReservationDate	datetime not null,
UserID uniqueidentifier NOT NULL, 
EmailSendDate DateTime NULL,
BranchToReservedID uniqueidentifier,
primary key (BookReservationID),
foreign key (BookID) references Book (BookID) ,
foreign key (UserID) references UserInfo (UserID),
foreign key (BranchToReservedID) references Branch(BranchID) 
);
  
drop table if exists Loan;

create table Loan (
LoanID 	uniqueidentifier not null DEFAULT newid(),
BookItemID uniqueidentifier not null,
UserID uniqueidentifier not null,
BranchID uniqueidentifier not null,
LoanTime datetime not null,
LoanPickupDate datetime, 
LoanReturnTime datetime not null,
LoanActualReturnTime datetime,
primary key (LoanID),
foreign key (BookItemID) references BookItem (BookItemID),
foreign key (UserID) references UserInfo (UserID),
foreign key (BranchID) references Branch (BranchID) 
);

DROP TABLE if exists Fine;

CREATE TABLE Fine (
  FineID uniqueidentifier not null DEFAULT newid(),
  LoanID uniqueidentifier not null,
  Amount float,
  IsPaid bit not null,
  PaymentDate datetime ,
  primary key (FineID ),
  foreign key (LoanID ) references Loan (LoanID)
);

DROP TABLE if exists ArchivedLoan;

CREATE TABLE ArchivedLoan (
  LoanID uniqueidentifier not null,
  UserID uniqueidentifier not null,
  BookItemID uniqueidentifier not null,
  ActualReturnTime datetime not null
);