create table UserInFo(
	email varchar2(30) primary key,
	password varchar2(30) not null,
	name varchar2(15) not null,
	age varchar2(30) not null,
	id varchar2(30) not null,
	addr varchar2(50) not null,
	phone varchar2(20) not null,
	gender char(1) not null
);
select * from UserInFo;
drop table UserInFo;

-----------------------------------------------

create table schedule(
	writer varchar2(30) primary key,
	content varchar2(30) not null,
	title varchar2(15) not null,
	seq number(10) not null,
	reg_date date
);
select * from schedule;
drop table schedule;

