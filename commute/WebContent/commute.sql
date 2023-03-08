CREATE TABLE Member (
	ID Varchar(30) Not Null, 
	Password varchar(250) Not Null,
	User_Id SERIAL Primary Key
);

select *
from Member

drop table Member

drop table commute

CREATE TABLE commute (
	commute_Date date,
	commute_time time,
	leave_time time,
	User_Id integer REFERENCES Member (User_Id)
);

insert into Member values('Yoon', 'yoon1234');
insert into Member values('admin','admin1234');

select *
From Member

insert into commute values(now(),'08:50:39','18:00:00', 1); 

select *
from commute

