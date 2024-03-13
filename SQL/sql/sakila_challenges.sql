# get average film length
SELECT AVG(LENGTH) FROM film;

# get all films which more than average length
SELECT * FROM film f WHERE f.length > (SELECT AVG(LENGTH) FROM film);

# get the costliest film replacement
SELECT MAX(replacement_cost) FROM film;

# get all rows with the max value for replacement_cost
SELECT * FROM	film f WHERE f.replacement_cost = (SELECT MAX(replacement_cost) FROM film);

# get the year with the most releases
SELECT release_year FROM film f GROUP BY release_year ORDER BY COUNT(release_year) DESC LIMIT 1;

# get all films which were releases in the year with the most releases
SELECT * FROM film f WHERE f.release_year = (SELECT release_year FROM film f GROUP BY release_year ORDER BY COUNT(release_year) DESC LIMIT 1);
