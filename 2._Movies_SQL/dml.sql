SELECT * FROM movies;
SELECT * FROM movies WHERE BINARY title='Terminator';
SELECT * FROM movies WHERE title='terminator';
SELECT * FROM movies WHERE title='terminator' LIMIT 1;

INSERT INTO movies (title) VALUES ('Terminator');
INSERT INTO movies (title) VALUES ('The Predator');
INSERT INTO movies (title) VALUES ('The Predator 2');
INSERT INTO movies (title) VALUES ('World War Z');
INSERT INTO movies (title) VALUES ('King Kong');

DELETE FROM movies WHERE title='World War Z' LIMIT 1;
# DELETE FROM movies WHERE title="don't look up";

UPDATE movies SET title='King Kong Vs. Godzilla' WHERE title='King Kong';