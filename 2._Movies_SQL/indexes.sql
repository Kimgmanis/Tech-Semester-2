# todo create an index on movie ids and another one on movies.title

CREATE INDEX movie_ids ON movies (id);

CREATE INDEX movie_titles ON movies (title);

SELECT  * FROM movies WHERE title = 'Finding Nemo';

CREATE INDEX movie_ids_titles ON movies (title, id);

SHOW ENGINES;

# Pros: SELECT is much faster
# Cons: INSERT, UPDATE, DELETE is much slower