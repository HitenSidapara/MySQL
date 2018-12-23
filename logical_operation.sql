#logical operator
#use database books 

show databases;
use books;
select database();
select * from books;



#logical not operator => !=

select title,released_year from books where released_year = 2017;		#normal query

select title,released_year from books where released_year != 2017;		#not equal query

select title,author_lname from books where author_lname != 'Harris';



#NOT LIKE LOGICAL OPERATOR

select title from books where title LIKE "%w%";

select title from books where title NOT LIKE "%w%";#give the result excluding w char




#grater than & grater than equal operator

select title,released_year from books order by released_year;

select title,released_year from books where released_year>2000  order by released_year;

select title,released_year from books where released_year>=2000  order by released_year;

select title,stock_quantity from books where stock_quantity >= 100 order by stock_quantity;

select 99>1;#return boolean value true=1

select 1>99;#return boolean value false=0

select 100>5;

select -15>15;

select 9>-10;

select 1>1;

select 'a'>'b';

select 'A'>'a';

select 'A'>='a';#in mmysql return true

select title,author_lname from books where author_lname='Eggers';

select title,author_lname from books where author_lname='eggers';#not is case sensitive

select title,author_lname from books where author_lname='eGGers';#not is case sensitive





#less than and less then equals to signal

select title,released_year from books order by released_year;

select title,released_year from books where released_year < 2000 order by released_year;

select title,released_year from books where released_year <= 2000 order by released_year;

select 'Q' <= 'q';#here sql is not case sensitive




#logical and operator

select title,author_lname,released_year from books where author_lname="Eggers";

select title,author_lname,released_year from books where released_year>2010;

#both query combine with and operator

select title,author_lname,released_year from books where author_lname="Eggers" AND released_year>2010; 

select title,author_lname,released_year from books where author_lname="Eggers" && released_year>2010; 

select 7>3 and 7<3;

select 7>3 and 1<3;

select title,author_lname,released_year from books
where author_lname="Eggers" &&
released_year > 2010 AND
title LIKE "%Novel%"
;														#use the multiple end condition




#logical or operator

select title,author_lname,released_year from books where author_lname='Eggers' || released_year>2010;

select title,author_lname,released_year from books where author_lname='Eggers' OR released_year>2010;

select title,author_lname,released_year,stock_quantity from books 
where author_lname='Eggers' 
OR released_year>2010
|| stock_quantity>100 order by released_year;





#between operator

select title,released_year from books  where released_year >= 2004 AND released_year <= 2015 order by released_year;

select title,released_year from books  where released_year between 2004 and 2015 order by released_year;#use the between keyword

select title,released_year from books  where released_year not between 2004 and 2015 order by released_year;#NOT BETWEEN KEYWORD



#cast method

select cast('2018-10-19' AS datetime); #covert string into the datetime

select cast('2018-10-19 08:45:27' AS datetime);

show databases;

use datatypes;

show tables;

select * from people;

select * from people where birthdt between '1980-01-01' and '2000-01-01';#it understand the string formate date and time

select * from people where birthdt 
between cast('1980-01-01' AS datetime)
AND cast('2000-01-01' AS datetime);#cast string into date time using csting operator

#in and NOT IN method

use books;
show tables;

select * from books;

select * from books where author_lname='Lahiri' OR
author_lname='Neil' ||
author_lname='Eggers';


select * from books where author_lname in('Lahiri','Neil','Eggers');#both query result are same


select * from books where released_year in(2003,2017,2001,2010,2004);


#NOT IN

select title,released_year from books 
where released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
      
	
select title,released_year from books
where released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);#both query are same

select title,released_year from books
where released_year>=2000 AND released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016) order by released_year;

select title,released_year from books
where released_year NOT IN(released_year % 2) order by released_year;#odd number year print

select title,released_year from books
where released_year NOT IN(!(released_year % 2)) order by released_year;#even number year print

select title,released_year from books where released_year>=200 AND released_year % 2 !=0 order by released_year; #odd number year print

select title,released_year from books where released_year>=200 AND released_year !=2013 order by released_year;#2013 number remove







#case statments => LOGIC APPLY

select * from books;

select title,released_year,
CASE 
	when released_year>=2000 then 'MORDEN BOOK'
    ELSE '20th CENTURY BOOK'
END AS 'GENRAL'
from books;

select title,stock_quantity, 
CASE
	WHEN stock_quantity between 0 and 50 then '*'
    WHEN stock_quantity between 51 and 99 then '**'
	WHEN stock_quantity between 101 and 999 then '***'
    ELSE '****'
END AS 'stock'
from books;

select * from books;





#practice

select 10 != 10;

select 15>14 AND 99-5 <=94;

select 1 IN(5,3) || 9 between 8 and 10;

select title,released_year from books where released_year<=1980;

select title,author_lname from books where author_lname='Eggers' OR author_lname='Chabon';

select title,author_lname from books where author_lname IN('Eggers','Chabon');

select title,author_lname,released_year from books where author_lname='Lahiri' AND released_year>=2000;

select * from books where pages between 100 AND 200;

select * from books where pages >= 100 AND pages <=200;

select * from books where author_lname LIKE "C%" || author_lname LIKE "S%";

select title,author_lname,
CASE
	when title LIKE '%Stories' then 'short stories'
    when title='A Heartbreaking Work of Staggering Genius' || title='Just Kids' then 'memoir'
    ELSE 'Novel'
END AS 'TYPE'
 from books;
 
 select title,author_lname,
 CASE
  WHEN count(author_lname) =1 then '1 book'
  WHEN count(author_lname) = 2 then '2 books'
  else '3 books'
 END AS 'COUNT BOOK'
 from books group by author_lname,author_fname;
 
 SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;#second logic
 
 
 select *,count(*) from books group by author_lname,author_fname;