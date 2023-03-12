DROP TABLE commute;
DROP TABLE Member;

CREATE TABLE Member (
	ID Varchar(30) Not Null, 
	Password varchar(250) Not Null,
	role integer,
	User_Id SERIAL Primary Key
);

CREATE TABLE commute (
	commute timeStamp,
	leave timeStamp,
	User_Id integer REFERENCES Member (User_Id) NOT NULL,
	recordid SERIAL Primary Key
);

insert into Member values('guest', 'guest',0);
insert into Member values('yoshida', 'yoshida1234',0);
insert into Member values('Yoon', 'yoon1234', 0);
insert into Member values('admin','admin1234',1);

insert into commute values ('2023-02-07 08:05:45', '2023-02-07 19:12:51', 2);
insert into commute values ('2023-02-08 08:07:25', '2023-02-08 15:44:21', 2);
insert into commute values ('2023-02-09 08:04:55', '2023-02-09 21:12:21', 2);
insert into commute values ('2023-02-10 09:17:44', '2023-02-10 18:05:21', 2);
insert into commute values ('2023-02-11 08:15:21', '2023-02-11 18:12:52', 2);
insert into commute values ('2023-02-12 09:19:41', '2023-02-12 19:46:21', 2);
insert into commute values ('2023-02-13 08:34:54', '2023-02-13 22:32:38', 2);

insert into commute values ('2023-02-10 09:05:45', '2023-02-10 19:12:51', 3);
insert into commute values ('2023-02-11 08:57:25', '2023-02-12 03:44:21', 3);
insert into commute values ('2023-02-13 09:04:55', '2023-02-14 00:12:21', 3);
insert into commute values ('2023-02-16 07:07:44', '2023-02-17 08:05:21', 3);
insert into commute values ('2023-02-21 08:15:21', '2023-02-21 18:12:52', 3);
insert into commute values ('2023-02-22 05:19:41', '2023-02-22 19:46:21', 3);
insert into commute values ('2023-02-23 06:34:54', '2023-02-24 01:32:38', 3);
