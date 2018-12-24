#select database and use the data base

#DROP DATABASE books;

show databases;
use books;
select database();






#insert in books table some new book

INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
	   ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
	   ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
       
select * from books;

select title from books;



#DESTINCT use to the duplicate value remove and unique value fetch from the database


select author_lname from books;

select distinct author_lname from books; #unique value fetch from the database and remove the duplicate value

select distinct released_year from books;

select author_fname,author_lname from books;  # author_fname and author_last name both mand distinct

select concat(author_fname,' ',author_lname) AS 'DISTINCT'from books;  #duplicate the value in table

select distinct concat(author_fname,' ',author_lname) AS 'DISTINCT'from books; #fetch the distinct value  this is one way

select distinct author_fname,author_lname from books; #applay distinct in two row and fetch unique data this is second way






#ORDER BY

select author_lname From books; #not shorted data

select author_lname from books order by author_lname;#shorting data from alpabets Assending order

select author_lname from books order by author_lname desc;#shorted descnding order

select title from books;  #not shorted data

select title from books order by title; #shorted data fetch

select title from books order by title desc;

select released_year from books order by released_year;#shoreted in assending order

select released_year from books order by released_year DESC;

select released_year from books order by released_year ASC;

select title,released_year,pages from books order by released_year;#shorted according to the released_year

select title,author_fname,author_lname,pages from books order by released_year;

select title,author_fname,author_lname,pages from books order by pages;

select title,author_fname,author_lname from books order by 2; #here order by two means 1=title,2=author_fname,3=author_lanme so the data shorting according to the author_lname

select author_fname,title,author_lname from books order by 3; #shorted accoding to then author_lname

select author_fname,author_lname from books order by author_lname;# shorted by author_lname

#but the same data in last name then we are shorting to referencing other column

select author_fname,author_lname from books order by author_lname,author_fname;




#limit function



select title from books; #all the data fetch

select title from books LIMIT 3; #only  three book fetch

select * from books LIMIT 10; #only 10 data fetch

select author_fname,author_lname from books LIMIT 5; #first five author fetch

select * from books order by released_year desc LIMIT 5;

select title,author_fname,author_lname from books order by released_year DESC LIMIT 5;

select title,released_year from books order by 2 DESC LIMIT 0,5; #LIMIT BETWEEN 0 to 5

select title,released_year from books order by 2 DESC LIMIT 0,3;

select title,released_year from books order by 2 DESC LIMIT 5,10;

select * from books LIMIT 5,123456789; #in second parameter we are use some gigantic number 






#LIKE Function => used to search better and flexible search




select * from books where author_fname LIKE "%da%";  #in author_fname contains words da then fetch the data

select * from books where author_fname LIKE "da%";  #starts with da and next anything else

select * from  books where author_fname like "%da"; #end with da then only fetch the data

select title from books where title LIKE "%the%";

select * from books where stock_quantity LIKE "%"; #all the quantity fetch

select title,stock_quantity from books where stock_quantity LIKE "__";#fetch data exacty two digit stock_quantity data

select * from books where stock_quantity LIKE "____";#fetch 4 digit data

select * from books where stock_quantity LIKE "___";#fetch 3 digit data

select title from books where title like "%\%%";#here fetch the % sign from the database

select title from books where title like "%\_%";#here find the _ sign from the database







#practice



select title from books where title LIKE "%stories";

select title,pages from books order by pages DESC LIMIT 1;  

select concat(title,' - ',released_year) AS 'summary'from books order by released_year DESC LIMIT 3;

select title,author_lname from books where author_lname LIKE "% %";#space between the author_lname data fetch

select title,released_year,stock_quantity from books order by stock_quantity LIMIT 3;  

select title,author_lname from books order by author_lname,title;

select concat('MY FAVORITE AUTHOR NAME IS ',upper(author_fname),' ',upper(author_lname),' !') AS yell from books order by author_lname;