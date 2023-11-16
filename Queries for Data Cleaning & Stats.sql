/*Data Cleaning

- Looked for Non-Uniform data
  with the following query:*/

  SELECT DISTINCT *
  FROM film
  SELECT DISTINCT *
  FROM customer

  /*It was all uniform but if they weren’t I would use UPDATE and SET to fix values that weren’t
  the same.*/


  /*Looked for Missing Values 
  with the following query:*/

  SELECT *
  FROM film
  WHERE film.* IS NULL
  SELECT *
  FROM customer
  WHERE customer.* IS NULL

  /*There were no missing values but if there were I would determine if I should either replace
  them with the average, or leave out the column altogether depending on how many values
  were missing.


Calculating descriptive statistics for the film table and customer table

- Query for the film table statistics:*/

  SELECT MIN(film_id) AS minimum_film_id,
  MAX(film_id) AS maximun_film_id,
  AVG(film_id) AS average_film_id,
  MODE () WITHIN GROUP (ORDER BY title) AS mode_of_title,
  MODE() WITHIN GROUP (ORDER BY description) AS mode_of_description,
  MIN(release_year) AS minimum_release_year,
  MAX (release_year) AS maximum_release_year,
  AVG (release_year) AS average_release_year,
  MIN (language_id) AS minimum_language_id,
  MAX (language_id) AS maximum_language_id,
  AVG (language_id) AS average_language_id,
  MIN (rental_duration) AS minimum_rental_duration,
  MAX (rental_duration) AS maximum_rental_duration,
  AVG (rental_duration) AS average_rental_duration,
  MIN (rental_rate) AS minimum_rental_rate,
  MAX (rental_rate) AS maximum_rental_rate,
  AVG (rental_rate) AS average_rental_rate,
  MIN (length) AS minimun_length,
  MAX (length) AS maximun_length,
  AVG (length) AS average_length,
  MIN (replacement_cost) AS minimum_replacement_cost,
  MAX (replacement_cost) AS maximum_replacement_cost,
  AVG (replacement_cost) AS average_replacement_cost,
  MODE () WITHIN GROUP (ORDER BY rating) AS mode_of_rating,
  MODE() WITHIN GROUP (ORDER BY last_update) AS mode_of_last_update,
  MODE () WITHIN GROUP (ORDER BY special_features) AS mode_of_special_features,
  MODE() WITHIN GROUP(ORDER BY fulltext) AS mode_of_fulltext,
  COUNT (*) AS count_rows
  FROM film

  /*Query for the customer table statistics*/
  SELECT MODE() WITHIN GROUP (ORDER BY customer_id) AS mode_of_customer_id,
  MODE () WITHIN GROUP(ORDER BY store_id) AS mode_of_store_id,
  MODE () WITHIN GROUP (ORDER BY first_name) AS mode_of_first_name,
  MODE () WITHIN GROUP(ORDER BY last_name) AS mode_of_last_name,
  MODE () WITHIN GROUP (ORDER BY email) AS mode_of_email,
  MODE () WITHIN GROUP(ORDER BY address_id) AS mode_of_address_id,
  MODE () WITHIN GROUP (ORDER BY activebool) AS mode_of_activebool,
  MODE () WITHIN GROUP (ORDER BY create_date) AS mode_of_create_date, MODE () WITHIN GROUP (ORDER BY last_update) AS mode_of_last_update,
  MODE () WITHIN GROUP(ORDER BY active) AS mode_of_active
  FROM customer


