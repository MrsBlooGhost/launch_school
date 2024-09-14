customers: id(pkey) first_name last_name phone email
events: id(pkey) name starts_at base_price
seats: id(pkey) section_id(fkey) row number
sections: id(pkey) code name price_multiplier
tickets: id event_id(fkey) seat_id(fkey) customer_id(fkey)

-- Write a query that determines how many tickets have been sold.

  -- Expected Output
  
  -- count
  -- -------
  -- 3783
  -- (1 row)

SELECT count(id) FROM tickets;

-- Write a query that determines how many different customers purchased tickets to at least one event.

  -- Expected Output

  --   count
  -- -------
  --   1652
  -- (1 row)

SELECT count(DISTINCT customer_id) FROM tickets;

-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

  -- Expected Output

  --   percent
  -- ----------
  --     16.52
  -- (1 row)

-- Need data from customers table: number of customers
-- Need data from tickets table: count of distinct customer_id
--> Use JOIN

SELECT round( count(DISTINCT t.customer_id) 
            / count(DISTINCT c.id)::decimal * 100, 2) 
      AS percent 
FROM customers AS c LEFT JOIN tickets AS t
ON c.id = t.customer_id;

-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

  -- Expected Output

  --             name            | popularity
  -- ----------------------------+------------
  --   A-Bomb                     |        555
  --   Captain Deadshot Wolf      |        541
  --   Illustrious Firestorm      |        521
  --   Siren I                    |        457
  --   Kool-Aid Man               |        439
  --   Green Husk Strange         |        414
  --   Ultra Archangel IX         |        359
  --   Red Hope Summers the Fated |        307
  --   Magnificent Stardust       |        134
  --   Red Magus                  |         56
  -- (10 rows)

SELECT e.name, count(t.id) AS popularity
FROM
tickets AS t RIGHT OUTER JOIN events AS e
ON t.event_id = e.id
GROUP BY e.name
ORDER BY popularity DESC;

-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

SELECT c.id, c.email, count(t.event_id)
FROM
tickets AS t INNER JOIN customers AS c
ON t.customer_id = c.id
GROUP BY c.id
HAVING count(t.event_id) = 3;

  -- Expected Output

  --   id   |                email                 | count
  -- -------+--------------------------------------+-------
  --   141  | isac.hayes@herzog.net                |     3
  --   326  | tatum.mraz@schinner.org              |     3
  --   624  | adelbert.yost@kleinwisozk.io         |     3
  --   1719 | lionel.feeney@metzquitzon.biz        |     3
  --   2058 | angela.ruecker@reichert.co           |     3
  --   3173 | audra.moore@beierlowe.biz            |     3
  --   4365 | ephraim.rath@rosenbaum.org           |     3
  --   6193 | gennaro.rath@mcdermott.co            |     3
  --   7175 | yolanda.hintz@binskshlerin.com       |     3
  --   7344 | amaya.goldner@stoltenberg.org        |     3
  --   7975 | ellen.swaniawski@schultzemmerich.net |     3
  --   9978 | dayana.kessler@dickinson.io          |     3
  -- (12 rows)


-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report should include the event name and starts_at and the seat's section name, row, and seat number.

customers: id(pkey) email
events: id(pkey) name starts_at
seats: id(pkey) section_id(fkey) row number
sections: id(pkey) name
tickets: event_id(fkey) seat_id(fkey) customer_id(fkey)

SELECT e.name AS event, 
       e.starts_at, 
       sect.name AS section, 
       seats.row, 
       seats.number AS seat
FROM tickets AS t 
INNER JOIN customers AS c
  ON t.customer_id = c.id
INNER JOIN events AS e
  ON t.event_id = e.id
INNER JOIN seats
  ON t.seat_id = seats.id
INNER JOIN sections AS sect
  ON seats.section_id = sect.id
WHERE c.email = 'gennaro.rath@mcdermott.co';

  -- Expected Output

  --         event        |      starts_at      |    section    | row | seat
  -- --------------------+---------------------+---------------+-----+------
  --   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
  --   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
  --   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
  --   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
  --   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
  --   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
  --   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
  -- (7 rows)

