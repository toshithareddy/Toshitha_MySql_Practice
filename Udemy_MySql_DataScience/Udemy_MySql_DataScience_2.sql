create database university;
use university;
create table students
(
	student_no integer,
	student_name varchar(20),
	age integer
);

insert into students values (1, 'Michael', 19);
insert into students values (2, 'Doug', 18);
insert into students values (3, 'Samantha', 21);
insert into students values (4, 'Pete', 20);
insert into students values (5, 'Ralph', 19);
insert into students values (6, 'Arnold', 22);
insert into students values (7, 'Michael', 19);
insert into students values (8, 'Jack', 19);
insert into students values (9, 'Rand', 17);
insert into students values (10, 'Sylvia', 20);

create table courses
(
	course_no varchar(5),
	course_title varchar(20),
	credits integer
);

insert into courses values ('CS110', 'Pre Calculus', 4);
insert into courses values ('CS180', 'Physics', 4);
insert into courses values ('CS107', 'Intro to Psychology', 3);
insert into courses values ('CS210', 'Art History', 3);
insert into courses values ('CS220', 'US History', 3);

create table student_enrollment
(
	student_no integer,
	course_no varchar(5)
);

insert into student_enrollment values (1, 'CS110');
insert into student_enrollment values (1, 'CS180');
insert into student_enrollment values (1, 'CS210');
insert into student_enrollment values (2, 'CS107');
insert into student_enrollment values (2, 'CS220');
insert into student_enrollment values (3, 'CS110');
insert into student_enrollment values (3, 'CS180');
insert into student_enrollment values (4, 'CS220');
insert into student_enrollment values (5, 'CS110');
insert into student_enrollment values (5, 'CS180');
insert into student_enrollment values (5, 'CS210');
insert into student_enrollment values (5, 'CS220');
insert into student_enrollment values (6, 'CS110');
insert into student_enrollment values (7, 'CS110');
insert into student_enrollment values (7, 'CS210');


create table professors
(
	last_name varchar(20),
	department varchar(12),
	salary integer,
	hire_date date
);

insert into professors values ('Chong', 'Science', 88000, '2006-04-18');
insert into professors values ('Brown', 'Math', 97000, '2002-08-22');
insert into professors values ('Jones', 'History', 67000, '2009-11-17');
insert into professors values ('Wilson', 'Astronomy', 110000, '2005-01-15');
insert into professors values ('Miller', 'Agriculture', 82000, '2008-05-08');
insert into professors values ('Williams', 'Law', 105000, '2001-06-05');

create table teach
(
	last_name varchar(20),
	course_no varchar(5)
);

insert into teach values ('Chong', 'CS180');
insert into teach values ('Brown', 'CS110');
insert into teach values ('Brown', 'CS180');
insert into teach values ('Jones', 'CS210');
insert into teach values ('Jones', 'CS220');
insert into teach values ('Wilson', 'CS110');
insert into teach values ('Wilson', 'CS180');
insert into teach values ('Williams', 'CS107');

select * from students;
select student_name from students
where age between '18' and '20';

select * from students
where student_name like '%ch%' or  student_name like'%nd';

select * from students
where (student_name like '%ae%' or  student_name like'%ph%')
and not age = '19';

select student_name from students 
order by age desc;

select student_name,age from students
order by age desc
limit 4;
select * from professors;
select concat(last_name,' works in the ',department,' department') from professors;

select concat('it is ',(salary > 95000),' that professor ', last_name,' is highly paid') from professors;

select last_name,upper(substring(department,1,3)),salary,hire_date from professors;

select max(salary),min(salary)from professors
where last_name != 'wilson';

select hire_date from professors
order by hire_date
limit 1;

select min(hire_date) from professors;

select student_name from students
where student_no in
( select student_no from student_enrollment where course_no in(select course_no from courses where course_title in ('physics','us history')));

select student_name from students where student_no in(
select * from (select student_no from student_enrollment
group by student_no
order by count(*) desc limit 1 ) as sq );
 
 select * from student_enrollment;
 
select student_name,max(age) from students;

select * from student_enrollment se
inner join students s on s.student_no = se.student_no
inner join teach t on t.course_no = se.course_no 
INNER JOIN professors p
    ON t.last_name = p.last_name
    order by s.student_name;
/*  ---- OR ---- */

SELECT student_name, se.course_no, p.last_name
FROM students s
INNER JOIN student_enrollment se
    ON s.student_no = se.student_no
INNER JOIN teach t
    ON se.course_no = t.course_no
INNER JOIN professors p
    ON t.last_name = p.last_name
    group by student_name,course_no
ORDER BY student_name;

SELECT s.student_no, student_name, course_no
FROM students s LEFT JOIN student_enrollment se
ON s.student_no = se.student_no;

select * from students 
where student_no not in(select student_no from student_enrollment
where course_no = 'cs180');
    /* OR */
SELECT s.student_no, s.student_name, s.age
FROM students s LEFT JOIN student_enrollment se
    ON s.student_no = se.student_no
GROUP BY s.student_no, s.student_name, s.age
HAVING MAX(CASE WHEN se.course_no = 'CS180'
           THEN 1 ELSE 0 END) = 0
           
SELECT s.*
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
AND se.course_no IN ('CS110', 'CS107')
AND s.student_no NOT IN ( SELECT a.student_no
                          FROM student_enrollment a, student_enrollment b
                          WHERE a.student_no = b.student_no
                          AND a.course_no = 'CS110'
                          AND b.course_no = 'CS107')
                          
SELECT s.*
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
AND s.student_no not in(select student_no from student_enrollment
where course_no != 'cs220')

 select *,count(*) from students s,student_enrollment se
where  s.student_no = se.student_no
group by s.student_no 
having count(*)<= 2
									
select *,count(*) from students
group by age
order by age desc

SELECT s1.*

FROM students s1

WHERE 2 >= (SELECT count(*)

                FROM students s2

                WHERE s2.age < s1.age)