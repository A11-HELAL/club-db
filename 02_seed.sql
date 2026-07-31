-- club_db — Sample data
-- Parent rows always before child rows
-- IDs are never passed by hand (IDENTITY generates them)

INSERT INTO member (first_name, last_name, email, join_date) VALUES
    ('Ahmed',  'Mohamed', 'ahmed@gmail.com',   '2026-01-15'),
    ('Sara',   'Ali',     'sara@gmail.com',    '2026-02-03'),
    ('Youssef','Hassan',  'youssef@yahoo.com', '2025-11-20'),
    ('Mona',   'Ibrahim', 'mona@gmail.com',    '2026-03-11'),
    ('Khaled', 'Nabil',   'khaled@hotmail.com','2026-04-01');

INSERT INTO committee (name, created_date, chair_id) VALUES
    ('Football Committee', '2025-09-01', 1),
    ('Social Committee',   '2025-10-15', 2),
    ('Finance Committee',  '2026-01-05', 3);

INSERT INTO member_committee (member_id, committee_id, role, joined_on) VALUES
    (1, 1, 'Chair',  '2025-09-01'),
    (2, 2, 'Chair',  '2025-10-15'),
    (3, 3, 'Chair',  '2026-01-05'),
    (4, 1, 'Member', '2026-03-12'),
    (5, 2, 'Member', '2026-04-02');

INSERT INTO event (title, event_time, location, committee_id) VALUES
    ('Summer Tournament', '2026-08-10 18:00:00', 'Main Field',   1),
    ('Members Dinner',    '2026-08-20 20:30:00', 'Club Hall',    2),
    ('Budget Meeting',    '2026-09-01 11:00:00', 'Meeting Room', 3),
    ('Kids Football Day', '2026-09-15 17:00:00', 'Main Field',   1);

INSERT INTO event_rsvp (member_id, event_id, rsvp_time) VALUES
    (1, 1, '2026-07-20 10:00:00'),
    (2, 1, '2026-07-21 12:30:00'),
    (4, 1, '2026-07-22 09:15:00'),
    (2, 2, '2026-07-25 14:00:00'),
    (5, 2, '2026-07-26 16:45:00'),
    (3, 3, '2026-07-27 08:00:00');

INSERT INTO membership_fee (member_id, amount, payment_date) VALUES
    (1, 500.00, '2026-01-15'),
    (1, 500.00, '2026-04-15'),
    (2, 750.50, '2026-02-03'),
    (3, 300.00, '2025-11-20'),
    (4, 500.00, '2026-03-11'),
    (5, 1200.00,'2026-04-01');

-- Equipment sitting in storage — no event assigned yet
INSERT INTO equipment (event_id, eq_name, eq_state) VALUES
    (NULL, 'EQ1', 'GOOD');
