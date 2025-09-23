DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  category_id int(11) NOT NULL AUTO_INCREMENT,
  category_name varchar(150),
  remarks varchar(500),
  PRIMARY KEY (category_id)
);

INSERT INTO categories VALUES (1,'Comedy','Movies with humour'),
(2,'Romantic','Love stories'),
(3,'Epic','Story acient movies'),
(4,'Horror',NULL),(5,'Science Fiction',NULL),
(6,'Thriller',NULL),(7,'Action',NULL),
(8,'Romantic Comedy',NULL);


DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  movie_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(150),
  director varchar(150),
  year_released year(4),
  category_id int(11),
  PRIMARY KEY (movie_id),
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);
INSERT INTO movies VALUES (1,'Pirates of the Caribean 4',' Rob Marshall',2011,1),
(2,'Forgetting Sarah Marshal','Nicholas Stoller',2008,2),
(3,'X-Men',NULL,2008,NULL),
(4,'Code Name Black','Edgar Jimz',2010,NULL),
(5,'Daddy\'s Little Girls',NULL,2007,8),(6,'Angels and Demons',NULL,2007,6),
(7,'Davinci Code',NULL,2007,6),(9,'Honey mooners','John Schultz',2005,8),
(16,'67% Guilty',NULL,2012,NULL);

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  membership_number int(11) NOT NULL AUTO_INCREMENT,
  full_names varchar(350) NOT NULL,
  gender varchar(6),
  date_of_birth date,
  physical_address varchar(255),
  postal_address varchar(255),
  contact_number varchar(75),
  email varchar(255),
  referred_by int(11),
  PRIMARY KEY (membership_number),
  FOREIGN KEY(referred_by) REFERENCES members(membership_number)
);

INSERT INTO members VALUES (2,'Janet Smith Jones','Female','1980-06-23','Melrose 123',NULL,NULL,'jj@fstreet.com', NULL),
(1,'Janet Jones','Female','1980-07-21','First Street Plot No 4','Private Bag','0759 253 542','janetjones@yagoo.cm',2),
(3,'Robert Phil','Male','1989-07-12','3rd Street 34',NULL,'12345','rm@tstreet.com', 2),
(4,'Gloria Williams','Female','1984-02-14','2nd Street 23',NULL,NULL,NULL, 3);

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
  payment_id int(11) NOT NULL AUTO_INCREMENT,
  membership_number int(11),
  payment_date date,
  description varchar(75),
  amount_paid float,
  external_reference_number int(11),
  PRIMARY KEY (payment_id),
  FOREIGN KEY (membership_number) REFERENCES members (membership_number)
);

INSERT INTO payments VALUES (1,1,'2012-07-23','Movie rental payment',2500,11),
(2,1,'2012-07-25','Movie rental payment',2000,12),(3,3,'2012-07-30','Movie rental payment',6000,NULL);

DROP TABLE IF EXISTS movierentals;
CREATE TABLE movierentals (
  reference_number int(11) NOT NULL AUTO_INCREMENT,
  transaction_date date,
  return_date date,
  membership_number int(11),
  movie_id int(11),
  movie_returned bit(1) DEFAULT b'0',
  PRIMARY KEY (reference_number),
  FOREIGN KEY (membership_number) REFERENCES members (membership_number) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO movierentals VALUES (11,'2012-06-20',NULL,1,1,'\0'),
(12,'2012-06-22','2012-06-25',1,2,'\0'),
(13,'2012-06-22','2012-06-25',3,2,'\0'),
(14,'2012-06-21','2012-06-24',2,2,'\0'),
(15,'2012-06-23',NULL,3,3,'\0');
