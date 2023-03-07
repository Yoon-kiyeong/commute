CREATE TABLE Member (
	ID Varchar(30) Not Null,
	Password varchar(250) Not Null
);

insert into Member values('Yoon', 'yoon1234');

select *
from member;

insert into Member values('admin','admin1234');