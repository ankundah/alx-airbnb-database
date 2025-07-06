# SQL Join Queries for alx-airbnb-database
 The queries cover key use cases including user-booking relationships, property reviews, and identifying disconnected records.

---

## 🔍 Queries Explained

### 1. INNER JOIN – Bookings with Their Users

**Query Objective:**
Retrieve all bookings and the users who made those bookings. Only bookings **with a linked user** will be shown.

**Why INNER JOIN?**
It only returns rows where there is a match in both tables (bookings + users).

---

### 2. LEFT JOIN – Properties and Their Reviews

**Query Objective:**
Retrieve all properties and their associated reviews. Even if a property **has no reviews**, it will still appear in the result.

**Why LEFT JOIN?**
We want to include **all properties**, regardless of whether they’ve been reviewed.

---

### 3. FULL OUTER JOIN – All Users and All Bookings

**Query Objective:**
Get a combined view of all users and all bookings. Show:
- Users with or without bookings
- Bookings with or without a user

**Why FULL OUTER JOIN?**
We need a **complete picture** of the data — even unmatched entries.

---

## 🧪 Sample Use Cases

- Audit users who never booked
- Show unreviewed properties
- Generate analytics dashboards

