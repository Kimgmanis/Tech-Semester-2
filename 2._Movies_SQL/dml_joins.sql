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

# TODO CREATE a SELECT QUERY that shows the title, year and name of the actors
SELECT movies.title, movies.year, actors.firstname, actors.lastname
FROM movies
         JOIN movies_actors on movies.id = movies_actors.movie_id
         JOIN actors on movies_actors.actor_id = actors.id;

# TODO Create an insert statement in movies_prodcution_teams
INSERT INTO movies_production_teams(movie_id, production_team_id) VALUES (3, 1);

# Inserting into many-to-many relations
INSERT INTO production_teams(team_name) VALUES ('A - Team');

# TODO DELETE the relationship of production team A
DELETE FROM production_teams WHERE id = 1;
