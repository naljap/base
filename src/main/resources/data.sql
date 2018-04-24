###################################################
#  Initialize a database using Spring JDBC
###################################################
;

insert into user(id, userid, name, displayname, role) values (1, 'root', 'root', 'root','ROLE_ROOT');
insert into user(id, userid, name, displayname, role) values (2, 'admin', 'admin', 'admin', 'ROLE_ADMIN');
insert into user(id, userid, name, displayname, role) values (3, 'user', 'user', 'user', 'ROLE_USER');

insert into sample(id, strcol1, strcol2, intcol1) values (1, 'strcol1', 'strcol2', 1);
insert into sample(id, strcol1, strcol2, intcol1) values (2, 'strcol1', 'strcol2', 2);
insert into sample(id, strcol1, strcol2, intcol1) values (3, 'strcol1', 'strcol2', 3);

insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180101', 10, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180102', 20, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180103', 30, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180104', 40, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180105', 30, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180106', 20, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180107', 60, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180108', 70, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180109', 80, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
insert into data_day(statistic_date, statistic1, statistic2, statistic3, statistic4, statistic5, created_id, created, updated_id, updated) values ( '20180110', 50, round(rand()*100), round(rand()*100), round(rand()*100), round(rand()*100), 'naljap', now(), 'naljap', now() );
