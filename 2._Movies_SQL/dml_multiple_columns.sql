###################################################
# Select
###################################################
SELECT title, year FROM movies;
SELECT year FROM movies;

SELECT * FROM movies WHERE year = 2022;
SELECT * FROM movies WHERE year < 2022;

SELECT * FROM movies WHERE year < NOW();

SELECT * FROM movies WHERE year IS NOT NULL;

SELECT * FROM movies WHERE 1=1;

SELECT * FROM movies ORDER BY year ;
SELECT * FROM movies ORDER BY year ASC;
SELECT * FROM movies ORDER BY year DESC;

SELECT * FROM movies ORDER BY title ;

###################################################
# Insert
###################################################

INSERT INTO movies (title, year) VALUES ("The Cremator", 1965);
INSERT INTO movies VALUES ("The Cremator", 1965);

INSERT INTO movies (title) VALUES ("The Cremator");
# Won't work because of title is defined as NOT NULL
# INSERT INTO movies (year) VALUES (1965);