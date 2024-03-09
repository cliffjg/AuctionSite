select * from Users;

-- select * from Auction;

-- select * from Auction
-- where auctionID = 1 
-- and startingBid < 3000002 
-- and currentBid IS NULL
-- or currentBid IS NOT NULL
-- and currentBid < 3000002;

-- select * from Auction where auctionID = 4 and startingBid < 21001 and currentBid IS NULL or currentBid IS NOT NULL and currentBid < 21001;

-- select * from Auction where auctionID = 4 
-- and startingBid < 21001 
-- and currentBid IS NULL 
-- or auctionID = 4 
-- and currentBid IS NOT NULL 
-- and currentBid < 21001;

-- insert into Users values ('peter@gmail.com', '1234' ,'Peter Peter', NULL, NULL);

select * from Users;

select * from Users where userEmail = 'admin@gmail.com';

select * from Bidders where auctionID = 1;

-- select Count(*) as row_count from Bidders;

-- alter table Bidders add bidHistoryDetails2 varchar(150);

-- this below is wrong
-- insert into Bidders(bidHistoryDetails2) values 
-- ("2750243 johnnykane@gmail.com 2024-02-4 17:49:52") where auctionID = 1; 

-- create table BidHistory(bidID int AUTO_INCREMENT, auctionID int, userEmail varchar(50), bidPrice int, 
-- Foreign Key (auctionID) references Auction(auctionID), Foreign Key (userEmail) references Users(userEmail), Primary Key(bidID) );

-- insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values
-- (1, "johnnykane@gmail.com", 2750243, "2024-02-4 17:49:52"),
-- (2, "bobtom@gmail.com", 20243, "2024-01-15 17:49:52"),
-- (3, "michaeljackson@gmail.com", 15375, "2024-02-4 17:49:52"), 
-- (4, "miller@gmail.com", 45632, "2024-04-4 17:49:52"), 
-- (5, "johnbravo@gmail.com", 330000, "2024-02-4 17:49:52"), 
-- (6, "email@gmail.com", 89243, "2024-01-4 17:49:52"),
-- (7, "michaeljackson@gmail.com", 10000, "2024-02-02 23:59:59"), 
-- (8, "miller@gmail.com", 25432, "2024-02-02 23:59:59"), 
-- (9, "tonybaker@gmail.com", 25322, "2024-02-04 17:49:52"),
-- (10, "tonybaker@gmail.com", 25322, "2024-02-29 11:50:52");


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

-- insert into BidHistory(auctionID, userEmail, bidPrice) values
-- (2, "michaeljackson@gmail.com", 30000);

-- insert into BidHistory(auctionID, userEmail, bidPrice) values
-- (1, "bobtom@gmail.com", 20000);


-- create table Messages(messageID int AUTO_INCREMENT, userEmail varchar(50), message varchar(150), messageDateTime varchar(50),
-- Foreign Key (userEmail) references Users(userEmail), Primary Key(messageID) );

-- insert into Messages(userEmail, message, messageDateTime) values
-- ("johnnykane@gmail.com", "I need help with my account", "2024-03-02 17:49:52");


select * from Bidders;

select * from BidHistory;

select * from BidHistory where AuctionID = 1;

select * from Users;

select * from Messages;