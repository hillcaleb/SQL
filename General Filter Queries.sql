
Description: In this file are filter queries that I used to gain some general information about the dataset.


Query to find films with a title that contains the word Uptown in any position

SELECT film_id, title, description
FROM film
WHERE title LIKE '%Uptown%'


Query to find films with a length that is more than 120 minutes and have a rental rate that is more than 2.99

SELECT film_id, title, description, length, rental_rate
FROM film
WHERE length > 120 and rental_rate > 2.99
ORDER BY length ASC


Query to find films with a rental duration that is between 3 and 7 days (where 3 and 7 aren’t inclusive)

SELECT film_id, title, description, length, rental_duration
FROM film
WHERE rental_duration BETWEEN 4 and 6
ORDER BY rental_duration ASC


Query to find films with a replacement cost that is less than 14.99

SELECT film_id, title, description, replacement_cost
FROM film
WHERE replacement_cost < 14.99
ORDER BY replacement_cost ASC


Query to find films where the rating is either PG or G

SELECT film_id, title, description, rating
FROM film
WHERE rating = 'PG' or rating =  'G'


Query to further explore the output of the previous query by using aggregate functions
to get basic statistical information for it.

SELECT COUNT(film_id) as count_of_movies, AVG(rental_rate) AS average_movie_rental_rate,
MIN(rental_duration), MAX(rental_duration)
FROM film
WHERE rating = 'PG' or rating =  'G'


Query to group the previous output by 'rating'

SELECT COUNT(film_id) as count_of_movies, AVG(rental_rate) AS average_movie_rental_rate,
MIN(rental_duration), MAX(rental_duration), rating
FROM film
WHERE rating = 'PG' or rating =  'G'
GROUP BY rating
