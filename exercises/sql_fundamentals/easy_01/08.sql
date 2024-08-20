ALTER TABLE birds
ADD CONSTRAINT check_age CHECK (age > 0);
