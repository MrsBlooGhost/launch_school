CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  amount DECIMAL(6,2) NOT NULL,
  memo TEXT NOT NULL,
  created_on DATE NOT NULL
);

ALTER TABLE expenses
  ADD CONSTRAINT positive_amount CHECK (amount > 0);
