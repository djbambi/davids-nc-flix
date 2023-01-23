\c nc_flix

\echo '\n The number of films in stock for each genre:'
-- WITH movies_genres(
-- SELECT movies.title AS Film, genres.genre_slug AS Genres FROM movie_junction_table
-- JOIN movies ON movie_junction_table.film_id = movies.movie_id
-- JOIN genres ON movie_junction_table.genre_id = genres.genre_id;
-- )

-- SELECT * FROM stock
-- JOIN movies_genres ON stock.movie_id = movies_genres.movie_id;

\echo '\n Here is the average rating for films in stock in Newcastle:'

\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

\echo '\n These are the locations where our customers live which dont have stores:'

\echo '\n This store has the highest quantity of stock:'

\echo '\n ...and this is the most abundant genre in that store:'