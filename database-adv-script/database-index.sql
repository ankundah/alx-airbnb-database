-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
