DROP TABLE if exists Zip;

CREATE TABLE Zip(
  ZipCode varchar(8) not null,
  City varchar(50) not null,
  Country varchar(50) not null,
  primary key (ZipCode)
);

DROP TABLE if exists Addresses;

CREATE TABLE Addresses(
  AddressID int not null,
  Address varchar(150) not null,
  ZipCode varchar(8) not null,
  primary key (AddressID),
  foreign key (ZipCode) references Zip (ZipCode)
);

DROP TABLE if exists Branch;

CREATE TABLE Branch(
  BranchID int not null,
  Name varchar(100) not null,
  AddressID int not null,
  MaximumBookStorage int not null,
  primary key (BranchID),
  foreign key (AddressID ) references Addresses (AddressID)
);


DROP TABLE if exists EmployeeInfo;

CREATE TABLE EmployeeInfo (
  EmployeeID int not null,
  FirstName varchar(50) not null,
  LastName varchar(50),
  Salary float not null,
  Email varchar(50) not null unique,
  Phone varchar(12) not null,
  AddressID int,
  HashedPassword varchar(30),
  BranchID int,
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
  UserID varchar(11) not null,
  HashedPassword  varchar(128),
  FirstName varchar(50) not null,
  LastName varchar(50),
  Email varchar(50) not null unique,
  Phone varchar(12) not null,
  AddressID int ,
  BranchID  int ,
  UserStatusID int,
  primary key (UserID),
  foreign key (AddressID) references Addresses (AddressID),
  foreign key (BranchID) references Branch (BranchID),
  foreign key (UserStatusID) references UserStatus (UserStatusID)
);

drop table if exists BookType;
create table BookType(
BookTypeID int not null,
TypeName varchar(50) not null,
primary key (BookTypeID)
);

DROP TABLE if exists Book;

CREATE TABLE Book (
  BookID int not null,
  Name varchar(100) not null,
  PublishYear smallint,
  IsbnNO varchar(13) unique,
  Language varchar(20),
  BookTypeID int,
  primary key (BookID),
  foreign key (BookTypeID) references BookType (BookTypeID),
  
);

drop table if exists BookItem;

create table BookItem (
BookItemID int not null,
BranchID int not null,
BookID int not null,
IsAvailable bit not null,
LocationOnShelf varchar(10),
primary key (BookItemID),
Foreign key (BookID) references Book (BookID),
Foreign key (BranchID) references Branch (BranchID)
);


drop table if exists Author;

create table Author (
AuthorID int not null,
FirstName varchar(50) not null,
LastName varchar(50),
primary key (AuthorID)
);


drop table if exists Comments;

create table Comments (
CommentsID int not null,
Comments varchar(255) not null,
BookID 	int not null,
UserID	varchar(11) not null,
Score	tinyint,
primary key (CommentsID),
foreign key (BookID) references Book (BookID),
foreign key (UserID) references UserInfo (UserID) 
);


drop table if exists BookAuthor;

create table BookAuthor (
AuthorID int,
BookID	int not null,
foreign key (AuthorID) references Author (AuthorID) ,
foreign key (BookID) references Book (BookID) 
);

drop table if exists ReservationQueue;

create table ReservationQueue (
BookReservationID int not null,
BookID int not null,
ReservationDate	datetime not null,
UserID VARCHAR(11) NOT NULL, 
EmailSendDate DateTime NULL,
primary key (BookReservationID),
foreign key (BookID) references Book (BookID) ,
foreign key (UserID) references UserInfo (UserID) 
);
  
drop table if exists Loan;

create table Loan (
LoanID 	int not null,
BookItemID int not null,
UserID varchar(11)  not null,
LoanTime datetime not null,
LoanPickupDate datetime, 
LoanReturnTime datetime not null,
LoanActualReturnTime datetime,
primary key (LoanID),
foreign key (BookItemID) references BookItem (BookItemID) ,
foreign key (UserID) references UserInfo (UserID) 
);

DROP TABLE if exists Fine;

CREATE TABLE Fine (
  FineID int not null,
  LoanID int not null,
  Amount float,
  IsPaid bit not null,
  PaymentDate datetime not null,
  primary key (FineID ),
  foreign key (LoanID ) references Loan (LoanID)
);