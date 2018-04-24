###################################################
#  Initialize a database using Hibernate
###################################################
;

insert into user(id, userid, name, displayname, role) values (1, 'root', 'root', 'root','ROLE_ROOT');
insert into user(id, userid, name, displayname, role) values (2, 'admin', 'admin', 'admin', 'ROLE_ADMIN');
insert into user(id, userid, name, displayname, role) values (3, 'user', 'user', 'user', 'ROLE_USER');