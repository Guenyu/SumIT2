create table UserInFo(
	email varchar2(30) primary key,
	name varchar2(15) not null,
	ID varchar2(30) not null,
	password varchar2(30) not null,
	phone varchar2(20) not null
--	age varchar2(30) not null,
--	addr varchar2(50) not null,
--	gender char(1) not null
);
select * from UserInFo;
drop table UserInFo;

-----------------------------------------------

create table schedule(
	seq number(10) primary key,
	title varchar2(30) not null,
	content varchar2(100) not null,
	writer varchar2(30) not null,
	reg_date1 varchar2(30),
	reg_date2 varchar2(30)
);
select * from schedule;
drop table schedule;

