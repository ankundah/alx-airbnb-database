
-- User Roles Table
CREATE TABLE UserRole (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Users Table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role_id INTEGER NOT NULL REFERENCES UserRole(role_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON Users(email);

-- Location Table
CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

-- Properties Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL REFERENCES Users(user_id),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location_id INTEGER NOT NULL REFERENCES Location(location_id),
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_property_location ON Property(location_id);
CREATE INDEX idx_property_host ON Property(host_id);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id),
    user_id UUID NOT NULL REFERENCES Users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);

-- Payment Method Table
CREATE TABLE PaymentMethod (
    method_id SERIAL PRIMARY KEY,
    method_name VARCHAR(50) UNIQUE NOT NULL
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES Booking(booking_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method_id INTEGER NOT NULL REFERENCES PaymentMethod(method_id)
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id),
    user_id UUID NOT NULL REFERENCES Users(user_id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES Users(user_id),
    recipient_id UUID NOT NULL REFERENCES Users(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
