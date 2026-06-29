CREATE DATABASE IF NOT EXISTS eventticketingsystem;
USE eventticketingsystem;

CREATE TABLE Organizers (
    organizer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    event_date DATETIME NOT NULL,
    organizer_id INT,
    venue_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Organizers (organizer_id),
    FOREIGN KEY (venue_id) REFERENCES Venues (venue_id)
);

CREATE TABLE Attendees (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    attendee_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Valid',
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendees (attendee_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);

-- VIEWS
CREATE OR REPLACE VIEW EventSummary AS
SELECT e.event_id, e.title, e.event_date, v.name AS venue_name, v.capacity
FROM Events e
JOIN Venues v ON e.venue_id = v.venue_id;

CREATE OR REPLACE VIEW FinancialReport AS
SELECT e.title, IFNULL(SUM(p.amount), 0) AS total_revenue
FROM Events e
LEFT JOIN Tickets t ON e.event_id = t.event_id AND t.status = 'Valid'
LEFT JOIN Payments p ON t.ticket_id = p.ticket_id
GROUP BY e.event_id, e.title;

-- TRIGGER FOR CAPACITY ENFORCEMENT
DELIMITER $$
CREATE TRIGGER check_capacity BEFORE INSERT ON Tickets
FOR EACH ROW
BEGIN
    DECLARE sold_tickets INT;
    DECLARE venue_capacity INT;
    
    SELECT COUNT(*) INTO sold_tickets
    FROM Tickets
    WHERE event_id = NEW.event_id AND status = 'Valid';
    
    SELECT v.capacity INTO venue_capacity
    FROM Events e
    JOIN Venues v ON e.venue_id = v.venue_id
    WHERE e.event_id = NEW.event_id;
    
    IF sold_tickets >= venue_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE TEXT = 'Error: Venue is at full capacity, ticket cannot be sold!';
    END IF;
END$$
DELIMITER ;