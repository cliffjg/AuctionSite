use auction;

insert into Users(userEmail, password, firstName, lastName, address, city, state, zipCode, phoneNumber, profilePicture)
values
    ('AliceSmith@gmail.com', 'password1', 'Alice', 'Smith', '123 Oak Street', 'New York', 'NY', '10001', '555-111-2222', 'Images/AliceSmith.jpg'),
    ('BobJohnson@gmail.com', 'password2', 'Bob', 'Johnson', '456 Elm Avenue', 'Los Angeles', 'CA', '90001', '555-222-3333','Images/BobJohnson.jpg'),
    ('CharlieBrown@gmail.com', 'password3', 'Charlie', 'Brown', '789 Maple Drive', 'Chicago', 'IL', '60601', '555-333-4444','Images/CharlieBrown.jpg'),
    ('DianaParker@gmail.com', 'password4', 'Diana',  'Parker', '321 Pine Lane', 'Houston', 'TX', '77001', '555-444-5555','Images/DianaParker.jpg'),
    ('EthanWilson@gmail.com', 'password5', 'Ethan', 'Wilson', '654 Cedar Road', 'Philadelphia', 'PA', '19101', '555-555-6666','Images/EthanWilson.jpg'),
    ('FionaAdams@gmail.com', 'password6', 'Fiona', 'Adams', '987 Birch Boulevard', 'Phoenix', 'AZ', '85001', '555-666-7777','Images/FionaAdams.jpg'),
    ('GeorgeLopez@gmail.com', 'password7', 'George', 'Lopez', '741 Spruce Court', 'San Antonio', 'TX', '78201', '555-777-8888','Images/GeorgeLopez.jpg'),
    ('HannahTaylor@gmail.com', 'password8', 'Hannah', 'Taylor', '852 Walnut Place', 'San Diego', 'CA', '92101', '555-888-9999','Images/Default.jpg'),
    ('IanMartinez@gmail.com', 'password9', 'Ian', 'Martinez', '963 Sycamore Circle', 'San Jose', 'CA', '95101', '555-999-0000','Images/Default.jpg');
    

    
insert into Seller(userEmail)
values ("AliceSmith@gmail.com"),
("BobJohnson@gmail.com"),
("CharlieBrown@gmail.com"),
("DianaParker@gmail.com"),
("EthanWilson@gmail.com"),
("FionaAdams@gmail.com"),
("GeorgeLopez@gmail.com"),
("HannahTaylor@gmail.com"),
("IanMartinez@gmail.com");
    
insert into Auction(userEmail,carImage,
carYear, carMake, carModel, carColor, startingBid, carPrice, startDate, expirationDate, carDescription, imagePath) values
	('BobJohnson@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Bugatti','Divo','Gun Metal Gray',2750243,5700000,'2024-02-4 17:49:52','2024-05-24 17:49:59','The 2020 Bugatti Divo epitomizes automotive excellence with its striking design, luxurious interior, and monstrous quad-turbocharged 8.0-liter W16 engine delivering 1,479 horsepower. Limited to just 40 units worldwide.', '/Images/Bugatti.jpeg'),
	('CharlieBrown@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2020,'Nissan','GTR','White',20243,113540,'2024-01-15 17:49:52','2024-04-26 17:20:59','Beautiful car; only a few have been made', '/Images/NissanGTR.jpeg'),
	('BobJohnson@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Honda','Civic Type R','White',15375,41500,'2024-02-4 17:49:52','2024-05-28 17:49:59','High performance. low mileage; practically brand new', '/Images/Honda.jpeg'),
	('AliceSmith@gmail.com',null, 2022, 'Porsche', 'Taycan', 'Gray', 45632, 82789,'2024-04-4 17:49:52','2024-05-14 17:49:59', 'Save gas with this electric car', '/Images/Porsche.jpeg' ),
	('EthanWilson@gmail.com', null, 2019, 'Ferrari', '488 Pista', 'Red', 330000, 2750243, '2024-02-4 17:49:52','2024-03-15 17:49:59','Beautiful car; only a few have been made','/Images/Ferrari.jpeg'),
	('FionaAdams@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description')",2022,'Tesla','Model S Plaid','Black',89243,135990,'2024-01-4 17:49:52','2024-06-10 17:49:59','New Car; No Gas; Just electricity', '/Images/Tesla.jpeg'),
	("GeorgeLopez@gmail.com","utl_raw.cast_to_raw ('This is a new blob description)",2022, "Bugatti", "Veyron", "Navy Blue",10000, 5700000, "2024-02-02 23:59:59","2024-05-05 23:59:59", "Brand new never driven. Low mileage", '/Images/BugattiVeyron.jpeg'),
	('HannahTaylor@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024, "Lamborghini", "Hurrcan", "White",25432, 577223, "2024-02-02 23:59:59","2024-04-05 23:59:59", "Most beautiful car made by Lambo. Low mileage. Week end drives only.", '/Images/Lamborghini.jpeg'),
	('AliceSmith@gmail.com',"utl_raw.cast_to_raw ('This is a new blob description)",2024,'BMW','M3','Green',25322,125967,'2024-02-04 17:49:52','2024-03-19 17:49:59','Brand New. 500 miles. Comes with 100,000 mile warranty', '/Images/BMW-M3.jpeg');

insert into BidHistory(auctionID, userEmail, bidPrice, bidDateTime) values
	(1, "BobJohnson@gmail.com", 2750243, "2024-02-4 17:49:52"),
	(2, "CharlieBrown@gmail.com", 20243, "2024-01-15 17:49:52"),
	(3, "BobJohnson@gmail.com", 15375, "2024-02-4 17:49:52"), 
	(4, "AliceSmith@gmail.com", 45632, "2024-04-4 17:49:52"), 
	(5, "EthanWilson@gmail.com", 330000, "2024-02-4 17:49:52"), 
	(6, "FionaAdams@gmail.com", 89243, "2024-01-4 17:49:52"),
	(7, "GeorgeLopez@gmail.com", 10000, "2024-02-02 23:59:59"), 
	(8, "HannahTaylor@gmail.com", 25432, "2024-02-02 23:59:59"), 
	(9, "AliceSmith@gmail.com", 25322, "2024-02-04 17:49:52");
    
insert into Messages(userEmail, sendMessage,destinationEmail, receiveMessage, messageDateTime, profilePicture) values
("BobJohnson@gmail.com", "Hello my name is Bob and i want to know if you are still selling the Porsche?", "AliceSmith@gmail.com" ,null, "03/02/2024 @ 17:49:52", "BobJohnson@gmail.com");

-- NEED TO FIX ALL THE EMAILS
-- insert into Buyer(userEmail)
-- values ("michaeljackson@gmail.com"),
-- ("bobtom@gmail.com"),
-- ("email@gmail.com"),
-- ("john@gmail.com"),
-- ("johnbravo@gmail.com"),
-- ("johnnykane@gmail.com"),
-- ("miller@gmail.com"),
-- ("tonybaker@gmail.com");

-- insert into Seller(userEmail)
-- values ("michaeljackson@gmail.com"),
-- ("bobtom@gmail.com"),
-- ("email@gmail.com"),
-- ("john@gmail.com"),
-- ("johnbravo@gmail.com"),
-- ("johnnykane@gmail.com"),
-- ("miller@gmail.com"),
-- ("tonybaker@gmail.com");


-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", "Hello my name is Michael Jackson and i need help changing my password", null, "03/02/2024 @ 17:49:52");

-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", null, "Hello my name is Steven and i can help change your password. Give me a moment so i can verify your identity", "03/02/2024 @ 17:55:52");

-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", "Ok; Thank you.", null, "03/02/2024 @ 17:57:52");

-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", null, "What is your address?", "03/02/2024 @ 17:59:52");

-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", "My address is 14 Yellow Brick Rd. Never, NeverLand", null, "03/02/2024 @ 17:59:52");

-- insert into Messages(userEmail, sendMessage,receiveMessage, messageDateTime) values
-- ("michaeljackson@gmail.com", null, "ok thank you. What group were you part of as a child?", "03/02/2024 @ 17:59:52");