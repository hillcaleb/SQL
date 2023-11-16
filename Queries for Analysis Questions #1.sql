/*This file has some queries looking for answers to the key questions


Finding the top 10 countries for Rockbuster in terms of customer numbers.*/

 -  SELECT D.country,
    COUNT (customer_id) AS count_of_customers
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city C ON B.city_id = C.city_id
    INNER JOIN country D ON C.country_id = D. country_id
    GROUP BY country
    ORDER BY COUNT (customer_id) DESC
    LIMIT 10

/*Identifying the top 10 cities that fall within the top 10 countries I identified in the previous query.

  - Creating a temporay table of the previous output */
    SELECT country, COUNT (customer_id) AS count_of_customers into temp table top_ten_country
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city C ON B.city_id = C.city_id
    INNER JOIN country D ON C.country_id = D.country_id
    group by country
    ORDER BY COUNT (customer_id) DESC
    LIMIT 10

  
    SELECT country, city, COUNT (customer_id) AS count_of_customers
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city C ON B.city_id = C.city_id
    INNER JOIN country D ON C.country_id = D.country_id
    where country in (select country from top_ten_country)
    group by country, city
    ORDER BY COUNT (customer_id) DESC
    LIMIT 10


/*Finding the top 5 customers in the top 10 cities (previous output)*/

    Creating a temporary table of the top 10 cities
    SELECT country, city, COUNT (customer_id) AS count_of_customers INTO TEMP TABLE ten_top_cities
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city C ON B.city_id = C.city_id
    INNER JOIN country D ON C.country_id = D. country_id
    where country in (select country from top_ten_country)
    group by country, city
    ORDER BY COUNT (customer_id) DESC
    LIMIT 10

  
    SELECT A.customer_id, first_name, last_name, city, country, SUM(amount) AS total_paid
    FROM payment A
    INNER JOIN customer B ON A.customer_id = B.customer_id
    INNER JOIN address C ON B.address_id = C.address_id
    INNER JOIN city D ON C.city_id = D.city_id
    INNER JOIN country E ON D.country_id = E.country_id
    WHERE city in (SELECT city FROM ten_top_cities)
    GROUP BY A.customer_id, first_name, last_name, city, country
    ORDER BY SUM (amount) DESC
    LIMIT 5



