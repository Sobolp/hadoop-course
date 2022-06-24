DROP TABLE orc_test;

create table orc_test
(col1 int,
 col2 int,
 col3 int,
 col4 int)
 partitioned by (col5 string)
stored as orc;


insert into orc_test partition(col5='2020-01-01') values(1,2,3,4);
insert into orc_test partition(col5='2021-01-01') values(5,6,7,8);


ALTER TABLE orc_test SET TBLPROPERTIES('EXTERNAL'='TRUE');
DROP TABLE orc_test;

create table orc_test
(col1 int,
 col2 int,
 col6 string,
 col3 string,
 col4 int) partitioned by (col5 string) stored as orc;

msck repair table orc_test;

select * from orc_test;


insert into orc_test partition(col5='2021-01-01')
values(9,10,777,11, 12);
