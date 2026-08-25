-- DDL 
-- create(data bnane me)
-- drop(data ko remove krta hai)
-- alter(data ko change krta hai)
-- truncate(fist it drop the table then recreate the table again)
create database testdb6;

use testdb6;

-- table structure
create table testdb6.employee1(id int);
select * from testdb6.employee1;
drop table testdb6.employee1; -- remove 

select * from testdb6.employee1;

-- secoend time
create table testdb6.employee1(id int);



select * from testdb6.employee1;

-- DDL (alter)
alter table testdb6.employee1 add column name varchar(20);
alter table testdb6.employee1 drop column id;

select * from  testdb6.employee1;

desc  testdb6.employee1;

alter table  testdb6.employee1 modify column name int ;

alter table  testdb6.employee1 add column empid int ; -- add a column

desc  testdb6.employee1;

alter table  testdb6.employee1 add constraint unique(name); -- unique constraini

alter table  testdb6.employee1 modify column empid int NOT NULL ; -- not null on a table column 
desc  testdb6.employee1;

alter table  testdb6.employee1 modify column empid int  primary key; -- primary key on a table column 
desc  testdb6.employee1;

alter table  testdb6.employee1 rename column empid to id; -- column rename

alter table  testdb6.employee1 rename to employee2; -- table rename 

desc  testdb6.employee2;

-- truncate

select * from  testdb6.employee2;
insert into  testdb6.employee2 values(100,30);

truncate  testdb6.employee2; -- fist it drop the table then recreate the table again

select * from testdb6.employee2;

desc testdb6.employee2;

set SQL_SAFE_UPDATE = 0;

insert into testdb6.employee2 values(10,199),(14,299), (15,890),(18,5708) ,(17,90910);

update testdb6.employee2 set name='890' where id = 299; --  will make the every row
select * from testdb6.employee2;

delete from testdb6.employee2 where name = 10; -- delete DML HAI   / donot create the structure
select * from testdb6.employee2;

-- create a csa file 20 to 25 recode an try to inport my sql databade
-- tcl , acid propart kya hote hai ,in use



