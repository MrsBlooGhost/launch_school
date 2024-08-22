-- Exercise 08: Add Constraint

-- When we initially created our birds table, we forgot to take into account a key factor: preventing certain values from being entered into the database. For instance, we would never find a bird that is negative n years old. We could have included a constraint to ensure that bad data isn't entered for a database record, but we forgot to do so.

-- For this exercise, write some code that ensures that only birds with a positive age may be added to the database. 

-- a constraint with a specified constraint name:

ALTER TABLE birds
ADD CONSTRAINT positive_age CHECK (age > 0);

-- a constraint with a generated constraint name:

ALTER TABLE birds
ADD CHECK (age > 0);

-- Then write and execute an SQL statement to check that this new constraint works correctly.

INSERT INTO birds (name, age, species)
VALUES ('Penelope', -1, 'Parrot');
