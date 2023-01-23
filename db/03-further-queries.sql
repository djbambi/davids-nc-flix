\c nc_flix

\echo '\n The number of films in stock for each genre:'

WITH movies_genres AS (
SELECT * FROM movie_junction_table
JOIN movies ON movie_junction_table.film_id = movies.movie_id
JOIN genres ON movie_junction_table.genre_id = genres.genre_id
JOIN stock ON movies.movie_id = stock.movie_id
ORDER BY genres.genre_slug
)

SELECT genre_slug AS genre,
COUNT(genre_slug)
FROM movies_genres
GROUP BY genre_slug;

\echo '\n Here is the average rating for films in stock in Newcastle:'

WITH movies_stores AS(
SELECT * FROM stock
JOIN movies ON movies.movie_id = stock.movie_id
JOIN stores ON stores.store_id = stock.store_id
)

-- WITH newcastle_ratings AS(
-- SELECT DISTINCT city, title, rating FROM movies_stores
-- WHERE city = 'Newcastle')

SELECT AVG(rating) AS average_rating
FROM
(SELECT DISTINCT city, title, rating FROM movies_stores
WHERE city = 'Newcastle') AS newcastle_average;

\echo '\n Here are all the films made in 90s with above average rating'

SELECT * FROM movies
WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31'
AND
rating > (
SELECT AVG(COALESCE(rating, 0))
AS average_rating FROM movies);

\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'


-- SELECT * FROM movies 
-- ORDER BY release_date DESC
-- LIMIT 5;
--  AS most_recent_films
-- WHERE rating = 
-- (SELECT MAX(rating) FROM movies);

-- WITH five_most_recent AS(
--     SELECT title, COALESCE(rating, 0) AS rating, movie_id FROM movies 
--     ORDER BY release_date DESC
--     LIMIT 5)
-- SELECT * FROM stock
-- WHERE movie_id = 

-- JOIN movies ON stock.movie_id = movies.movie_id
-- WHERE stock.movie_id
-- IN (
-- SELECT movie_id
-- FROM five_most_recent
-- ORDER BY rating DESC
-- LIMIT 1);

SELECT COUNT(movie_id) FROM stock
WHERE movie_id = (
    WITH top_rated_movie AS(
        SELECT * FROM movies
        ORDER BY release_date DESC
        LIMIT 5
    )
    SELECT movie_id FROM top_rated_movie
    WHERE rating > 1
    ORDER BY rating DESC
    LIMIT 1
);


-- WITH five_most_recent AS(
--     SELECT title, COALESCE(rating, 0) AS rating, movie_id FROM movies 
--     ORDER BY release_date DESC
--     LIMIT 5)
-- SELECT * FROM stock
-- WHERE stock.movie_id
-- IN
-- (SELECT movie_id FROM five_most_recent);

-- SELECT * FROM highest_rated_film;



-- SELECT * FROM movie_junction_table
-- JOIN movies ON movie_junction_table.film_id = movies.movie_id
-- JOIN genres ON movie_junction_table.genre_id = genres.genre_id
-- JOIN stock ON movies.movie_id = stock.movie_id
-- ORDER BY genres.genre_slug


\echo '\n These are the locations where our customers live which dont have stores:'

SELECT DISTINCT customers.location FROM customers
WHERE customers.location
NOT IN
(SELECT city FROM stores);

\echo '\n These are the locations we have influence over'

SELECT DISTINCT stores.city AS locations FROM stores
UNION
SELECT DISTINCT customers.location FROM customers
WHERE customers.location
NOT IN
(SELECT city FROM stores);

\echo '\n This store has the highest quantity of stock:'

-- SELECT * FROM stock
-- JOIN stores;



SELECT COUNT(stock_id) FROM stock
SELECT * FROM stores
JOIN stock ON stores.store_id = stock.store_id;

SELECT * FROM stores
WHERE city
IN (SELECT customers.location FROM customers);



\echo '\n ...and this is the most abundant genre in that store:'