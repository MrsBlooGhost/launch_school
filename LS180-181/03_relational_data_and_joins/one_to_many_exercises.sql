-- 1. Write a SQL statement to add the following call data to the database:

    -- when	                duration	first_name	last_name	number
    -- 2016-01-18 14:47:00	632	      William	    Swift	    7204890809

calls: id, when, duration, contact_id
contacts: id, first_name, last_name, number

INSERT INTO calls
("when", duration, contact_id)
VALUES
('2016-01-18 14:47:00', 632, 6);

-- 2. Write a SQL statement to retrieve the call times, duration, and first name for all calls not made to William Swift.

SELECT "when", duration, first_name
FROM
calls INNER JOIN contacts
ON calls.contact_id = contacts.id
WHERE contact_id != 6;

-- 3. Write SQL statements to add the following call data to the database:

-- when	                duration	first_name	last_name	number
-- 2016-01-17 11:52:00	175	      Merve	      Elk	      6343511126
-- 2016-01-18 21:22:00	79	      Sawa	      Fyodorov	6125594874

INSERT INTO contacts (id, first_name, last_name, number)
VALUES
(4, 'Merve', 'Elk', 6343511126),
(5, 'Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
VALUES
('2016-01-17 11:52:00', 175, 4),
('2016-01-18 21:22:00', 79, 5);

-- 4. Add a constraint to contacts that prevents a duplicate value being added in the column number.

ALTER TABLE contacts
ADD CONSTRAINT unique_number UNIQUE (number);

-- 5. Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?

INSERT INTO contacts (id, first_name, last_name, number)
VALUES
(100, 'John', 'Jones', 6343511126);

Error message:
ERROR:  duplicate key value violates unique constraint "unique_number"
DETAIL:  Key (number)=(6343511126) already exists.

-- 6. Why does "when" need to be quoted in many of the queries in this lesson?

The word when is a keyword in SQL, meaning it has a special action. To escape the keyword and use when as an identifier, surround it with double quotes.

-- 9. Draw an entity-relationship diagram for the data we've been working with in this assignment.
 __________           __________
|          |       / |          |
| contact  | --------|   call   |
|__________|       \ |__________|
