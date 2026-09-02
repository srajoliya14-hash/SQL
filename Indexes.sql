use newdb2;

 
create table test17(id int, name varchar(20));

insert into test17 values(1,'a'),(3,'b'), (2,'c'),(5,'d') ,(4,'e');

explain select * from test17 where id = 3;

-- BTree data structure 
-- primary key 

select * from test17;

alter table test17 add primary key (id);

desc test17;

select * from test17;


explain select * from test17 where id = 3;

select * from test17;


create index name_index on test17(name);

show indexes from test17  ;

select * from test17 where name = 'a';

explain select * from test17 where name = 'a';





create table test16(id int, name  varchar(20));

 insert into test16 values(11,'aman'),(13,'bhanu'), (12,'charu'),(15,'danu') ,(14,'eshu');

explain select * from test16 where id = 13;


alter table test16 add primary key (id);

desc test16;

select * from test16;

create index name_index on test16(name);

show indexes from test16  ;

select * from test15 where name = 'aman';