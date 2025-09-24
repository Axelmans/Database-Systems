DROP TABLE IF EXISTS movierentals;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS categories;

-- CATEGORIES
CREATE TABLE categories (
  category_id     INTEGER PRIMARY KEY,
  category_name   TEXT,
  remarks         TEXT
);

-- MOVIES
CREATE TABLE movies (
  movie_id        INTEGER PRIMARY KEY,
  title           TEXT,
  director        TEXT,
  year_released   INTEGER,
  category_id     INTEGER,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- MEMBERS
CREATE TABLE members (
  membership_number INTEGER PRIMARY KEY,
  full_names        TEXT NOT NULL,
  gender            TEXT,
  date_of_birth     TEXT,
  physical_address  TEXT,
  postal_address    TEXT,
  contact_number    TEXT,
  email             TEXT,
  referred_by       INTEGER,
  FOREIGN KEY (referred_by) REFERENCES members(membership_number)
);

-- PAYMENTS
CREATE TABLE payments (
  payment_id                 INTEGER PRIMARY KEY,
  membership_number          INTEGER,
  payment_date               TEXT,
  description                TEXT,
  amount_paid                REAL,
  external_reference_number  INTEGER,
  FOREIGN KEY (membership_number) REFERENCES members(membership_number)
);

-- MOVIERENTALS
CREATE TABLE movierentals (
  reference_number  INTEGER PRIMARY KEY,
  transaction_date  TEXT,
  return_date       TEXT,
  membership_number INTEGER,
  movie_id          INTEGER,
  movie_returned    INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (membership_number) REFERENCES members(membership_number),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- ------------------------------------------------------------------
-- Seed data
-- ------------------------------------------------------------------

INSERT INTO categories (category_id, category_name, remarks) VALUES
(1,'Comedy','Movies with humour'),
(2,'Romantic','Love stories'),
(3,'Epic','Story acient movies'),
(4,'Horror',NULL),
(5,'Science Fiction',NULL),
(6,'Thriller',NULL),
(7,'Action',NULL),
(8,'Romantic Comedy',NULL);

INSERT INTO movies (movie_id, title, director, year_released, category_id) VALUES
(1,'Pirates of the Caribean 4','Rob Marshall',2011,1),
(2,'Forgetting Sarah Marshal','Nicholas Stoller',2008,2),
(3,'X-Men',NULL,2008,NULL),
(4,'Code Name Black','Edgar Jimz',2010,NULL),
(5,'Daddy''s Little Girls',NULL,2007,8),
(6,'Angels and Demons',NULL,2007,6),
(7,'Davinci Code',NULL,2007,6),
(9,'Honey mooners','John Schultz',2005,8),
(16,'67% Guilty',NULL,2012,NULL);

INSERT INTO members (membership_number, full_names, gender, date_of_birth, physical_address, postal_address, contact_number, email, referred_by) VALUES
(2,'Janet Smith Jones','Female','1980-06-23','Melrose 123',NULL,NULL,'jj@fstreet.com', NULL),
(1,'Janet Jones','Female','1980-07-21','First Street Plot No 4','Private Bag','0759 253 542','janetjones@yagoo.cm',2),
(3,'Robert Phil','Male','1989-07-12','3rd Street 34',NULL,'12345','rm@tstreet.com', 2),
(4,'Gloria Williams','Female','1984-02-14','2nd Street 23',NULL,NULL,NULL, 3);

INSERT INTO payments (payment_id, membership_number, payment_date, description, amount_paid, external_reference_number) VALUES
(1,1,'2012-07-23','Movie rental payment',2500.00,11),
(2,1,'2012-07-25','Movie rental payment',2000.00,12),
(3,3,'2012-07-30','Movie rental payment',6000.00,NULL);

INSERT INTO movierentals (reference_number, transaction_date, return_date, membership_number, movie_id, movie_returned) VALUES
(11,'2012-06-20',NULL,1,1,0),
(12,'2012-06-22','2012-06-25',1,2,0),
(13,'2012-06-22','2012-06-25',3,2,0),
(14,'2012-06-21','2012-06-24',2,2,0),
(15,'2012-06-23',NULL,3,3,0);
