CREATE DATABASE IF NOT EXISTS OLA_Cab_Booking;

USE OLA_Cab_Booking;

CREATE TABLE Driver (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    LicenseNo VARCHAR(50),
    CarModel VARCHAR(50),
    Status ENUM('Available', 'Busy', 'Inactive')
);

CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Route (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    Source VARCHAR(100),
    Destination VARCHAR(100),
    DistanceKM DECIMAL(5,2),
    EstimatedTimeMin INT
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    DriverID INT,
    PickupLocation VARCHAR(100),
    DropLocation VARCHAR(100),
    BookingTime DATETIME,
    Status ENUM('Pending', 'Ongoing', 'Completed', 'Cancelled'),
    Fare DECIMAL(8,2),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(8,2),
    PaymentMethod ENUM('Cash', 'Card', 'UPI', 'Wallet'),
    PaymentDate DATETIME,
    Status ENUM('Paid', 'Pending'),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE Rating (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    DriverRating INT CHECK (DriverRating BETWEEN 1 AND 5),
    PassengerRating INT CHECK (PassengerRating BETWEEN 1 AND 5),
    Comments VARCHAR(255),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

INSERT INTO Driver (Name, Phone, LicenseNo, CarModel, Status) VALUES
('Ravi Sharma', '9876543210', 'GJ05AB1234', 'Swift', 'Available'),
('Meera Patel', '9876501234', 'GJ01CD5678', 'WagonR', 'Busy'),
('Amit Joshi', '9998887776', 'GJ07EF9012', 'Dzire', 'Available'),
('Priya Desai', '9988776655', 'GJ03GH3456', 'Ertiga', 'Inactive'),
('Suresh Patel', '9876112233', 'GJ06IJ7890', 'Baleno', 'Busy');

INSERT INTO Passenger (Name, Phone, Email) VALUES
('Anjali Singh', '9898989898', 'anjali@gmail.com'),
('Raj Kumar', '9876123456', 'rajkumar@gmail.com'),
('Neha Mehta', '9123456789', 'neha@gmail.com'),
('Rahul Jain', '9234567890', 'rahul@gmail.com'),
('Kavita Shah', '9345678901', 'kavita@gmail.com');

INSERT INTO Route (Source, Destination, DistanceKM, EstimatedTimeMin) VALUES
('Ahmedabad', 'Gandhinagar', 25.00, 40),
('Ahmedabad', 'Vadodara', 110.00, 120),
('Ahmedabad', 'Surat', 265.00, 300),
('Gandhinagar', 'Mehsana', 65.00, 80),
('Vadodara', 'Bharuch', 75.00, 90);

INSERT INTO Booking (PassengerID, DriverID, PickupLocation, DropLocation, BookingTime, Status, Fare) VALUES
(1, 1, 'Paldi', 'Infocity', NOW(), 'Ongoing', 300.00),
(2, 2, 'CG Road', 'Vadodara Station', NOW(), 'Pending', 1500.00),
(3, 3, 'Satellite', 'Surat Railway Station', NOW(), 'Completed', 3500.00),
(4, 4, 'Gandhinagar Sector 21', 'Mehsana Bus Stand', NOW(), 'Cancelled', 800.00),
(5, 5, 'Alkapuri', 'Bharuch Main Road', NOW(), 'Completed', 1200.00);

INSERT INTO Payment (BookingID, Amount, PaymentMethod, PaymentDate, Status) VALUES
(1, 300.00, 'UPI', NOW(), 'Paid'),
(2, 1500.00, 'Cash', NOW(), 'Pending'),
(3, 3500.00, 'Card', NOW(), 'Paid'),
(4, 800.00, 'Wallet', NOW(), 'Pending'),
(5, 1200.00, 'UPI', NOW(), 'Paid');

INSERT INTO Rating (BookingID, DriverRating, PassengerRating, Comments) VALUES
(1, 5, 5, 'Smooth ride and polite driver.'),
(2, 4, 4, 'Driver arrived on time.'),
(3, 5, 5, 'Comfortable long-distance trip.'),
(4, 3, 4, 'Booking was cancelled due to traffic.'),
(5, 4, 5, 'Clean car and good driving.');

SELECT * FROM Driver;

SELECT * FROM Passenger;

SELECT * FROM Route;

SELECT * FROM Booking;

SELECT * FROM Payment;

SELECT * FROM Rating;

-- View for Pending Bookings
CREATE VIEW PendingBookings AS
SELECT * FROM Booking WHERE Status = 'Pending';

-- Stored Procedure for Updating Booking Status
DELIMITER //
CREATE PROCEDURE UpdateBookingStatus(IN bookID INT, IN newStatus ENUM('Pending', 'Ongoing', 'Completed', 'Cancelled'))
BEGIN
    UPDATE Booking SET Status = newStatus WHERE BookingID = bookID;
END //
DELIMITER ;

-- Trigger to auto-update Driver Status when Booking Completed
DELIMITER //
CREATE TRIGGER UpdateDriverStatusAfterBooking
AFTER UPDATE ON Booking FOR EACH ROW
BEGIN
    IF NEW.Status = 'Completed' THEN
        UPDATE Driver SET Status = 'Available' WHERE DriverID = NEW.DriverID;
    END IF;
END //
DELIMITER ;

SELECT * FROM PendingBookings;

-- Calculate total revenue
SELECT SUM(Amount) AS TotalRevenue FROM Payment WHERE Status = 'Paid';

-- Count total bookings by each driver
SELECT D.Name, COUNT(B.BookingID) AS TotalBookings
FROM Driver D
JOIN Booking B ON D.DriverID = B.DriverID
GROUP BY D.Name;

-- Show passengers who have not made any booking
SELECT P.Name FROM Passenger P
LEFT JOIN Booking B ON P.PassengerID = B.PassengerID
WHERE B.BookingID IS NULL;

-- Show average driver rating
SELECT AVG(DriverRating) AS AverageDriverRating FROM Rating;

-- List all drivers who are currently busy
SELECT * FROM Driver WHERE Status = 'Busy';

--  List all completed bookings with passenger and driver names, 
-- fare, and status
SELECT B.BookingID, P.Name AS PassengerName, D.Name AS DriverName, B.Fare, B.Status
FROM Booking B
JOIN Passenger P ON B.PassengerID = P.PassengerID
JOIN Driver D ON B.DriverID = D.DriverID
WHERE B.Status = 'Completed';

-- Display passengers who have made more than 1 booking
SELECT P.Name, COUNT(B.BookingID) AS TotalBookings
FROM Passenger P
JOIN Booking B ON P.PassengerID = B.PassengerID
GROUP BY P.Name
HAVING COUNT(B.BookingID) > 1;

-- Display the highest fare collected for any booking
SELECT MAX(Fare) AS HighestFare FROM Booking;

-- Display the average fare for completed bookings
SELECT AVG(Fare) AS AverageFare FROM Booking WHERE Status = 'Completed';

-- List all bookings with fare greater than 1000, sorted by 
-- fare descending 
SELECT * FROM Booking WHERE Fare > 1000 ORDER BY Fare DESC;

-- Show the driver with the maximum number of completed bookings
SELECT D.Name, COUNT(B.BookingID) AS CompletedBookings FROM Driver D
JOIN Booking B ON D.DriverID = B.DriverID
WHERE B.Status = 'Completed'
GROUP BY D.Name
ORDER BY CompletedBookings DESC LIMIT 1;

-- Display payment details of all bookings that are still pending payment
SELECT * FROM Payment WHERE Status = 'Pending';

-- List all ratings with 5 stars for drivers
SELECT * FROM Rating WHERE DriverRating = 5;

-- Find the total earnings of each driver from completed bookings
SELECT D.Name, SUM(B.Fare) AS TotalEarnings
FROM Driver D
JOIN Booking B ON D.DriverID = B.DriverID
WHERE B.Status = 'Completed'
GROUP BY D.Name;

-- Get bookings made today
SELECT * FROM Booking WHERE DATE(BookingTime) = CURDATE();

-- Find routes with a distance greater than 50 KM
SELECT * FROM Route WHERE DistanceKM > 50;

-- Display driver and passenger names for all ongoing bookings
SELECT B.BookingID, D.Name AS DriverName, P.Name AS PassengerName, B.Status
FROM Booking B
JOIN Driver D ON B.DriverID = D.DriverID
JOIN Passenger P ON B.PassengerID = P.PassengerID
WHERE B.Status = 'Ongoing';

-- List the payment method that was used most frequently
SELECT PaymentMethod, COUNT(*) AS UsageCount FROM Payment
GROUP BY PaymentMethod
ORDER BY UsageCount DESC LIMIT 1;

-- Display the names of passengers who have given a driver rating of 5
SELECT DISTINCT P.Name
FROM Passenger P
JOIN Booking B ON P.PassengerID = B.PassengerID
JOIN Rating R ON B.BookingID = R.BookingID
WHERE R.DriverRating = 5;

-- trigger to update payment status to 'Paid' automatically when 
-- payment is inserted with PaymentMethod as 'Cash'
DELIMITER //
CREATE TRIGGER AutoSetPaidOnCash
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    IF NEW.PaymentMethod = 'Cash' THEN
        SET NEW.Status = 'Paid';
    END IF;
END //
DELIMITER ;

-- Trigger to auto-update Driver status to 'Busy' when a new 
-- booking is created
DELIMITER //
CREATE TRIGGER SetDriverBusyOnBooking
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    UPDATE Driver SET Status = 'Busy' WHERE DriverID = NEW.DriverID;
END //
DELIMITER ;

-- Display drivers who have not received any booking yet.
SELECT D.Name
FROM Driver D
LEFT JOIN Booking B ON D.DriverID = B.DriverID
WHERE B.BookingID IS NULL;

-- Find the route with the longest distance.
SELECT * FROM Route
ORDER BY DistanceKM DESC
LIMIT 1;

-- Show passengers who have given the highest driver rating 
-- (5) more than once.
SELECT P.Name, COUNT(R.RatingID) AS FiveStarCount
FROM Passenger P
JOIN Booking B ON P.PassengerID = B.PassengerID
JOIN Rating R ON B.BookingID = R.BookingID
WHERE R.DriverRating = 5
GROUP BY P.Name
HAVING COUNT(R.RatingID) > 1;

-- Display the number of completed bookings in the current month.
SELECT COUNT(*) AS CompletedBookingsThisMonth
FROM Booking
WHERE Status = 'Completed'
AND MONTH(BookingTime) = MONTH(CURDATE())
AND YEAR(BookingTime) = YEAR(CURDATE());

--  Calculate total fare collected per driver for completed bookings.
SELECT D.Name AS DriverName, SUM(B.Fare) AS TotalFare
FROM Driver D
JOIN Booking B ON D.DriverID = B.DriverID
WHERE B.Status = 'Completed'
GROUP BY D.Name;

-- List top 2 passengers with the highest number of bookings.
SELECT P.Name, COUNT(B.BookingID) AS BookingCount
FROM Passenger P
JOIN Booking B ON P.PassengerID = B.PassengerID
GROUP BY P.Name
ORDER BY BookingCount DESC
LIMIT 2;

-- Display bookings where fare is above average fare.
SELECT * FROM Booking
WHERE Fare > (SELECT AVG(Fare) FROM Booking);