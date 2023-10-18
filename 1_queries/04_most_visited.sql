SELECT properties.city as city, count(*) as total_reservations
FROM reservations
JOIN properties on property_id = properties.id
GROUP BY properties.city
ORDER BY total_reservations DESC
LIMIT 10;
