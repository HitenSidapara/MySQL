show databases;

#create a new database

 #drop database tv_review_app;


 create database tv_review_app;
 use tv_review_app;
 select database();
 
 
 #create a tables
 
 
 
 #reviewers table create
 
 create table reviewers(
 id int auto_increment primary key,
 first_name varchar(100),
 last_name varchar(100)
 );
 
 desc reviewers;
 
 #inserting data
 
 INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
select * from reviewers;



	#series table
 
 create table series(
 id int auto_increment primary key,
 title varchar(200),
 released_year year(4),#accecpt the 4 digit year
 genre varchar(100)
 );
 
 desc series;
 
 #inserting data
 
 INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    

select * from series;



	#review table
    
create table reviews(
id int auto_increment primary key,
rating decimal(2,1),
series_id int,
reviewer_id int,
foreign key(series_id) references series(id),
foreign key(reviewer_id) references reviewers(id)
);


desc reviews;

#inserting data

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
select * from reviews;


#1st challenge

select title,rating from series
join reviews
on series.id=reviews.series_id;


#2nd challenge

select title,
avg(rating) AS 'avg_rating'
from series join reviews
on series.id=reviews.series_id
group by title
order by avg_rating;

select title,
avg(rating) AS 'avg_rating'
from series join reviews
on series.id=reviews.series_id
group by series.id
order by avg_rating;#second way this is an unique because title are the same but id is the primary key on the series table



#3rd challenge

select first_name,last_name,rating from reviewers
join reviews 												#this is the type of the inner join so the order not issue
on reviewers.id=reviews.reviewer_id;						#we are join reviewers,reviews and reviews,reviewers both result are same so the order not issue bcz it is inner join
      


#4th challenge

select title AS 'unreviewed_series'
from series
left join reviews
on series.id = reviews.series_id
where rating is null;   


#5th challenge

select * from reviews;

select * from series;

select genre,
avg(rating) AS 'avg_rating'
from series
inner join reviews
on series.id=reviews.series_id
group by genre;


select genre,
round(avg(rating),2) #round function is used to the rounding the value
AS 'avg_rating'
from series
inner join reviews
on series.id=reviews.series_id
group by genre;





#6th challenge

select * from reviews;

select * from reviewers;

select first_name,
last_name,
ifnull(count(rating),0) AS 'count',
ifnull(min(rating),0) AS 'min',
ifnull(max(rating),0) AS 'max',
ifnull(avg(rating),0) AS 'avg',
case
	when  rating is null then 'INACTIVE'
    else 'ACTIVE'
end AS 'status'
from reviewers
left join reviews
on reviewers.id=reviews.reviewer_id
group by last_name,first_name;


select first_name,
last_name,
ifnull(count(rating),0) AS 'count',
ifnull(min(rating),0) AS 'min',
ifnull(max(rating),0) AS 'max',
ifnull(avg(rating),0) AS 'avg',
case
	when  count(rating) >=1 then 'ACTIVE'
    else 'INACTIVE'
end AS 'status'
from reviewers
left join reviews
on reviewers.id=reviews.reviewer_id
group by reviewers.id;                     #here use the reviewers that can be unique for all the user


select first_name,
last_name,
ifnull(count(rating),0) AS 'count',
ifnull(min(rating),0) AS 'min',
ifnull(max(rating),0) AS 'max',
ifnull(avg(rating),0) AS 'avg',

if(count(rating)>=1,'ACTIVE','INACTIVE') 'status' #if function that use in one line get if and else parameter value return
from reviewers
left join reviews
on reviewers.id=reviews.reviewer_id
group by reviewers.id;


#some other stuff

select first_name,
last_name,
ifnull(count(rating),0) AS 'count',
ifnull(min(rating),0) AS 'min',
ifnull(max(rating),0) AS 'max',
ifnull(avg(rating),0) AS 'avg',
case
	when avg(rating) >=8 then 'POWER USER'
    when avg(rating) >=1 then 'ACTIVE USER'
    else 'INACTIVE USER'
end AS 'status'
from reviewers
left join reviews
on reviewers.id=reviews.reviewer_id
group by reviewers.id;






#7th challenge  => 3 tables

select * from reviewers;
#1st step

select * from reviewers
inner join reviews
on reviewers.id=reviews.reviewer_id
#joining other table with inner join
inner join series
on series.id=reviews.series_id;

#2nd step

select title,
rating,
concat(first_name,' ',last_name) AS 'reviewer'
from reviewers
inner join reviews
on reviewers.id=reviews.reviewer_id
#joining other table with inner join
inner join series
on series.id=reviews.series_id
order by title;


#in inner join order not important and this is easy to understand 
#because the reviews table join with series and the reviewers

select title,
rating,
concat(first_name,' ',last_name) AS 'reviewer'
from reviews
inner join reviewers
on reviewers.id=reviews.reviewer_id
#joining other table with inner join
inner join series
on series.id=reviews.series_id
order by title;