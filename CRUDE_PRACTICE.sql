#create database shirts_db


#drop database shirts_db;

CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;
SELECT DATABASE();

#create table shirts

CREATE TABLE shirts(
shirt_id INT AUTO_INCREMENT NOT NULL,
article varchar(255),
color varchar(255),
shirt_size varchar(100),
last_worn INT,
PRIMARY KEY(shirt_id)
);

DESC shirts;

DROP TABLE shirts;


#inserting data into the table

INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;

INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES('polo shirt','purple','M',50);

SELECT article,color FROM shirts;

SELECT article,color,shirt_size,last_worn From shirts WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

SELECT * FROM shirts WHERE article='polo shirt';

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

SELECT * FROM shirts WHERE last_worn=0;

UPDATE shirts SET shirt_size='xs',color='off white' WHERE color='White';

SELECT * FROM shirts WHERE color='off White';

DELETE FROM shirts WHERE last_worn=200;

DELETE FROM shirts WHERE article='tank top'; 

DELETE FROM shirts; 

SELECT * FROM shirts;

DROP TABLE shirts;
