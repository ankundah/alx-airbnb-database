-- Drop if exists
DROP TABLE IF EXISTS Booking CASCADE;

-- Create the parent partitioned table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    user_id UUID,
    property_id UUID,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

CREATE TABLE Booking_2025_06 PARTITION OF Booking
    FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');

CREATE TABLE Booking_2025_07 PARTITION OF Booking
    FOR VALUES FROM ('2025-07-01') TO ('2025-08-01');

CREATE TABLE Booking_2025_future PARTITION OF Booking
    FOR VALUES FROM ('2025-08-01') TO ('2026-01-01');

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-07-10' AND '2025-07-15';
