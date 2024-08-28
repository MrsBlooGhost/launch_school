-- 2.

SELECT * FROM films;

-- 3.

SELECT * FROM films
WHERE length(title) < 12;

-- 4.

ALTER TABLE films
ADD COLUMN director varchar(255),
ADD COLUMN duration integer;

-- 5.

UPDATE films
SET director = 'John McTiernan', duration = 132
  WHERE title = 'Die Hard';

UPDATE films
SET director = 'Michael Curtiz', duration = 102
  WHERE title = 'Casablanca';

  UPDATE films
SET director = 'Francis Ford Coppola', duration = 113
  WHERE title = 'The Conversation';

-- 6.

INSERT INTO films
VALUES
('1984',	1956,	'scifi',	'Michael Anderson',	90),
('Tinker Tailor Soldier Spy', 2011,	'espionage',	'Tomas Alfredson',	127),
('The Birdcage',	1996,	'comedy',	'Mike Nichols',	118);

-- 7.

SELECT title, date_part('year', current_date) - "year" AS age
FROM films
ORDER BY age;
