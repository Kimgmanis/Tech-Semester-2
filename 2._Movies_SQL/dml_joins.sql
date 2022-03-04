# TODO Get the directors for the movie id 1
SELECT *
FROM movies.directors
WHERE movie_id = 1;

# TODO Get both the directors names and the movie title and year for the movie id 1
SELECT firstname, lastname, title, year
FROM (directors, movies)
WHERE movie_id = movies.id;

# With inner join
SELECT firstname, lastname, title, year
FROM directors
         INNER JOIN movies on directors.movie_id = movies.id;

# Homework
# Neo4j