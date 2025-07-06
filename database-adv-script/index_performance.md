# Performance Analysis: Indexing Optimization

## Overview
This document outlines the performance improvements gained by adding indexes to frequently queried columns in the `User`, `Booking`, and `Property` tables.

---

## 1. Queries Before Indexing

### a. Booking Lookup by User
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-user-id';
