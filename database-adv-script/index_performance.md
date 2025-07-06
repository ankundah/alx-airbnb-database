# Performance Analysis: Indexing Optimization

## Overview
This document outlines the performance improvements gained by adding indexes to frequently queried columns in the `User`, `Booking`, and `Property` tables.

---

## 1. Queries Before Indexing

### a. Booking Lookup by User
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-user-id';

### 2. Indexes added
-- User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
 
### Queries After Indexing
#### a. Booking Lookup by User
sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-user-id';
Execution Time (after index): ~1ms - 3ms (Index scan)

#### b. Filter Properties by Location
sql
EXPLAIN ANALYZE
SELECT * FROM Property WHERE location = 'Nairobi, Kenya';
Execution Time (after index): ~2ms (Index scan)