CREATE SCHEMA HotelReservation_System;
Use HotelReservation_System;
CREATE TABLE Guests (
	guest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(30) UNIQUE,
	phone_number VARCHAR(20),
	arrival_date DATE
);
CREATE TABLE Rooms (
	room_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	room_type VARCHAR(50) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	is_available BOOLEAN DEFAULT TRUE
);
CREATE TABLE Bookings (
	booking_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	guest_id INT,
	room_id INT,
	check_in DATE NOT NULL,
	check_out DATE NOT NULL,
	total_amount DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
	FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
CREATE TABLE Payments (
	payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	booking_id INT,
	amount_paid DECIMAL(10, 2) NOT NULL,
	payment_date DATE,
	payment_status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
	FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
INSERT INTO Rooms (room_type, price) VALUES('Single', 150.00), ('Double', 250.00), ('Family', 400.00), ('Queen', 500.00), ('King', 700.00), ('Junior Suite', 1000.00), ('Executive Suite', 2000.00);
INSERT INTO Guests (first_name, last_name, email, phone_number) VALUES('Max', 'Verstappen', 'maxverstappen3@example.com', '1234567890'), ('Sebastian', 'Vettel', 'sebastianvettel5@example.com', '2345678901'), ('Kimi', 'Raikkonen', 'kimiraikkonen7@example.com', '3456789012'), ('Mark', 'Webber', 'markwebber2@example.com', '4567890123'), ('David', 'Coulthard', 'davidcoulthard13@example.com', '5678901234'), ('Mika', 'Hakkinen', 'mikahakkinen8@example.com', '6789012345');
INSERT INTO Bookings (guest_id, room_id, check_in, check_out, total_amount) VALUES(1, 1, '2014-11-01', '2014-11-05', 250.00), (2, 2, '2014-11-02', '2014-11-06', 500.00), (3, 3, '2014-11-02', '2014-11-06', 700.00), (4, 4, '2014-11-02', '2014-11-05', 700.00), (5, 5, '2014-11-01', '2014-11-06', 2000.00), (6, 6, '2014-11-02', '2014-11-06', 700.00);
INSERT INTO Payments (booking_id, amount_paid, payment_status) VALUES(1, 250.00, 'Paid'), (2, 500.00, 'Paid'), (3, 700.00, 'Unpaid'), (4, 700.00, 'Paid'), (5, 2000.00, 'Unpaid'), (6, 700.00, 'Paid');

SELECT * FROM Guests; 
INSERT INTO Guests (first_name, last_name, email, phone_number) VALUES('Fernando', 'Alonso', 'fernandoalonso14@example.com', '7890123456');
SELECT * FROM Guests;

SELECT * FROM Bookings; 
INSERT INTO Bookings (guest_id, room_id, check_in, check_out, total_amount) VALUES(7, 7, '2014-11-01', '2014-11-05', 1000.00);
SELECT * FROM Bookings;

SELECT * FROM Payments; 
INSERT INTO Payments (booking_id, amount_paid, payment_status) VALUES (7, 1000.00, 'Paid');
SELECT * FROM Payments; 

SELECT 
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_type,
    b.check_in,
    b.check_out,
    b.total_amount
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
JOIN Rooms r ON b.room_id = r.room_id;

SELECT 
    r.room_type,
    SUM(b.total_amount) AS revenue
FROM Bookings b
JOIN Rooms r ON b.room_id = r.room_id
GROUP BY r.room_type;

SELECT * FROM Rooms WHERE room_id = 2;
UPDATE Rooms
SET is_available = FALSE
WHERE room_id = 2;
SELECT * FROM Rooms WHERE room_id = 2;

UPDATE Payments
SET payment_status = 'Paid'
WHERE booking_id = 3;
SELECT* FROM Payments WHERE payment_id = 3;
DELETE FROM Payments
WHERE payment_id = 3;
SELECT * FROM Payments WHERE payment_id = 3;