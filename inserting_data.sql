show databases;
use students;
select database();
show tables;

desc student;

INSERT INTO student(sname,age)
VALUES ('Hiten',19);
insert into student(age,sname)
values(20,'Raj');
insert into student(sname,age)
values('Akshay',20);

select * from student;

insert into student(sname,age)
values('Ravi',19);
insert into student(sname,age)
values('Darshit',20);
insert into student(sname,age)
values('Valtshal',21);
insert into student(sname,age)
values('Rushil',22);
insert into student(sname,age)
values('Parth',25);


insert into student(sname,age)
values('Harshad',22),
	  ('Jay',21),
      ('Prashant',19),
      ('Bhavin',23),
      ('Amit',25),
      ('Mayank',23),
      ('Kishan',26),
      ('Kaushik',18);






desc teacher;


insert into teacher(tname,age)
values('Himansu',39);
insert into teacher(tname,age)
values('Vira',25);
insert into teacher(tname,age)
values('Pratik',27);
insert into teacher(tname,age)
values('Alpa',28);
insert into teacher(tname,age)
values('Deep',26);


select * from teacher;






create table person(
	first_name varchar(20),
    last_name varchar(20),
    age int
);

desc person;

insert into person(first_name,last_name,age)
values('Tina','Belcher',13);
insert into person(last_name,first_name,age)
values('Belcher','Bob',42);


insert into person(first_name,last_name,age)
values('Linda','Belcher',45),
	  ('Phiilip','Frond',38),
      ('Calvin','Fischoeder',70);
      
      
select * from person;


drop table person;









create table people1(
 name varchar(20),
 age int
);

desc people;

INSERT INTO people1(name,age)
VALUES('Ram',10);
insert into people1(name)
values('Kishan');
insert into people1(age)
value(18);

SELECT * FROM people1;





create table people(
 name varchar(20) DEFAULT 'un_named',
 age int DEFAULT 99
);

desc people;

INSERT INTO people(name,age)
VALUES('Raj',34);

INSERT INTO people(name)
VALUES('Kishan');

INSERT INTO people(age)
VALUES(45);

INSERT INTO people(name,age)
VALUES('Rakesh',NULL);

INSERT INTO people(name,age)
VALUES(NULL,34);

INSERT INTO people(name,age)
VALUES(NULL,null);

select * from people;







CREATE TABLE people2(
name varchar(20) NOT NULL DEFAULT 'NAME NOT SPECIFIED',
age int NOT NULL DEFAULT 50
);

DESC people2;

INSERT INTO people2(name,age)
VALUES('Hiten',20);

INSERT INTO people2(name)
VALUES('Raj'),
	  ('Akshay');
      
INSERT INTO people2(age)
VALUES(23),
	  (25);
      
INSERT INTO people2(name,age)
VALUES('Kevin',NULL);

SELECT * FROM people2;





CREATE TABLE users(
u_id INT AUTO_INCREMENT,
uname varchar(20) NOT NULL DEFAULT "not namespecified",
age INT NOT NULL DEFAULT 20,
PRIMARY KEY(u_id)
);

DESC  users;

INSERT INTO users(uname,age)
VALUES('Hiten',13),
	  ('Jay',14),
      ('Mayank',15),
      ('Prashnat',12);
      
INSERT INTO users(uname)
VALUES('Raj'),
      ('Rushil'),
      ('Krutik');

      
INSERT INTO users(age)
VALUES(23),
	   (67),
       (54);
       
INSERT INTO users(uname,age)
VALUES(NULL,NULL);
       
select * from users;



CREATE TABLE employees(
 id INT AUTO_INCREMENT NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 first_name VARCHAR(255) NOT NULL,
 middel_name VARCHAR(255),
 age INT NOT NULL,
 current_status VARCHAR(255) NOT NULL DEFAULT 'Employed',
 PRIMARY KEY(id)
);

DESC employees;

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);

SELECT * FROM employees;





      
      
      
      
      
      
	