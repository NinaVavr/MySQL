use sakila;

SELECT first_name FROM sakila.actor WHERE (first_name = 'Scarlett');

SELECT COUNT(inventory_id) FROM sakila.rental;

SELECT COUNT(DISTINCT inventory_id) FROM sakila.rental;

SELECT min(length) as min_duration, max(length) as max_duration
from sakila.film
where length > 0;

SELECT sec_to_time(AVG(length)) from sakila.film;

SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

SELECT DATEDIFF(MAX(DATE(rental_date)),MIN(DATE(rental_date))) AS days_between_first_and_last_rent FROM sakila.rental;

SELECT *, date_format(last_update,'%m') AS 'month', date_format(last_update,'%d') AS 'day' FROM sakila.rental LIMIT 20;
 
SELECT *, date_format(rental_date, '%W') AS 'weekday of rental',
CASE
WHEN (date_format(rental_date,'%W') = 'Saturday') or (date_format(rental_date,'%W') = 'Sunday')
THEN 'Weekend' 
ELSE 'Weekday' 
END AS day_type 
FROM sakila.rental;

SELECT title, release_year FROM sakila.film;

SELECT title FROM sakila.film WHERE title LIKE '%ARMAGEDDON%';

SELECT title FROM sakila.film WHERE title LIKE '%APOLLO';

SELECT title, length
from sakila.film
where (length > 0)
ORDER BY length
DESC LIMIT 10;

SELECT COUNT(concat( special_features)) LIKE ('Behind the Scenes') 
FROM sakila.film;

SELECT DISTINCT count(special_features) FROM film WHERE special_features LIKE '%Behind the Scenes%';



