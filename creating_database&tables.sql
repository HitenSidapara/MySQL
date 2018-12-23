create database students;
show databases;
use students;
select database();
create table student(
	sname varchar(100),
    age int
);
create table teacher(
	tname varchar(100),
    age int
);
create table pastries(
 name varchar(50),
 quantity int
);
show tables;
desc pastries;
drop table pastries;
show columns from student;
describe student;
desc teacher;
DROP TABLE teacher;
drop database students;
