show databases;

#create database rj means relationship and joins
#DROP DATABASE rj;

create database rj;
use rj;
select database();



#create a tables Customers and Orderes

create table customers(
id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(100)
);

desc customers;

create table orders(
id int auto_increment primary key,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key(customer_id) references customers(id)
);

desc orders;






#inserting data

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       

select * from customers;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       

select * from orders;

#now insert in order table some fack customer_id which have do not exist in customer table so give error

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);                            #error give









# joins table query

select id from customers where last_name='George';

select * from orders where customer_id=1;

# combine both query with subquery

select * from orders where customer_id = (select id from customers where last_name='George');


# KARTAZIAN AND CROSS JOIN =>worth less join

select * from customers,orders;#give all the possible result

select * from orders,customers;




#inner join


#IMPLICIT INNER JOINS

select * from customers , orders
where customers.id = orders.customer_id;   #here customers.id = customers table and id row specified because in order table id row
										   #orders.customers_id = orders table customer_id row then fetch the data
                                           
select customers.id AS ID,first_name,last_name,order_date,amount from customers,orders
where customers.id = orders.customer_id;


#EXPLICIT INNER JIONS

select * from customers 
join orders ON customers.id=orders.customer_id;#developer use

select first_name,last_name,order_date,amount from customers 
join orders ON customers.id=orders.customer_id;

select first_name,last_name,order_date,amount from customers 
join orders ON customers.id=orders.customer_id
order by amount;

select first_name,last_name,order_date,amount from customers 
join orders ON customers.id=orders.customer_id
order by order_date;

select first_name,
last_name,
order_date,
amount,
sum(amount) AS 'total_amount' 
from customers join orders 
on customers.id=orders.customer_id
group by orders.customer_id
order by total_amount desc;






#left join

select * from customers
left join orders
on customers.id=orders.customer_id;#in left join all the data shoe left side and right side only customer_id row fetch from the orders table

select * from orders
left join customers
on customers.id=orders.customer_id;

select first_name,
last_name,
ifnull(sum(amount),0) AS 'TOTAL_AMOUNT'             #ifnull(amount,0) => is used to the amonut is null then replace with the 0
from customers left join orders 
on customers.id=orders.customer_id
group by customers.id
order by TOTAL_AMOUNT DESC;





#RIGHT JOIN


select * from customers
right join orders
on customers.id=orders.customer_id
group by customer_id;





#delete casecade

drop table orders;

drop table customers;

show  tables;

create table customers(
id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(100)
);

desc customers;

create table orders(
id int auto_increment primary key,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key(customer_id)
references customers(id)
on delete cascade		#it means that the delete data from customer table then delete that orders
);

desc orders;

drop table orders;

drop table customers;

show  tables;




#inserting data

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       

select * from customers;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       

select * from orders;

delete  from customers where email='george@gmail.com'; 

select * from customers;#both table delete eighter forigen key

select * from orders;





#some other stuff

select * from customers 
left join orders on customers.id = orders.customer_id;

select * from orders
right join customers on customers.id = orders.customer_id;#both are same but order are change

select * from orders
left join customers on customers.id = orders.customer_id;

select * from customers
right join orders on customers.id = orders.customer_id;#both result are same but order are change





#practice


 create table students(
 id int auto_increment primary key,
 first_name varchar(50)
 );


desc students;

create table papers(
title varchar(255),
grade int,
student_id INT,
foreign key(student_id) references students(id)
on delete cascade
);

desc papers;

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

select * from students;

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from papers;

#1st

select first_name,title,grade from students 
inner join papers 
on students.id=papers.student_id
order by grade desc;  #following all the query get the same result

select first_name,title,grade from students 
right join papers 
on students.id=papers.student_id
order by grade desc;

select first_name,title,grade from papers 
left join  students
on students.id=papers.student_id
order by grade desc;

# 2nd

select first_name,title,grade from students 
left join  papers
on students.id=papers.student_id;#both query same result get bot order are change

select first_name,title,grade from papers 
right join  students
on students.id=papers.student_id;


#3rd

select first_name,
ifnull(title,'MISSING'),
ifnull(grade,0) 
from students 
left join  papers
on students.id=papers.student_id;

select first_name,
ifnull(title,'MISSING'),
ifnull(grade,0) 
from  papers
right join students 
on students.id=papers.student_id;

#4th

select first_name,
ifnull(AVG(grade),0) AS 'average'
from students  
left join papers 
on students.id=papers.student_id
group by first_name
order by average desc ;


#5th

select first_name,
ifnull(AVG(grade),0) AS 'average',
CASE
 when AVG(grade) >=75 then 'PASSING'
 else 'FAILING'
END AS 'PASSING_STATUS'
from papers   
right join  students
on students.id=papers.student_id
group by first_name
order by average desc ;

select first_name,
ifnull(AVG(grade),0) AS 'average',
CASE
 when AVG(grade) >=75 then 'PASSING'
 else 'FAILING'
END AS 'PASSING_STATUS'
from students  
left join papers 
on students.id=papers.student_id
group by first_name
order by average desc ;