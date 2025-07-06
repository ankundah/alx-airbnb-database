-- 1. Properties with an Average Rating Greater Than 4.0
SELECT 
  p.property_id,
  p.name AS property_name,
  p.location,
  AVG(r.rating) AS average_rating
FROM properties p
JOIN reviews r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location
HAVING AVG(r.rating) > 4.0;

--2. Users Who Have Made More Than 3 Bookings
SELECT 
  u.user_id,
  u.first_name,
  u.last_name,
  (
    SELECT COUNT(*) 
    FROM bookings b 
    WHERE b.user_id = u.user_id
  ) AS total_bookings
FROM users u
WHERE (
  SELECT COUNT(*) 
  FROM bookings b 
  WHERE b.user_id = u.user_id
) > 3;