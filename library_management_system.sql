DROP DATABASE IF EXISTS lms;
CREATE DATABASE IF NOT EXISTS lms;
USE lms;

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  phone BIGINT(10) NOT NULL,
  email VARCHAR(60) UNIQUE NOT NULL,
  is_admin TINYINT(1) NOT NULL,
  password VARCHAR(60) NOT NULL,
  address VARCHAR(60) NOT NULL,
  gender VARCHAR(60) NOT NULL
);

INSERT INTO users (user_id, name, phone, email, is_admin, password, address, gender) VALUES
(1, 'Sudama', 1711568524, 'sudama@gmail.com', 1, '1234', 'GUNA MP', 'Male'),
(2, 'Dayanand', 1764431859, 'dayanand@gmail.com', 0, '1234', 'Mirpur 13', 'Male'),
(4, 'aarav', 1924184941, 'aarav@gmail.com', 0, '1234', 'Mirpur 13, Dhaka', 'Male'),
(5, 'pooja', 1723645289, 'pooja@gmail.com', 0, '1234', 'Uttara, Sector 13', 'Female'),
(6, 'praveen', 1782963175, 'praveen@gmail.com', 0, '1234', 'Banani, Chairman Bari', 'Female'),
(7, 'amrit', 1932478293, 'amrit@gmail.com', 0, '1234', 'Baily Road', 'Male'),
(8, 'veependra', 1726972364, 'veependra@gmail.com', 0, '1234', 'Kallayanpur', 'Male');


CREATE TABLE publisher (
  publisher_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  address VARCHAR(60) NOT NULL
);

INSERT INTO publisher (publisher_id, name , email, address) VALUES
( 1234,"Nazrul Publications",'najpub@gmail.com', 'jwahar nagar jaipur'),
( 32,"Game of Thrones", 'gotpub@gmail.com','mirjapur uttar pradesh'),
( 435,"pearson", 'pearson@gmail.com','london, UK'),
( 3245,"geeta presh", 'geetapresh@gmail.com','jonpur uttar pradesh');


CREATE TABLE books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT DEFAULT NULL,
  genre VARCHAR(60) NOT NULL,
  title VARCHAR(60) NOT NULL,
  author VARCHAR(60) NOT NULL,
  publisher VARCHAR(60) NOT NULL,
  edition INT NOT NULL,
  isbn VARCHAR(60) NOT NULL,
  pages INT NOT NULL,
  date_issued DATE DEFAULT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO books (book_id, user_id, genre, title, author, publisher, edition, isbn, pages, date_issued) VALUES
(1, 2, 'Horror', 'Zombie Day', 'Kazi Nazrul Islam', 'Nazrul Publications', 3, 'jfklsgsdlg5qw7q87w', 800, '2022-11-10'),
(3, null, 'Adventure', 'A Song of Ice & Fire', 'George R. R. Martin', 'Game of Thrones', 8, 'has23dadh123427', 1200, null),
(4, null, 'Adventure', 'Harry Potter & The Half Blood Prince', 'J.K Rowling', 'Rowling''s Publications', 1, '31ghf1jk24kjb3l4l1gjh', 667, null),
(5, null, 'Adventure', 'Harry Potter & The Deadly Hallows', 'J.K Rowling', 'Rowling''s Publications', 2, 'agsh32gqkj12bkl134', 798, null),
(7, null, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 'Agatha Publications', 2, 'hkjkadsjfjljafljdlf', 234, null),
(6, null, 'Academics', 'Database system concept', 'S. sudarshan', 'Agatha Publications', 2, 'klklfieouoe4', 669, null),
(8, null, 'Academics', 'Compiler concept', 'Navatha', 'Agatha Publications', 2, 'nvud734973nmnf', 423, null),
(9, null, 'Academics', 'Modern database management', 'Prescott M B', 'Mcgraw Hill', 6, 'kjfla8979ewadsfa', 635, null),
(10, null, 'Modern Literature', 'In Search of Lost Time', 'Marcel Proust', 'NY Publishers', 8, '2j3nsd235habh3dfkj', 4215, null);

 
CREATE TABLE books_request (
  request_id INT(10) PRIMARY KEY AUTO_INCREMENT,
  user_id INT(10) NOT NULL,
  genre VARCHAR(60) NOT NULL,
  title VARCHAR(60) NOT NULL,
  author VARCHAR(60) NOT NULL,
  edition INT(10) NOT NULL,
  isbn VARCHAR(60) NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO books_request (request_id, user_id, genre, title, author, edition, isbn, date) VALUES
(1, 2, 'Mystery', 'Murder on the Orient Express', 'Agatha Christie', 3, '12gf3gj1jhr3jklj1ugjkb', '2022-11-10'),
(2, 5, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2022-11-10'),
(3, 4, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2022-11-10');

 

CREATE TABLE issue_date (
  issue_id INT(10) PRIMARY KEY AUTO_INCREMENT,
  book_id INT(10) NOT NULL,
  user_id INT(10) NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books (book_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO issue_date (issue_id, book_id, user_id, date) VALUES
(1, 1, 2, '2022-11-10');


ALTER TABLE books AUTO_INCREMENT = 21;
ALTER TABLE books_request AUTO_INCREMENT = 19;
ALTER TABLE users AUTO_INCREMENT = 45;
ALTER TABLE issue_date AUTO_INCREMENT = 17;