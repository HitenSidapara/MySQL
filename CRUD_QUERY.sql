show databases;

#CREATE DATABASE CRUD=>create,read,update,delete and SELECT DATABASE

#drop database crud;

create database crud;
use crud;
select database();


# CREATE THE TABLE CATS


CREATE TABLE cats(
cat_id INT NOT NULL auto_increment,
name varchar(100),
breed varchar(100),
age INT,
PRIMARY KEY(cat_id)
);

DESC cats;


#INSERT DATA INTO THE TABLE

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
 # SELECT COMMAND    
 
 
select * from cats;

SELECT name FROM cats;

SELECT age FROM cats;

SELECT name,age FROM cats;

SELECT cat_id,name,age FROM cats;

SELECT age,breed,name,cat_id FROM cats; 

SELECT breed,cat_id,name FROM cats;

SELECT CAT_ID,NAME,AGE FROM cats; 


SELECT * FROM cats;

SELECT * FROM cats WHERE age=4;

SELECT * FROM cats WHERE name='Egg';

SELECT * FROM cats WHERE name='EGG';

SELECT * FROM cats WHERE name='egg';

SELECT * FROM cats WHERE age>4;

SELECT cat_id FROM cats;

SELECT name,breed FROM cats;

SELECT name,age,breed FROM cats WHERE breed='Tabby';

SELECT cat_id,age FROM cats WHERE cat_id=age;

SELECT cat_id AS id,name From cats;

SELECT name AS 'CAT_NAME',breed AS 'CAT_BREED' FROM cats;

DESC cats;





# UPDATE COMMANDS


SELECT * FROM CATS;

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

UPDATE cats SET age=14 WHERE name='Misty';

SELECT name,age FROM cats WHERE age=14;

UPDATE cats SET name='Jack' WHERE name='Jackson';

SELECT * FROM cats WHERE name='JACK';

UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';

SELECT * FROM cats Where name='Ringo';

UPDATE cats SET age=12 WHERE breed='Maine Coon';

SELECT * FROM cats WHERE age=12;



# DELETE COMMAND

DELETE FROM cats WHERE name="Egg";
SELECT * FROM cats;
DELETE FROM cats; #delete all the contant not table


DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;


DESC cats;