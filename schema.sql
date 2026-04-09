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