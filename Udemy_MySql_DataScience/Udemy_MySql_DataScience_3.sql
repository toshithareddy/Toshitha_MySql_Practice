CREATE TABLE fruit_imports
(
	id integer,
	name varchar(20),
	season varchar(10),
	state varchar(20),
	supply integer,
	cost_per_unit decimal(8,2)
);

insert into fruit_imports values(1, 'Apple', 'All Year', 'Kansas', 32900, 0.22);
insert into fruit_imports values(2, 'Avocado', 'All Year', 'Nebraska', 27000, 0.15);
insert into fruit_imports values(3, 'Coconut', 'All Year', 'California', 15200, 0.75);
insert into fruit_imports values(4, 'Orange', 'Winter', 'California', 17000, 0.22);
insert into fruit_imports values(5, 'Pear', 'Winter', 'Iowa', 37250, 0.17);
insert into fruit_imports values(6, 'Lime', 'Spring', 'Indiana', 40400, 0.15);
insert into fruit_imports values(7, 'Mango', 'Spring', 'Texas', 13650, 0.60);
insert into fruit_imports values(8, 'Orange', 'Spring', 'Iowa', 18000, 0.26);
insert into fruit_imports values(9, 'Apricot', 'Spring', 'Indiana', 55000, 0.20);
insert into fruit_imports values(10, 'Cherry', 'Summer', 'Texas', 62150, 0.02);
insert into fruit_imports values(11, 'Cantaloupe', 'Summer', 'Texas', 8000, 0.49);
insert into fruit_imports values(12, 'Apricot', 'Summer', 'Kansas', 14500, 0.20);
insert into fruit_imports values(13, 'Mango', 'Summer', 'Texas', 17000, 0.68);
insert into fruit_imports values(14, 'Pear', 'Fall', 'Nebraska', 30500, 0.12);
insert into fruit_imports values(15, 'Grape', 'Fall', 'Illinois', 72500, 0.35);

create database fruit_shop;
use fruit_shop;

select * from fruit_imports;
drop table fruit_imports;

select state from fruit_imports
group by state
order by sum(supply) desc
limit 1;

select season,max(cost_per_unit) from fruit_imports
group by season;

select name,state, count(*) from fruit_imports
group by name,state
order by count(*)desc;

select state from fruit_imports
group by name,state
having count(*)> 1;

select season,name from fruit_imports
group by season
having count(name) > 2;

select state,sum(supply * cost_per_unit) from fruit_imports
group by state
order by sum(supply * cost_per_unit) desc
limit 1;

CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

select count(coalesce(fruit_name,'none')) from fruits;

select name,total_supply,
case when total_supply < 20000 then 'low'
when total_supply >= 20000 and supply <= 50000 then 'enough'
when total_supply > 50000 then 'full'
end as 'category' 
from (SELECT name, sum(supply) total_supply
FROM fruit_imports
GROUP BY name) a;

select name,supply,
case when supply < 20000 then 'low'
when supply >= 20000 and supply <= 50000 then 'enough'
when supply > 50000 then 'full'
end as 'category' 
from fruit_imports;


select SUM(CASE WHEN season = 'Winter' THEN total_cost end) as Winter_total,

SUM(CASE WHEN season = 'Summer' THEN total_cost end) as Summer_total,

SUM(CASE WHEN season = 'Spring' THEN total_cost end) as Spring_total,

SUM(CASE WHEN season = 'Fall' THEN total_cost end) as Spring_total,

SUM(CASE WHEN season = 'All Year' THEN total_cost end) as Spring_total
from(select season,(supply) * (cost_per_unit) as total_cost
from fruit_imports
group by season,total_cost) a

