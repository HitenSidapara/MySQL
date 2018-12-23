#use the database books


show databases;
use books;
select database();




#COUNT FUNCTION

select * from books;

select count(*) AS 'COUNT' from books;  #count the number of the row

select author_fname from books;

select count(author_fname) AS 'COUNT' from books;#author_fname count and accept the duplicate value

select count(distinct author_fname) AS 'COUNT' from books;#remove the duplicate value from the count

select count(distinct author_lname,author_fname) AS 'FULLNAME' from books;#12 author has unique name

select count(title) from books where title LIKE '%The%';





#group by function=>grouping of the data

select title,author_lname  from books group by author_lname; #group by author_lname

select title,author_fname,author_lname,count(*) from books group by author_lname;#how many book write by the author show in the count 

select title,author_fname,author_lname,count(*) from books group by author_fname,author_lname;

select released_year,count(*) from books group by released_year;

select concat('IN ',released_year,' ',count(*),' books released') AS 'year' from books GROUP BY released_year;








#MIN AND MAX FUNCTION

select min(released_year) from books;#min released year print

select min(pages) from books;#min pages from books

select max(released_year) from books;#max released year

select max(pages) from books;#max number of the pages

select max(pages),title from books;#not get the exactly info. becauze the THE NAMESACK book not have 634 pages

#find max pages with title solution(SUBQUERIES)

select * from books where pages=(select max(pages) from books); #GIVE THE EXACT INFORMATION

select title,pages from books where pages=(select max(pages) from books);#max pages book find

select title,pages from books order by pages DESC LIMIT 1;

select * from books where pages=(select min(pages) from books);

select * from books order by pages ASC limit 1;#another way olution this is faster then above solution

select * from books where released_year=(select min(released_year) from books);

select * from books where released_year=(select max(released_year) from books);


#min & max using group by function

select author_fname,author_lname,released_year,min(released_year) from books group by author_lname,author_fname; 

select author_fname,author_lname,released_year,min(released_year) from books group by author_lname;

select author_fname,author_lname,count(*) from books group by author_lname,author_fname;

select author_fname,author_lname,max(pages) from books group by author_lname,author_fname;

select concat(author_fname,' ',author_lname) AS author , max(pages) AS pages from books group by author_lname,author_fname;





#SUM FUNCTION

select sum(pages) from books;

select sum(released_year) from books;

#sum+group by

select author_fname,author_lname,sum(pages) from books group by author_lname,author_fname;

select author_fname,author_lname,sum(released_year) from books group by author_lname,author_fname;









#AVG=> average function

select avg(released_year) from books;

select avg(pages) from books;

#avg+group by

select released_year,avg(stock_quantity) from books group by released_year;

select author_fname,author_lname,avg(pages) from books group by author_lname,author_fname;





#practice

select count(*) from books;

select released_year,count(released_year) from books group by released_year;

select sum(stock_quantity) from books;

select author_fname,author_lname,avg(released_year) from books group by author_lname,author_fname;

select concat(author_fname,'',author_lname) as 'fullname', max(pages) as 'longest book' from books
group by author_lname,author_fname ;#false

SELECT CONCAT(author_fname, ' ', author_lname) FROM books
WHERE pages = (SELECT Max(pages) FROM books);#true

select released_year AS 'year',count(released_year) as "# books",avg(pages) as 'avg pages' from books
group by released_year order by released_year; 