# Query Performance Optimization Report

## Overview

We analyzed and optimized a high-frequency query that joins Bookings, Users, and Properties. The original query experienced performance issues due to lack of indexing.

---

## Original Query

SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.first_name,
  u.email,
  p.property_id,
  p.name
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-07-01' AND '2025-07-31';

#### Performance (Before Optimization)
Used Sequential Scan on Booking

Execution Time: ~400 ms

Reason: No index on start_date

#### Changes Made
Added index on Booking.start_date

Added indexes on Booking.user_id and Booking.property_id for join performance

#### SQL Commands

CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

#### Performance (After Optimization)
Used Bitmap Index Scan on start_date

Execution Time: ~70 ms

Improvement: ~82% faster