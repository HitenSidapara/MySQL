create database trigger_demo;

use trigger_demo;

select  database();

create table users(
username varchar(200),
age int
);


desc users;

insert into users(username,age)
values('hiten',20);

insert into users(username,age)
values('akshay',16);

select * from users;

#create a trigger


DELIMITER $$

CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age < 18
        THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Must be an adult';
		END IF;
	END;
$$
DELIMITER ;   #it is used to the show our code is complete
    
    
select * from users;

insert into users(username,age)
values('raj',22);
    
insert into users(username,age)
values('rushil',12);



show databases;