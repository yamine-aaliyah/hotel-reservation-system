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