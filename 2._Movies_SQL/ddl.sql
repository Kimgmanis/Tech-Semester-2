SHOW TABLES;
CREATE TABLE IF NOT EXISTS movies (title VARCHAR(3000) NOT NULL );

# TODO Add new column to te table movies called year + change the data type to year
ALTER TABLE movies ADD COLUMN year int(4) AFTER title;

ALTER TABLE movies DROP COLUMN year;

ALTER TABLE movies modify year INT(4);

DROP TABLE movies;