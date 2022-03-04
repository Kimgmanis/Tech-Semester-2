SHOW TABLES;

# Rules for casing
# PascalCase
# snake_case

# Two types of Delete
# Hard Delete
# Soft Delete

# TODO Define a primary key in movies
CREATE TABLE IF NOT EXISTS movies
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year  YEAR
);

# TODO create directors and create a foreign key on directors that points to movies
CREATE TABLE IF NOT EXISTS directors
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(32),
    lastname  VARCHAR(32),
    movie_id  INT,
    FOREIGN KEY (movie_id) REFERENCES movies (id)
);

/*# TODO Add new column to te table movies called year + change the data type to year
ALTER TABLE movies
    ADD COLUMN year YEAR NOT NULL AFTER title;

ALTER TABLE movies
    DROP COLUMN year;

ALTER TABLE movies
    modify year INT(4);

DROP TABLE movies;*/