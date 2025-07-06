
-- Insert roles
INSERT INTO UserRole (role_name) VALUES
('guest'),
('host'),
('admin');

-- Insert users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at) VALUES
('uuid-user-1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pwd_1', '1234567890', 1, CURRENT_TIMESTAMP),
('uuid-user-2', 'Bob', 'Jones', 'bob@example.com', 'hashed_pwd_2', '0987654321', 2, CURRENT_TIMESTAMP),
('uuid-user-3', 'Charlie', 'Admin', 'admin@example.com', 'hashed_pwd_3', NULL, 3, CURRENT_TIMESTAMP);

-- Insert locations
INSERT INTO Location (city, state, country) VALUES
('New York', 'NY', 'USA'),
('San Francisco', 'CA', 'USA');

-- Insert properties
INSERT INTO Property (property_id, host_id, name, description, location_id, pricepernight, created_at, updated_at) VALUES
('uuid-prop-1', 'uuid-user-2', 'Modern Loft', 'A stylish loft in SF', 2, 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('uuid-prop-2', 'uuid-user-2', 'Cozy Cabin', 'A cozy cabin in NY', 1, 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('uuid-book-1', 'uuid-prop-1', 'uuid-user-1', '2025-07-01', '2025-07-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('uuid-book-2', 'uuid-prop-2', 'uuid-user-1', '2025-08-10', '2025-08-15', 600.00, 'pending', CURRENT_TIMESTAMP);

-- Insert payment methods
INSERT INTO PaymentMethod (method_name) VALUES
('credit_card'),
('paypal'),
('stripe');

-- Insert payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, method_id) VALUES
('uuid-pay-1', 'uuid-book-1', 600.00, CURRENT_TIMESTAMP, 1);

-- Insert reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('uuid-rev-1', 'uuid-prop-1', 'uuid-user-1', 5, 'Loved the place, would stay again!', CURRENT_TIMESTAMP),
('uuid-rev-2', 'uuid-prop-2', 'uuid-user-1', 4, 'Nice stay but a bit cold at night.', CURRENT_TIMESTAMP);

-- Insert messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('uuid-msg-1', 'uuid-user-1', 'uuid-user-2', 'Hi, is the cabin available for next weekend?', CURRENT_TIMESTAMP),
('uuid-msg-2', 'uuid-user-2', 'uuid-user-1', 'Yes! It is currently available.', CURRENT_TIMESTAMP);
