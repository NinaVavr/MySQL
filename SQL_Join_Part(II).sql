use sakila;

SELECT d.store_id, d.address, d.city, country.country FROM country
JOIN (SELECT b.store_id, b.address, c.city, c.country_id FROM city c
JOIN (SELECT s.store_id, a.address, a.city_id FROM store s 
JOIN address a
ON s.address_id = a.address_id) b
ON (b.city_id = c.city_id)) d ON (d.country_id = country.country_id);

SELECT st.store_id, round(sum(p.amount),2) AS 'total business' 
FROM sakila.payment AS p
INNER JOIN  staff AS s
ON s.staff_id = p.staff_id 
INNER JOIN store AS st
ON st.store_id = s.store_id
GROUP BY store_id;

SELECT c.name, count(fc.film_id) AS  "Total films"
FROM film_category AS fc
INNER JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY 1;

SELECT category, CONCAT(FLOOR(sum(length)/60),'h ',round(MOD(sum(length),60)),'m') as "Total duration"
FROM category AS c
INNER JOIN film_category AS fc
ON c.category_id = fc.category_id
INNER JOIN film AS f
ON f.film_id = fc.film_id
GROUP BY 2 DESC;

Select c.name, SUM(length) 
From category as c
inner join film_category as fc
on c.category_id = fc.category_id
inner join film as f
on f.film_id = fc.film_id
group by c.name
ORDER BY SUM(length) desc;

SELECT f.title, COUNT(f.title) as rentals 
FROM film AS f 
INNER JOIN inventory AS i
ON i.film_id = f.film_id
INNER JOIN rental AS r
ON i.inventory_id = r.inventory_id
GROUP BY f.title 
ORDER BY rentals DESC;

SELECT name, SUM(p.amount) AS 'gross revenue'
FROM category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id
INNER JOIN inventory i
ON i.film_id = fc.film_id
INNER JOIN rental r
ON r.inventory_id = i.inventory_id
INNER JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY name 
ORDER BY SUM(p.amount) DESC
LIMIT 5;

SELECT f.film_id, f.title, s.store_id, i.inventory_id
FROM film AS f
INNER JOIN inventory AS i
ON i.film_id = f.film_id
INNER JOIN store AS s
ON i.store_id = s.store_id
WHERE f.title = 'Academy Dinosaur' and s.store_id = 1;

SELECT fa1.film_id, a1.first_name, a2.first_name
FROM sakila.film
JOIN sakila.film_actor fa1
ON film.film_id = fa1.film_id
JOIN sakila.actor a1
ON fa1.actor_id = a1.actor_id
JOIN sakila.film_actor fa2
ON film.film_id = fa2.film_id
JOIN sakila.actor a2
ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id > a2.actor_id
GROUP BY a1.actor_id, fa1.film_id, a2.actor_id
ORDER BY film.film_id;



