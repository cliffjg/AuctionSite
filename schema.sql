-- DROP TABLE IF EXISTS Admin;
-- DROP TABLE IF EXISTS CustomerRep;
-- DROP TABLE IF EXISTS Bidders;
-- drop table if exists Auction;
-- drop table if exists Seller;
-- drop table if exists Buyer;
-- drop table if exists Users;

DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS CustomerRep;
DROP TABLE IF EXISTS Bidders;
drop table if exists BidHistory;
drop table if exists Auction;
drop table if exists Seller;
drop table if exists Buyer;
drop table if exists Users;


create table Users(userEmail varchar(50), password varchar(50), name varchar(50), address varchar(150), phoneNumber varchar(20),
Primary Key(userEmail));

Create table Buyer(userEmail varchar(50),
Foreign Key(userEmail) references Users(userEmail), Primary Key(userEmail));

Create table Seller(userEmail varchar(50),
Foreign Key(userEmail) references Users(userEmail), Primary Key(userEmail));


Create table Auction(auctionID int,userEmail varchar(50),carImage BLOB,
carYear int, carMake varchar(50), carModel varchar(50), carColor varchar(50), startingBid int, carPrice int, startDate DATETIME, expirationDate DATETIME,  carDescription text,imagePath varchar (300),

Foreign Key(userEmail)  references Seller(userEmail), Primary Key(auctionID));

CREATE TABLE Admin(email varchar(50), password varchar(50), name varchar(50), phoneNumber varchar(20), primary key(email));
CREATE TABLE CustomerRep(email varchar(50), password varchar(50), name varchar(50), phoneNumber varchar(20), primary key(email));

-- create table Bidders(auctionID int, userEmail varchar(50), bidPrice int, bidDate varchar(50),
-- Foreign Key (auctionID) references Auction(auctionID), Primary Key(auctionID));

create table Bidders(auctionID int, bidHistoryDetails1 varchar(150),
Foreign Key (auctionID) references Auction(auctionID), Primary Key(auctionID));

create table BidHistory(bidID int AUTO_INCREMENT, auctionID int, userEmail varchar(50), bidPrice int, bidDateTime varchar(50),
Foreign Key (auctionID) references Auction(auctionID), Foreign Key (userEmail) references Users(userEmail), Primary Key(bidID) );

insert into Users(userEmail, password, name, address, phoneNumber)
values 
("admin@gmail.com",	"fG3qHhCic2ZznGD-Aq@Q",	"admin", "New York, New York", "1-800-223-9797"),
("michaeljackson@gmail.com", "1111", "Michael Jackson", "14 Yellow Brick Rd.", "732456789"),
("bobtom@gmail.com", "1111", "Bob Tom",	"57 US Highway 1 New Brunswick, NJ 08901", "(973) 353-1048"),
("email@gmail.com", "2222",	"Billy Jean", "123 Washington St., Suite 590 Newark, NJ 07102",	"(973) 353-5541"),
("john@gmail.com", "1111", "John Anderson", NULL, NULL),
("johnbravo@gmail.com",	"1111",	"John Bravo", "303 Cooper Street Camden, NJ 08102",	"(856) 225-1766"),
("johnnykane@gmail.com", "3333", "Johnny Kane",	"65 Bergen Street Newark, NJ 07103", "(856) 225-1766"),
("miller@gmail.com", "1111", "Mark Miller", "118 Frelinghuysen Rd, Piscataway, NJ 08854", "(732) 445-4322"),
("tonybaker@gmail.com",	"3333",	"Tony Baker", NULL, "(123) 456-7890");



insert into Buyer(userEmail)
values ("michaeljackson@gmail.com"),
("bobtom@gmail.com"),
("email@gmail.com"),
("john@gmail.com"),
("johnbravo@gmail.com"),
("johnnykane@gmail.com"),
("miller@gmail.com"),
("tonybaker@gmail.com");

insert into Seller(userEmail)
values ("michaeljackson@gmail.com"),
("bobtom@gmail.com"),
("email@gmail.com"),
("john@gmail.com"),
("johnbravo@gmail.com"),
("johnnykane@gmail.com"),
("miller@gmail.com"),
("tonybaker@gmail.com");


insert into Auction(auctionID, userEmail,carImage,
carYear, carMake, carModel, carColor, startingBid,carPrice, startDate, expirationDate, carDescription, imagePath) values
(1,'johnnykane@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Bugatti','Divo','Gun Metal Gray',2750243,5700000,'2024-02-4 17:49:52','2024-05-24 17:49:59','Beautiful car; only a few have been made', '/Images/Bugatti.jpeg'),
(2,'bobtom@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Nissan','GTR','White',20243,113540,'2024-01-15 17:49:52','2024-04-26 17:20:59','Beautiful car; only a few have been made', '/Images/NissanGTR.jpeg'),
(3,'michaeljackson@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Honda','Civic Type R','White',15375,41500,'2024-02-4 17:49:52','2024-05-28 17:49:59','High performance. low mileage; practically brand new', '/Images/Honda.jpeg'),
(4, 'miller@gmail.com',null, 2022, 'Porsche', 'Taycan', 'Gray', 45632, 82789,'2024-04-4 17:49:52','2024-05-14 17:49:59', 'Save gas with this electric car', '/Images/Porsche.jpeg' ),
(5,'johnbravo@gmail.com', null, 2019, 'Ferrari', '488 Pista', 'Red', 330000, 2750243, '2024-02-4 17:49:52','2024-03-15 17:49:59','Beautiful car; only a few have been made','/Images/Ferrari.jpeg'),
(6,'email@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Tesla','Model S Plaid','Black',89243,135990,'2024-01-4 17:49:52','2024-06-10 17:49:59','New Car; No Gas; Just electricity', '/Images/Tesla.jpeg'),
(7,"michaeljackson@gmail.com","utl_raw.cast_to_raw ('This is a new blob description)",2022, "Bugatti", "Veyron", "Blue",10000, 5700000, "2024-02-02 23:59:59","2024-05-05 23:59:59", "Brand new never driven. Low mileage", NULL),
(8,"miller@gmail.com","utl_raw.cast_to_raw ('This is a new blob description)",2024, "Lamborghini", "Hurrcan", "Black",25432, 577223, "2024-02-02 23:59:59","2024-04-05 23:59:59", "Most beautiful car made by Lambo. Low mileage. Week end drives only.", NULL),
(9,'tonybaker@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024,'BMW','M3','Metallic Blue',25322,125967,'2024-02-04 17:49:52','2024-03-19 17:49:59','Brand New. 500 miles. Comes with 100,000 mile warranty', NULL);

-- insert into Bidders(auctionID, bidHistoryDetails) values 
-- (1, "2750243 johnnykane@gmail.com 2024-02-4 17:49:52"), 
-- (2, "20243 bobtom@gmail.com 2024-01-15 17:49:52"), 
-- (3, "15375 michaeljackson@gmail.com 2024-02-4 17:49:52"), 
-- (4, "45632 miller@gmail.com 2024-04-4 17:49:52"), 
-- (5, "330000 johnbravo@gmail.com 2024-02-4 17:49:52"), 
-- (6, "89243 email@gmail.com 2024-01-4 17:49:52"),
-- (7, "10000 michaeljackson@gmail.com 2024-02-02 23:59:59"), 
-- (8, "25432 miller@gmail.com 2024-02-02 23:59:59"), 
-- (9, "25322 tonybaker@gmail.com 2024-05-04 17:49:52"); 

INSERT INTO Admin VALUES("admin@email.com", "password", "Ad Min", "111-111-1111");
INSERT INTO CustomerRep VALUES("NewRep@email.com", "secret", "Rep Resent", "222-222-2222");

-- select * from Users;
-- select * from Buyer;
-- select * from Seller;
-- select * from Auction;
-- SELECT * FROM Admin;
-- SELECT * FROM CustomerRep;

-- Select * from Auction where userEmail = "johnnykane@gmail.com"
-- select * from Auction where userEmail = 'michaeljackson@gmail.com';

-- select * from Auction where auctionID='3';

UPDATE Auction SET imagePath = '/Images/Lamborghini.jpeg' WHERE auctionID = '8';

update Auction set imagePath = '/Images/BugattiVeyron.jpeg' where auctionID = '7';

update Auction set imagePath = '/Images/BMW-M3.jpeg' where auctionID = '9';


update Users set password = 'Rutgers24!o_11e75d0@' where userEmail = 'michaeljackson@gmail.com';

-- select * from Users;

alter table Auction add currentBid int;

alter table Auction add bidderEmail varchar(50);

-- update Auction set currentBid = 276000, bidderEmail = 'michaeljackson@gmail.com' where auctionID = 1;
-- update Auction set currentBid = 276000 where auctionID = 1;
-- update Auction set bidderEmail = 'michaeljackson@gmail.com' where auctionID = 1;

-- select * from Auction;

-- select * from Auction
-- where auctionID = 1 
-- and startingBid < 2;

-- select * from Auction
-- where auctionID = 1 
-- and currentBid IS NULL;

-- select * from Auction
-- where auctionID = 1 
-- and startingBid < 20000000 
-- and currentBid IS NULL;

-- select * from Auction
-- where auctionID = 1 
-- and startingBid < 20000000 
-- and currentBid IS NULL
-- or currentBid IS NOT NULL
-- and currentBid < 3000001;


 
insert into Auction values 
(10,'tonybaker@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024,'BMW','M3','Metallic Blue',25322,125967,'2024-02-29 11:50:52','2024-02-29 12:00:59','Brand New. 500 miles. Comes with 100,000 mile warranty', NULL, NULL,NULL);

-- insert into Bidders(auctionID, bidHistoryDetails1) values 
-- (1, "2750243 johnnykane@gmail.com 2024-02-4 17:49:52"), 
-- (2, "20243 bobtom@gmail.com 2024-01-15 17:49:52"), 
-- (3, "15375 michaeljackson@gmail.com 2024-02-4 17:49:52"), 
-- (4, "45632 miller@gmail.com 2024-04-4 17:49:52"), 
-- (5, "330000 johnbravo@gmail.com 2024-02-4 17:49:52"), 
-- (6, "89243 email@gmail.com 2024-01-4 17:49:52"),
-- (7, "10000 michaeljackson@gmail.com 2024-02-02 23:59:59"), 
-- (8, "25432 miller@gmail.com 2024-02-02 23:59:59"), 
-- (9, "25322 tonybaker@gmail.com 2024-02-04 17:49:52"),
-- (10, "25322 tonybaker@gmail.com 2024-02-29 11:50:52"); 

insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values
(1, "johnnykane@gmail.com", 2750243, "2024-02-4 17:49:52"),
(2, "bobtom@gmail.com", 20243, "2024-01-15 17:49:52"),
(3, "michaeljackson@gmail.com", 15375, "2024-02-4 17:49:52"), 
(4, "miller@gmail.com", 45632, "2024-04-4 17:49:52"), 
(5, "johnbravo@gmail.com", 330000, "2024-02-4 17:49:52"), 
(6, "email@gmail.com", 89243, "2024-01-4 17:49:52"),
(7, "michaeljackson@gmail.com", 10000, "2024-02-02 23:59:59"), 
(8, "miller@gmail.com", 25432, "2024-02-02 23:59:59"), 
(9, "tonybaker@gmail.com", 25322, "2024-02-04 17:49:52"),
(10, "tonybaker@gmail.com", 25322, "2024-02-29 11:50:52");

create table Messages(messageID int AUTO_INCREMENT, userEmail varchar(50), sendMessage varchar(150), receiveMessage varchar(150), messageDateTime varchar(50),
Foreign Key (userEmail) references Users(userEmail), Primary Key(messageID) );

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", "Hello my name is Michael Jackson and i need help changing my password", null, "03/02/2024 @ 17:49:52");

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", null, "Hello my name is Steven and i can help change your password. Give me a moment so i can verify your identity", "03/02/2024 @ 17:55:52");

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", "Ok; Thank you.", null, "03/02/2024 @ 17:57:52");

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", null, "What is your address?", "03/02/2024 @ 17:59:52");

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", "My address is 14 Yellow Brick Rd. Never, NeverLand", null, "03/02/2024 @ 17:59:52");

insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
("michaeljackson@gmail.com", null, "ok thank you. What group were you part of as a child?", "03/02/2024 @ 17:59:52");

select * from Users;
select * from Buyer;
select * from Seller;
select * from Auction;
SELECT * FROM Admin;
SELECT * FROM CustomerRep;

select * from Messages;
-- select * from Bidders;