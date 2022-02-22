use cinema_booking_system;

select concat(first_name,last_name) as full_name from customers;

select concat(first_name," ",last_name) as full_name from customers;- creating space btwn name
select concat(first_name," ",last_name," ",email) as full_name from customers;
select concat("This is",first_name," ",last_name,"'s email:",email) as customers_email from customers;

SUBSTRING
select substring("Example",3,3) as sub;
                 (string,start,length)
                 
select name from films;
select substring(name,1,3) as short_name from films;
select substring(name,-2,2) as short_name from films;

upper and lower case

select name from rooms;
select upper(name) as name  from rooms;
select lower(name) as name from rooms;

select * from films;
select concat(name,lenght_min) from films;

select * from customers;
select substring(email,5) from customers;

select lower(first_name),upper(last_name) from customers
where last_name = 'smith';

select substring(name,-3) from films;

select concat(substring(first_name,1,3),substring(last_name,1,3)) from customers;

select date('2018-06-05');
select date('2018-06-05 07:45:32');


select start_time from screenings;
select date(start_time) from screenings;
select * from screenings
where date(start_time) = '2017-10-01';

select * from screenings
where date(start_time) between '2017-10-03' and '2017-10-05';

select month('2018-06-05');

select month('2018-06-05 07:45:32');

select start_time from screenings;
select month(start_time) from screenings;

select * from screenings where month(start_time) = '10';

select year('2018-06-05');
select year('2018-06-05 07:42:45');

select start_time from screenings;
select year(start_time) from screenings;
select * from screenings
where year(start_time) = '2017';

select film_id,start_time from screenings
where date(start_time) = '2017-10-20';

select* from screenings 
where date(start_time) between '2017-10-06' and '2017-10-13';

select * from screenings
where month(start_time) = '10'
and year(start_time) = '2017';

excercises

select * from films;
select * from films
where lenght_min > 120;

select * from screenings;
select f.name, max(sid) from films f
where s.film_id in
(select f.name,count(s.film_id) as sid from films f
join screenings s on f.id = s.film_id
where month(start_time) = '10'
and year (start_time) = '2017') as sub
 group by film_id;

 select f.name,count(s.film_id) as sid from films f
join screenings s on f.id = s.film_id
where month(start_time) = '10'
and year (start_time) = '2017'
group by film_id
order by sid desc
limit 1;

select * from screenings;
select * from films;
select * from bookings;
select * from reserved_seat;

select f.name,count(b.id) from films f
join screenings s on f.id = s.film_id
join bookings b on s.id = b.screening_id
where f.name = 'jigsaw'
and month(start_time) = '10'
and year (start_time) = '2017';


select count(*) from bookings
where screening_id in
(select id from screenings
where film_id = 5);


select customer_id,count(b.id) as bookings from bookings b
join screenings s on b.screening_id= s.id
where month(start_time) = '10'
and year (start_time) = '2017'
group by customer_id
order by bookings desc
limit 5;

select* from bookings
order by customer_id;

select * from films;
select * from screenings;
select * from rooms;

select f.name,count(s.id) from films f
join screenings s on f.id = s.film_id
join rooms r on r.id = s.room_id 
where r.name ='chaplin'and
 month(start_time) = '10'
and year (start_time) = '2017'
group by f.name
order by count(s.id) desc
limit 1;


select * from customers
select * from bookings

select count(distinct(c.id)) from customers c
join bookings b on c.id = b.customer_id
join screenings s on s.id = b.screening_id
where month(start_time) = '10'
and year (start_time) = '2017'

