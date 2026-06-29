USE eventticketingsystem;

INSERT INTO Organizers (name, email) VALUES
('Alanya Uni', 'info@alanya.edu.tr'),
('Music Club', 'music@uni.edu.tr'),
('Career Center', 'career@uni.edu.tr');

INSERT INTO Venues (name, capacity) VALUES
('Library Hall', 2),
('Blue Hall', 100),
('Amphitheater', 500),
('Sports Hall', 1000);

INSERT INTO Events (title, event_date, organizer_id, venue_id) VALUES
('AI Seminar', '2026-06-01 14:00:00', 1, 1),
('Spring Concert', '2026-06-05 20:00:00', 2, 3),
('Career Days', '2026-06-15 10:00:00', 3, 2),
('Graduation Ceremony', '2026-06-20 17:00:00', 1, 4);

INSERT INTO Attendees (first_name, last_name, email) VALUES
('Ahmet', 'Yılmaz', 'ahmet@email.com'),
('Ayşe', 'Demir', 'ayse@email.com'),
('Mehmet', 'Öztürk', 'mehmet@email.com'),
('Elif', 'Kaya', 'elif@email.com');