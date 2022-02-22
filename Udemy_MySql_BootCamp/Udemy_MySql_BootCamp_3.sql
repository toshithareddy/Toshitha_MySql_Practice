create database dog_walking_app;
show databases;
use dog_walking_app;
select database();

create table cats
(name varchar(100),
age int);
describe cats;

insert into cats (name,age)
values ('blue',1),('draco',11);
select * from cats;

select name,age,count(*) as cnt from cats
group by name,age
having count(*)>1;

with cte (name,age,duplicatecount)
as (select name,age,row_number() over(partition by name,age
order by name) as duplicatecount
from cats);

create table people
(id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
age int);

insert into people(first_name,last_name,age)
values('tina','belcher',13),('bob','belcher',14),('philip','frond',38),('calvin','fischoeder',70);
select * from people

create table emplyoees
(id int not null auto_increment, 
first_name varchar(225) not null,
last_name varchar(225) not null,
middle_name varchar(225),
age int not null,
current_status varchar(225)not null default 'employed',
primary key(id));

select * from emplyoees;
insert into emplyoees(first_name,last_name,age)
values ('dora','smith',58);

drop table cats;

create table cats
(cat_id int not null auto_increment,
name varchar(100),
breed varchar(100),
age int,
primary key (cat_id));

describe cats;
insert into cats(name,breed,age)
values('ringo','tabby',4),
       ('cindy','maine coon',10),
       ('dunmbledore','maine coon',11),
       ('egg','persian',4),
       ('misty','tabby',13),
       ('george michael','ragdoll',9),
       ('jackson','sphynx',7);
       
     select cat_id from cats;
     select name,breed from cats;
     select name,age from cats
     where breed = 'tabby';
     select cat_id,age from cats
     where cat_id = age;
     select * from cats
     where name = 'jackson';
	update cats set name = 'jack'
    where name = 'jackson';
    update cats set breed = 'british shorthair'
    where name = 'ringo';
    update cats set age = 12
    where breed = 'maine coon';
    
    create database shirts_db;
    create table shirts
    (shirt_id int not null auto_increment,
article varchar(100),
color varchar(100),
shirt_size varchar(100),
last_worn int,
primary key (shirt_id));

insert into shirts(article,color,shirt_size,last_worn)
values('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

insert into shirts(article,color,shirt_size,last_worn)
values('polo shirt','purple','M',50);

select * from shirts;
select article,color from shirts;

select article,color,shirt_size,last_worn from shirts
where shirt_size = 'M';
update shirts set shirt_size = 'L'
where article = 'polo shirt';
update shirts set last_worn = 0
where last_worn = 15;
update shirts set shirt_size = 'XS' , color ='off white'
where color = 'white';
delete from shirts 
where last_worn = 200;
delete from shirts
where article = 'tank top';
delete from shirts;
drop table shirts;

REPLACE(REPLACE(REPLACE(REPLACE(ta.phone_number, '-', ''), ' ', ''), ')', ''),'(','')
create database book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

DESC books;
SELECT * FROM books; 

select concat('hello','world');
SELECT
  CONCAT(author_fname, ' ', author_lname)
FROM books;
SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ' ', author_lname) AS full
FROM books;
SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;
                                                        these both are similar
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;

SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0'); - replace is case sensitive

 
SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
  
 SELECT REPLACE(title, 'e ', '3') FROM books; 
 SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
FROM books;
SELECT REVERSE('Hello World'); 
SELECT REVERSE('meow meow');
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
 
SELECT CHAR_LENGTH('Hello World'); 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');

 SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
  
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) as 'favorite' FROM books;
/*This works:

--SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
--FROM books;
--While this does not:

--SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps" 
--FROM books;
--UPPER only takes one argument and CONCAT takes two or more arguments, so they cant be switched in that way.

--You could do it this way, however:

--SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps" 
FROM books;*/

select upper(reverse("Why does my cat look at me with such hatred?"));
SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );

select replace(title,' ','->') as title from books;
select * from books;
select author_lname as forwards,reverse(author_lname) as backwards from books;
select upper(concat(author_fname,' ',author_lname)) as 'full name in caps' from books


select concat(title,' ',"was released in",' ',released_year) as blurb from books;
select title,char_length(title)as 'character count' from books;

select concat(substr(title,1,10),'...') as 'short title',
       concat(author_lname,',',author_fname) as 'author',
       concat(stock_quantity, ' in stock') as 'quantity' from books
where book_id in (3,9);

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT DISTINCT author_lname FROM books;
select distinct concat(author_fname,' ',author_lname) as 'full names' from books;

use book_shop;
SELECT author_lname FROM books ORDER BY author_lname;
SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC;
show databases;
SELECT title, released_year, pages FROM books ORDER BY released_year;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 2;
SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

SELECT title FROM books LIMIT 3;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;
SELECT title FROM books LIMIT 5, 123219476457;

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title FROM books WHERE  title LIKE 'the';
SELECT title FROM books WHERE  title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
SELECT title FROM books WHERE title LIKE '%\%%';
 
SELECT title FROM books WHERE title LIKE '%\_%';

select * from books;
select title from books where title like'%stories%';
select title,pages from books where title like '%&%';
select concat(title,' - ',released_year) as 'summary' from books
order by  released_year desc limit 3;

select title,author_lname from books
where author_lname like'%\ %';

select title,released_year,stock_quantity from books
order by stock_quantity asc limit 3;

select title,author_lname from books
order by author_lname,title;

select concat('MY FAVORITE AUTHOR IS',' ',author_fname,' ',author_lname,' ','!') as yell from books
order by author_lname asc;

SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
 
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
SELECT title FROM books WHERE title LIKE '%the%';
 SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT title, author_lname FROM books
GROUP BY author_lname;
SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

SELECT MIN(released_year) FROM books;
SELECT MAX(pages) 
FROM books;

SELECT * FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books);              these both return same output
SELECT * FROM books 
ORDER BY pages ASC LIMIT 1;   

SELECT author_fname, 
       author_lname, 
       Min(released_year) 
FROM   books 
GROUP  BY author_lname, 
          author_fname;
          
  SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;   
  
  SELECT SUM(pages)
FROM books;
 SELECT author_fname,
       author_lname,
       Sum(pages)
FROM books
GROUP BY
    author_lname,
    author_fname;        
select * from books;
SELECT AVG(released_year) 
FROM books;
SELECT AVG(stock_quantity) 
FROM books 
GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;

select count(title) from books;
select released_year,count(*) from books group by released_year;
select sum(stock_quantity) from books;
select author_fname, author_lname, avg(released_year) from books group by author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) FROM books
WHERE pages = (SELECT Max(pages) FROM books);
select released_year as 'year',count(*) as'# books',avg(pages) as 'avg pages' from books
group by released_year
order by year ;

DECIMAL(5, 2)
5 Digits
999.99
    2 Digits
 CREATE TABLE items(price DECIMAL(5,2));   
INSERT INTO items(price) VALUES(7);    
 INSERT INTO items(price) VALUES(34.88);
  INSERT INTO items(price) VALUES(298.9999);   
SELECT * FROM items;

CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
 
SELECT title FROM books WHERE released_year = 2017;
SELECT title FROM books WHERE released_year != 2017;

 SELECT title FROM books WHERE title LIKE 'W%';
 SELECT title FROM books WHERE title NOT LIKE 'W%';
 
  
SELECT title, released_year FROM books 
WHERE released_year > 2000 ORDER BY released_year;
SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;
SELECT 99 > 1;
SELECT 99 > 567;
100 > 5
-- true
 
-15 > 15
-- false
 
9 > -10
-- true
 
1 > 1
-- false
 
'a' > 'b'
-- false
 
'A' > 'a'
-- false
 
'A' >=  'a'
-- true

SELECT title, released_year FROM books
WHERE released_year <= 2000;

SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;
SELECT -40 <= 0 AND 10 > 40;
--false
 
SELECT 54 <= 54 && 'a' = 'A';
-- true    

SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT CAST('2017-05-02' AS DATETIME);
                               
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
    
 SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);   
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;

SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

select title,released_year from books where released_year < 1980; 
select title from books where author_lname = 'eggers' or 'chabon';
select title,released_year from books where author_lname = 'lahiri' and released_year > 2000;
select title from books where pages between 100 and 200;
select title, author_lname from books where author_lname LIKE 'C%' OR 
    author_lname LIKE 'S%';

SELECT title,author_lname, 
    CASE 
        WHEN  author_lname = 'stories'  THEN 'Short Stories'
        WHEN author_lname =  'Just Kids and A Heartbreaking Work' THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM books; 

select author_fname,author_lname,
CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE concat(count(*),' ','books') 
        end as count from books
        group by author_fname,author_lname;
        
 create database customers_orders;  
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
  
 SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id; 
    
 SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;   

SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

/*--CREATE TABLE orders(
 --   id INT AUTO_INCREMENT PRIMARY KEY,
   -- order_date DATE,
    --amount DECIMAL(8,2),
    --customer_id INT,
    --FOREIGN KEY(customer_id) 
      --  REFERENCES customers(id)
        --ON DELETE CASCADE - deletes respective data in other table
--);*/

 create database school;  
CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
drop table papers;
CREATE TABLE papers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title varchar(45),
    grade varchar(45),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
    on delete cascade);
 INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);  

 select first_name,title,grade from students 
 join papers  on students.id=papers.student_id
 order by grade desc;
 
 
 drop tables students,papers;
 show databases;
 
 select first_name,title,grade from students
 left join papers on students.id=papers.student_id;
 
 select first_name,
   IFNULL(title, 'MISSING') as title,
    IFNULL(grade, 0)as grade
    from students
 left join papers on students.id=papers.student_id;
 
 select first_name,ifnull(avg(grade),0)as average from students
left join papers on students.id=papers.student_id
group by first_name
order by average desc;

select first_name,ifnull(avg(grade),0)as average,
CASE 
        WHEN Avg(grade) IS NULL THEN 'FAILING' 
         WHEN Avg(grade) >= 75 THEN 'PASSING' 
        ELSE 'FAILING'
    END AS  passing_status from students
left join papers on students.id=papers.student_id
group by first_name
order by average desc;

create database tv_review_app;
use tv_review_app;
CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

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
     
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
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
    
 SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;   
select title, avg(rating) as avg_rating from series
join  reviews ON series.id = reviews.series_id
group by title
order by avg_rating;
select first_name,last_name,rating from reviewers
 JOIN reviews ON reviewers.id = reviews.reviewer_id; 

  SELECT title as unreviwed_series FROM series
left JOIN reviews ON series.id = reviews.series_id
where rating is null; 

 SELECT genre,round(avg(rating),2) as avg_rating FROM series
 join  reviews ON series.id = reviews.series_id
group by genre;

select first_name,last_name,count(reviews.id) as COUNT,ifnull(min(rating),0) as MIN,ifnull(max(rating),0) as MAX,
Round(Ifnull(Avg(rating), 0), 2)            AS AVG,
CASE 
        WHEN min(rating) IS null THEN 'INACTIVE'
        ELSE 'ACTIVE'
        END AS 'STATUS' FROM reviewers
left JOIN reviews ON reviewers.id = reviews.reviewer_id
group by first_name;

select series.title,reviews.rating,concat(first_name,' ',last_name)as reviewer from series
join  reviews ON series.id = reviews.series_id
join  reviewers on reviewers.id = reviews.reviewer_id
order by title;


