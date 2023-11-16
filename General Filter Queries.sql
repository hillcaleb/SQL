
/* Description: In this file are filter queries that I used to gain some general information about the dataset.


Query to find films with a title that contains the word Uptown in any position
*/
SELECT film_id, title, description
FROM film
WHERE title LIKE '%Uptown%'


