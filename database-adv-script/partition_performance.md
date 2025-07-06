# Booking Table Partitioning Performance Report

## Background

The `Booking` table holds a large number of rows, causing performance degradation when querying bookings by date.

To address this, we implemented **range partitioning** on the `start_date` column.

---

## Implementation Summary

- Created `Booking` as a partitioned table
- Created monthly partitions for 2025 (e.g., `Booking_2025_06`, `Booking_2025_07`)
- Used `PARTITION BY RANGE (start_date)`

---

## Query Tested

```sql
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-07-10' AND '2025-07-15';
