

WITH AVERAGE AS (SELECT AVG(total_paid)
FROM (SELECT PAY.customer_id, first_name, last_name, city, country, SUM(amount) AS
total_paid
FROM payment PAY
INNER JOIN customer CUST ON PAY.customer_id = CUST.customer_id
INNER JOIN address ADDR ON CUST.address_id = ADDR.address_id
INNER JOIN city CITY on ADDR.city_id = CITY.city_id
INNER JOIN country CTRY ON CITY.country_id = CTRY.country_id
WHERE city in (SELECT city FROM top_10_cities)
GROUP BY PAY.customer_id, first_name, last_name, city, country
ORDER BY SUM(amount) DESC
LIMIT 5) AS average)
SELECT * FROM AVERAGE

