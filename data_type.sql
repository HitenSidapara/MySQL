show databases;


#create new database as datatypes

#drop database datatypes;



create database datatypes;
use datatypes;
select database();



#create table dogs



create table dogs(
name char(5),
breed varchar(10)
);
#char is faster then varchar for fixed length data

desc dogs;



#inserting data


insert into dogs(name,breed)
values('bob','beagle');

insert into dogs(name,breed)
values('robby','corgi');

insert into dogs(name,breed)
values('princess jane','retriever');#this query show the error because the name length is higher than 5

insert into dogs(name,breed)
values('bob','retriever abcdefghijklmno');#this query get error because the breed varchar(10) and get data is more than 10

select * from dogs;






#decimal number
#decimal(M,D) then M range is 1 to 65 and d range is 0 to 30



create table items (
prices DECIMAL(5,2)
);

INSERT INTO items(prices)
values(7);
	  
insert into items(prices)
values(99.99);

insert into items(prices)
values(999.99);
      
insert into items(prices)
values(999);

insert into items(prices)
values(1.99);

insert into items(prices)
values(999.1234);#accept the data decimal 12
 
insert into items(prices)
values(9999);#not accept because the accept the higest number 999


select * from items;
      
      
      
      
#FLOAT AND DOUBLE => in FLOAT precesion occurs after  7 digits and DOUBLE 15 digits



create table floatdouble(price FLOAT,prices DOUBLE);

DESC floatdouble;

INSERT INTO floatdouble(price,prices)
VALUES(99.99,99999.99999);

INSERT INTO floatdouble(price,prices)
VALUES(998877665544.1122334455,112233445566778899.998877665544332211);#precesion occurs show the value in table     

SELECT * FROM floatdouble;





#DATE,TIME,DATETIME data type



create table people(
name varchar(100),
birthdate DATE,
birthtime TIME,
birthdt DATETIME
);

Desc people;

insert into people(name,birthdate,birthtime,birthdt)
VALUES('HITEN','1999-05-19','6:45:27','1999-05-19 6:45:27');

insert into people(name,birthdate,birthtime,birthdt)
VALUES('OM','2017-12-29','3:15:27','2017-12-29 3:15:27');

insert into people(name,birthdate,birthtime,birthdt)
VALUES('AARVEE','2017-12-29','3:15:29','2017-12-29 3:15:29');

delete from people;

select * from people;




#CURDATE,CURTIME & NOW function



select curdate();

select curtime();

select now();


#insert row in database

insert into people(name,birthdate,birthtime,birthdt)
VALUES('JIYANSH',curdate(),curtime(),now());

insert into people(name,birthdate,birthtime,birthdt)
VALUES('BHAVAY',curdate(),curtime(),now());

delete from people where name='JIYANSH';

delete from people where name='BHAVAY';

select * from people;




#formating date in people table

#day(),dayname(),dayofweek,dayofyear functions




select name,birthdate,day(birthdate) AS 'DAY'from people;#=> return the day

select name,birthdate,dayname(birthdate) AS 'DAY NAME'from people;#=> gives the name of the day

select name,birthdate,dayofweek(birthdate) from people;#=> in this year for particular mont number of week get

select name,birthdate,dayofyear(birthdate) from people;#it will return the year start date to the particular date between days

select name,birthdate,birthtime,day(birthdt) from people;

select name,birthdate,birthtime,dayname(birthdt) from people;

select name,birthdate,birthtime,dayofweek(birthdt) from people;

select name,birthdate,birthtime,dayofyear(birthdt) from people;



#HOOUR,MINUTE method



select name,birthtime,hour(birthtime) from people;

select name,birthtime,minute(birthtime) from people;

select name,birthtime,second(birthtime) from people;

select name,birthtime,hour(birthdt) from people;

select name,birthtime,minute(birthdt) from people;

select name,birthtime,second(birthdt) from people;

select name,birthdate,birthtime,hour(birthdate)  from people;#in birthdate not find the hour and minute nad second



#formating of the date



select concat(MONTHNAME(birthdate),' ',DAY(birthdate),' ',YEAR(birthdate)) from people;

select date_format(birthdt,"%W") from people;#here %W IS RETURN THE DAYNAME AND IT AVAIABLE IN MYSQL DOCUMANTATION

select name,date_format(birthdt,"Was Born On A %W") from people;

select birthdate,date_format(birthdt,"%m/%w/%y") from people;#formate in american time



#formate the time


select birthdate,date_format(birthdt,"%m/%w/%y at %h:%m") AS 'DATE MINUTE' from people;

select birthdate,date_format(birthdt,"%m/%w/%y at %h:%m:%s") AS 'DATE MINUTE' from people;



#DATE MATH two method 1>datediff 2>date_add


select name,birthdate,datediff(NOW(),birthdt) from people;#return the difference


#adding one month from each birthdate


select name,birthdt,date_add(birthdate,interval 1 MONTH) from people;#one way

select name,birthdt,birthdt + interval 1 MONTH FROM people;#second way

select name,birthdt,date_sub(birthdate,interval 1 MONTH) from people;

select name,birthdt,birthdt - INTERVAL 1 MONTH FROM people;#second way to sub the month from date

select name,birthdt,date_add(birthdate,interval 1 QUARTER) from people;#here one QUARTER menas that the 3 months

select name,birthdt,date_add(birthdate,interval 3 QUARTER) from people;

select name,birthdt,date_add(birthdate,interval 1 SECOND) from people;#adding current time onee second

select name,birthdt,date_add(birthdate,interval 1 YEAR) from people;#adding one year

select name,birthdt,birthdt + INTERVAL 5 MONTH +  INTERVAL 10 HOUR AS 'ADDING' FROM people;





#TIMESTAMP AND DATETIME METHOD MYSQL 5.6
#BOTH ARE STORE DATE AND TIME
#ACCORDING TO THE DUMENTATION TIMESTAMP RANGE IS 1970-01-01 to 2038-01-19
#DATETIME range is 1000-01-01 to 9999-12-31
#TIMESTAMP CONTAINS LESS SPACE THEN DATTIME


create table comments(
 contant varchar(255),
 created_at TIMESTAMP DEFAULT NOW()
);

desc comments;


insert into comments(contant) 
values('HA MOJ HA');

insert into comments(contant)
values('KHODAL NA RAJ MA');

select * from comments;

select * from comments order by created_at DESC;



#update when update data


create table comments2(
contant varchar(200),
changed_at timestamp default now() ON UPDATE current_timestamp #update when we are update the row AND USE now() using current_timestamp
);

desc comments2;

insert into comments2(contant)
VALUES('HA MOJ HA');

insert into comments2(contant)
VALUES('MA KHODAL NA RAJ MA');

insert into comments2(contant)
VALUES('HAPPY BIRTHDAY');

select * from comments2;

update comments2 SET contant="CONTANT HAS CHANGED" where contant="HA MOJ HA"; #update the timestamp





#PRACTICE


select curtime();#print the current time

select curdate();#print current date

select day(curdate());

select dayname(curdate());#days name print

select date_format(curdate(),"%m/%d/%Y");

select date_format(now(),"%M %D at %h:%m");


create table tweets(
contant varchar(140),
username varchar(20),
created_at timestamp default now()
);

insert into tweets(contant,username)
values('BAHI BHAI','HITEN');

insert into tweets(contant,username)
values('PATEL CHORU','OM');

select * from tweets;