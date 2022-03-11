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

# TODO create the table actors and set up the correct relation
CREATE TABLE IF NOT EXISTS movies_actors
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (actor_id) REFERENCES actors (id)
);

CREATE TABLE IF NOT EXISTS actors
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname varchar(32),
    lastname varchar(32),
    roles varchar(32)
);

CREATE TABLE IF NOT EXISTS production_teams
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS movies_production_teams
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    production_team_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (production_team_id) REFERENCES production_teams(id) ON DELETE CASCADE
);

# Cascade

/*# TODO Add new column to te table movies called year + change the data type to year
ALTER TABLE movies
    ADD COLUMN year YEAR NOT NULL AFTER title;

ALTER TABLE movies
    DROP COLUMN year;

ALTER TABLE movies
    modify year INT(4);

DROP TABLE movies;*/