# Database Normalization: Airbnb Database Schema

## Normalization Goals
The goal was to normalize the database schema to the Third Normal Form (3NF) to ensure data integrity, remove redundancy, and optimize for scalability.

---

## Step 1: First Normal Form (1NF)
All tables contain atomic values with no repeating groups. The schema satisfies 1NF.

---

## Step 2: Second Normal Form (2NF)
All tables have single-column primary keys. There are no partial dependencies on composite keys. The schema satisfies 2NF.

---

## Step 3: Third Normal Form (3NF)
We identified and resolved transitive dependencies:

### Changes Made:

1. **User Roles**
   - Extracted `role` ENUM from the `User` table
   - Created a new `UserRole` table:
     ```sql
     UserRole (
       role_id: PK,
       role_name: VARCHAR
     )
     ```

2. **Property Locations**
   - Replaced `location` string with a normalized `Location` table:
     ```sql
     Location (
       location_id: PK,
       city: VARCHAR,
       state: VARCHAR,
       country: VARCHAR
     )
     ```

3. **Payment Methods**
   - Extracted `payment_method` ENUM into a separate `PaymentMethod` table:
     ```sql
     PaymentMethod (
       method_id: PK,
       method_name: VARCHAR
     )
     ```

---

## Final Result
The database is now fully in **Third Normal Form (3NF)**. It supports scalability, avoids redundant data, and improves maintainability.
