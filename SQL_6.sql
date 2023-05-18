use sakila;

SELECT last_name FROM sakila.actor GROUP BY last_name HAVING count(*) = 1;

SELECT last_name FROM sakila.actor GROUP BY last_name HAVING count(*) > 1;

SELECT staff_id, count(rental_id) AS 'rentals'
FROM sakila.rental
GROUP BY staff_id;

Select release_year, count(*) from sakila.film group by release_year;

Select rating, count(*) from sakila.film group by rating;

SELECT rating, ROUND(AVG(length), 2) AS average_length FROM film GROUP BY rating;

SELECT rating FROM film GROUP BY rating HAVING AVG(length) > 120;

SELECT title,length FROM sakila.film WHERE (length IS NOT NULL) AND (length > 0) order by length;
