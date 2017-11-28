INSERT INTO Zip VALUES ( '1000', 'Copenhagen K', 'Denmark');
INSERT INTO Zip VALUES ( '1100', 'Copenhagen K', 'Denmark');
INSERT INTO Zip VALUES ( '1200', 'Copenhagen K', 'Denmark');
INSERT INTO Zip VALUES ( '1300', 'Copenhagen K', 'Denmark');
INSERT INTO Zip VALUES ( '1400', 'Copenhagen K', 'Denmark');
INSERT INTO Zip VALUES ( '1500', 'Copenhagen V', 'Denmark');
INSERT INTO Zip VALUES ( '1600', 'Copenhagen V', 'Denmark');
INSERT INTO Zip VALUES ( '1700', 'Copenhagen V', 'Denmark');
INSERT INTO Zip VALUES ( '1800', 'Frederiksberg C', 'Denmark');
INSERT INTO Zip VALUES ( '1900', 'Frederiksberg C', 'Denmark');
INSERT INTO Zip VALUES ( '2000', 'Frederiksberg', 'Denmark');
INSERT INTO Zip VALUES ( '2100', 'Copenhagen Ø', 'Denmark');
INSERT INTO Zip VALUES ( '2150', 'Nordhavn', 'Denmark');
INSERT INTO Zip VALUES ( '2200', 'Copenhagen N', 'Denmark');
INSERT INTO Zip VALUES ( '2300', 'Copenhagen S', 'Denmark');
INSERT INTO Zip VALUES ( '2400', 'Copenhagen NV', 'Denmark');
INSERT INTO Zip VALUES ( '2450', 'Copenhagen SV', 'Denmark');
INSERT INTO Zip VALUES ( '2500', 'Valby', 'Denmark');
INSERT INTO Zip VALUES ( '2600', 'Glostrup', 'Denmark');
INSERT INTO Zip VALUES ( '2700', 'Brønshøj', 'Denmark');


INSERT INTO Addresses VALUES (1, 'Ruten 1, st th', 2700);
INSERT INTO Addresses VALUES (2, 'Ruten 1, st tv', 2700);
INSERT INTO Addresses VALUES (3, 'Ruten 1, 1 th', 2700);
INSERT INTO Addresses VALUES (4, 'Ruten 1, 1 tv', 2700);
INSERT INTO Addresses VALUES (5, 'Ruten 1, 2 th', 2700);
INSERT INTO Addresses VALUES (6, 'Ruten 1, 2 tv', 2700);
INSERT INTO Addresses VALUES (7, 'Ruten 2, st th', 2700);
INSERT INTO Addresses VALUES (8, 'Ruten 2, st tv', 2700);
INSERT INTO Addresses VALUES (9, 'Ruten 2, 1 th', 2700);
INSERT INTO Addresses VALUES (10, 'Ruten 2, 1 tv', 2700);
INSERT INTO Addresses VALUES (11, 'Ruten 2, 2 th', 2700);
INSERT INTO Addresses VALUES (12, 'Ruten 2, 3 tv', 2700);
INSERT INTO Addresses VALUES (13, 'Frederikssundsvej 290', 2700);
INSERT INTO Addresses VALUES (14, 'Krabbesholmvej 3', 2700);



INSERT INTO Branch VALUES (1, 'Husum Bibliotek', 13, 15000);
INSERT INTO Branch VALUES (2, 'Brønshøj Bibliotek', 14,30000);



INSERT INTO EmployeeInfo VALUES (1, 'Hossain',' Ali', 32005.89, 'hossainali@gmail.com', '42210657', 1, '123456',1);
INSERT INTO EmployeeInfo VALUES (2, 'Saiful ','Bhuiyan', 40005, 'saiful@gmail.com', '42210688', 2, '123456',1);
INSERT INTO EmployeeInfo VALUES (3, 'Noman',' Khan', 32005.89, 'nomankhan@gmail.com', '42210677', 3, '123456',2);



INSERT INTO UserStatus VALUES (1, 'Active');
INSERT INTO UserStatus VALUES (2, 'Block');



INSERT INTO UserInfo VALUES ('0101901100','password', 'Abdul',' Hamid', 'abdulhamid@gamail.com', '42210058', 4, 1,1);
INSERT INTO UserInfo VALUES ('0101991155','password', 'Sabrina',' Tania', 'sabrinatania@gamail.com', '42210078', 5, 1,1);
INSERT INTO UserInfo VALUES ('1001902500','password', 'Tanim ','Hossain', 'tanimhossain@gamail.com', '42215558', 6, 1,1);
INSERT INTO UserInfo VALUES ('2801907700','password', 'Tofazzal',' Khan', 'tofazzalkhan@gamail.com', '42216658', 7, 1,1);
INSERT INTO UserInfo VALUES ('2501908800','password', 'Mohammad',' Jalal', 'mohammadjalal@gamail.com', '42217758', 8, 1,1);
INSERT INTO UserInfo VALUES ('2101909900','password', 'Numan',' Ali', 'numanali@gamail.com', '42218858', 9, 1,1);



INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20000,'Science Fiction');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20001,'Action and Adventure');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20002,'Romance');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20003,'Drama');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20004,'Health');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20005,'Guide');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20006,'Travel');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20007,'Information Technology');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20008,'History');
INSERT INTO dbo.BookType(BookTypeID,TypeName)VALUES(20009,'Art');




INSERT INTO Book VALUES (1, 'Database Systems', 2015, '9783161484100', 'English',20007);
INSERT INTO Book VALUES (2, 'Database System Management', 2014, '9783161884100', 'English',20007);
INSERT INTO Book VALUES (3, 'Database Management', 2016, '9777161884100', 'English',20007);
INSERT INTO Book VALUES (4, 'Basic Database system', 2014, '9783161994100', 'English',20007);
INSERT INTO Book VALUES (5, 'Introduction to database Management', 2012, '9783161614100', 'English',20007);
INSERT INTO Book VALUES (6, 'Europe taveling', 2015, '9783161484101', 'English',20006);
INSERT INTO Book VALUES (7, 'Indian curry', 2014, '9783161884109', 'English',20004);
INSERT INTO Book VALUES (8, 'Earth Science', 2016, '9777161884199', 'English',20000);
INSERT INTO Book VALUES (9, 'Fitnees', 2014, '9783161994089', 'English',20004);
INSERT INTO Book VALUES (10, 'Hiking Everest', 2012, '9783161617680', 'English',20006);



INSERT INTO dbo.BookItem VALUES(10000,1,1,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10001,1,1,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10002,1,1,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10003,1,1,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10004,1,2,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10005,1,2,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10006,1,3,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10007,1,3,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10008,1,3,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10009,1,4,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10010,1,4,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10011,1,5,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10012,1,6,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10013,1,7,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10014,1,7,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10015,1,8,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10016,1,9,1,'LOC-010101');
INSERT INTO dbo.BookItem VALUES(10017,1,10,1,'LOC-010101');



INSERT INTO dbo.Author VALUES(30000,'Paula',' Hawkins');
INSERT INTO dbo.Author VALUES(30001,'Angie',' Thomas');
INSERT INTO dbo.Author VALUES(30002,'Sarah',' J. Maas ');
INSERT INTO dbo.Author VALUES(30003,'Neil','Gaiman');
INSERT INTO dbo.Author VALUES(30004,'Stephanie',' Garber');
INSERT INTO dbo.Author VALUES(30005,'Victoria',' Aveyard');
INSERT INTO dbo.Author VALUES(30006,'John',' Green');
INSERT INTO dbo.Author VALUES(30007,'Mark',' T.Sullivan');
INSERT INTO dbo.Author VALUES(30008,'Gail',' Honeyman');
INSERT INTO dbo.Author VALUES(30009,'Veronica',' Roth');

INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40000,'Very Good',1,'0101901100',5);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40001,'I like it',2,'0101991155',4);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40002,'One of the best book',3,'1001902500',5);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40003,'It is a excellent one',4,'2801907700',4);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40004,'You should read it',5,'2501908800',3);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40005,'I can say average book',1,'2101909900',3);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40006,'Outstanding',2,'0101901100',5);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40007,'Interesting',3,'0101991155',4);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40008,'Informative',4,'1001902500',4);
INSERT INTO dbo.Comments(CommentsID,Comments,BookID,UserID,Score)VALUES(40009,'Good book',5,'2801907700',5);





INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30000,1);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30001,2);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30002,3);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30003,4);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30004,5);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30005,1);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30006,2);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30007,3);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30008,4);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30009,5);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30005,6);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30006,7);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30007,8);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30008,9);
INSERT INTO dbo.BookAuthor(AuthorID,BookID)VALUES(30009,10);





INSERT INTO dbo.Loan VALUES(70000,10000,'0101901100','2017-05-08 12:35:29.123',NULL,'2017-06-07 09:35:29.123', NULL);