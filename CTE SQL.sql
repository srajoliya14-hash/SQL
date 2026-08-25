-- CTE 
use viewdb2;

-- CTAS -- create table as select statement

create table city_t2 as select * from world.city;

select * from city_t2;

with district_max as (
select district ,  max(c.population) as d_population from city_t2 c 
group by  district )

select * from district_max as dm join city_t2 as c 
on c.district = dm.district and c.population = dm.d_population;

with cte as (
select max(population)  as maxpopulation from city_t2 where population <(
select max(population)  as maxpopulation from city_t2 ) )

,cte2 as(
select max(population) from city_t2 where population <(select * from cte))

select * from city_t2 where population = (select * from cte2);