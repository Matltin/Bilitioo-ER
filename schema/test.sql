-- Insert sample data for user
INSERT INTO "user" (email, phone_number, hashed_password) VALUES
('admin@example.com', '1234567890', 'hashed_pass_1'),
('user1@example.com', '0987654321', 'hashed_pass_2'),
('user2@example.com', '1122334455', 'hashed_pass_3');

-- Insert sample data for profile
INSERT INTO "profile" (user_id, first_name, last_name, city_id, national_code) VALUES
(1, 'Admin', 'User', 1, '1234567890'),
(2, 'John', 'Doe', 2, '0987654321'),
(3, 'Jane', 'Smith', 3, '1122334455');

-- Insert sample data for city
INSERT INTO "city" (province, county) VALUES
('Province1', 'County1'),
('Province2', 'County2'),
('Province3', 'County3');

-- Insert sample data for company
INSERT INTO "company" (name, address, type) VALUES
('Company1', '123 Main St', 'BUS'),
('Company2', '456 Market St', 'TRAIN'),
('Company3', '789 Airport Rd', 'AIRPLANE');

-- Insert sample data for vehicle
INSERT INTO "vehicle" (company_id, capacity, feature) VALUES
(1, 50, '{"wifi": true, "ac": true}'),
(2, 100, '{"wifi": false, "ac": true}'),
(3, 200, '{"wifi": true, "ac": false}');

-- Insert sample data for route
INSERT INTO "route" (origin_city_id, destination_city_id, distance) VALUES
(1, 2, 150),
(2, 3, 300),
(3, 1, 450);

-- Insert sample data for ticket
INSERT INTO "ticket" (vehicle_id, seat_id, vehicle_type, route_id, amount, departure_time, arrival_time) VALUES
(1, 1, 'BUS', 1, 20, '2025-04-01 10:00:00', '2025-04-01 14:00:00'),
(2, 2, 'TRAIN', 2, 50, '2025-04-02 08:00:00', '2025-04-02 18:00:00'),
(3, 3, 'AIRPLANE', 3, 150, '2025-04-03 06:00:00', '2025-04-03 09:00:00');

-- Insert sample data for reservation
INSERT INTO "reservation" (user_id, ticket_id, payment_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insert sample data for payment
INSERT INTO "payment" (from_account, to_account, amount, type, status) VALUES
('ACC1', 'ACC2', 20, 'CASH', 'COMPLETED'),
('ACC3', 'ACC4', 50, 'CREDIT_CARD', 'PENDING'),
('ACC5', 'ACC6', 150, 'BANK_TRANSFER', 'FAILED');

-- Select statements for each table
SELECT * FROM "user";
SELECT * FROM "profile";
SELECT * FROM "city";
SELECT * FROM "company";
SELECT * FROM "vehicle";
SELECT * FROM "route";
SELECT * FROM "ticket";
SELECT * FROM "reservation";
SELECT * FROM "payment";
