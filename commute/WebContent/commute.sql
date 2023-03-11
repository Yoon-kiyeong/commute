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
	commute timeStamp,
	leave timeStamp,
	User_Id integer REFERENCES Member (User_Id) NOT NULL
);

insert into Member values('Yoon', 'yoon1234');
insert into Member values('admin','admin1234');

drop table commute

select *
From Member

insert into commute values(now(),'08:50:39','18:00:00'); 

select *
from commute

select User_Id, password
from Member where ID = 'admin' and Password='admin1234'

insert into commute values(now(),current_time,null,2);

insert into commute values (now(),null,2);
insert into commute values ('2023-03-12 03:00:00', '2023-03-12:03:23:30',2);

select to_char(commute, 'YYYY-MM-DD')as commute_date, to_char(commute, 'HH24:MI:SS') as commute_time, to_char(leave,'YYYY-MM-DD HH24:MI:SS') as leave ,User_Id
from commute 

delete from commute where user_id = '2';