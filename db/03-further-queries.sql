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
WHERE city = 'Newcastle') AS newcastle_average
;



\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

\echo '\n These are the locations where our customers live which dont have stores:'

\echo '\n This store has the highest quantity of stock:'

\echo '\n ...and this is the most abundant genre in that store:'