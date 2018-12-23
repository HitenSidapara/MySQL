SHOW DATABASES;

#create database

CREATE DATABASE BOOKS;
USE BOOKS;
SELECT DATABASE();



#create table book

CREATE TABLE books(
book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255),
author_fname VARCHAR(255),
author_lname VARCHAR(255),
released_year INT,
stock_quantity INT,
pages INT
);

DESC books;


#inserting data on books table


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;


# string function CONCAT

SELECT CONCAT('HELLO',' ','WORLD');

SELECT CONCAT(author_fname,author_lname) FROM books;

SELECT CONCAT(author_fname,' ',author_lname) FROM books;

SELECT CONCAT(author_fname,author_lname) AS Fullname FROM books;

SELECT author_fname AS FirstName, author_lname AS lastName,CONCAT(author_fname,' ', author_lname) AS FullName FROM books;

SELECT CONCAT(author_fname,',',author_lname) AS FullName FROM books;

SELECT CONCAT_WS('-',title,author_fname,author_lname) AS CONCAT_WS FROM books; #CONCAT_WS PUT EXTRA STRING IN THE OUTPUT DATA


# string function substring

SELECT SUBSTRING('HELLO WORLD',1,4);

SELECT SUBSTRING('HELLO WORLD',3,7);

SELECT SUBSTRING('HELLO WORLD', 6);

SELECT SUBSTRING('HELLO WORLD',-4);  #last four char print

SELECT SUBSTRING('HELLO WORLD',-7);

SELECT SUBSTRING(title,1,10) FROM books;

SELECT SUBSTRING(title,1,10) AS Short_Data FROM books;

SELECT SUBSTR(title,1,10) AS Short_Data FROM books;

SELECT CONCAT(SUBSTR(title,1,10),'...') FROM books;

SELECT CONCAT(SUBSTR(title,1,10),'...') AS CONCAT_SUBSTR FROM books;



#string function replace

SELECT REPLACE('HELLO WORLD','HELL','@#$%');

SELECT REPLACE('HELLO WORLD','O',0);

SELECT REPLACE('HELLO WORLD','LD','ld');

SELECT REPLACE(title,'e','E') FROM books;

SELECT REPLACE(title,'e','E') AS REPLACE_DEMO FROM books;

SELECT SUBSTR(REPLACE(title,'e','E'),1,10) FROM books;

SELECT SUBSTR(REPLACE(title,'e','E'),1,10) AS SUBSTR_REPLACE FROM books;


#string function reverse

SELECT REVERSE('HELLO WORLD');

SELECT REVERSE(author_fname) FROM books;

SELECT CONCAT('abc',REVERSE('abc'));

SELECT CONCAT(author_fname,REVERSE(author_fname)) AS Palingdrom FROM books; 

#string function char_length

SELECT CHAR_LENGTH('HELLO WORLD');

SELECT CHAR_LENGTH(author_lname) AS LENGTH FROM books;

SELECT CONCAT(author_lname,' length is ',CHAR_LENGTH(author_lname)) FROM books;

SELECT CONCAT(author_lname,' length is => ',CHAR_LENGTH(author_lname)) AS FIND_LENGTH FROM books;


#string function UPPER AND LOWER

SELECT LOWER('HITEN SIDAPARA');

SELECT UPPER('hiten sidapara');

SELECT CONCAT('MY FAVORITE BOOK IS ',UPPER(title)) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ',LOWER(title)) FROM books;


#PRACTICE

SELECT REVERSE(UPPER('why does my cat look at me with such hatred ?'));

SELECT REPLACE(CONCAT('I',' ','like',' ','cats'),' ','_');

SELECT REPLACE(title,' ','=>') AS Title FROM books;

SELECT author_lname AS forwards,REVERSE(author_lname) AS backwards FROm books;

SELECT CONCAT(UPPER(author_fname),' ',UPPER(author_lname)) AS 'Full name in caps' FROm books;

SELECT CONCAT(title,' was released in ',released_year) AS blurb FROM books;

SELECT title,CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT CONCAT(SUBSTR(title,1,10),'...') AS 'short title', CONCAT(author_lname,',',author_fname) AS author, CONCAT(stock_quantity,' in stock') AS 'quantity'
 FROM books;
