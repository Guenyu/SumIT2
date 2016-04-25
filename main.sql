create table UserInFo(
	email varchar2(30) primary key,
	ID varchar2(30) not null,
	name varchar2(15) not null,
	password varchar2(30) not null,
	phone varchar2(20) not null
--	age varchar2(30) not null,
--	addr varchar2(50) not null,
--	gender char(1) not null
);
select * from UserInFo;
drop table UserInFo;

-----------------------------------------------

create table schedule2(
	seq number(10) primary key,
	title varchar2(30) not null,
	content varchar2(100) not null,
	writer varchar2(30) not null,
	reg_date1 varchar2(30),
	reg_date2 varchar2(30)
);
select * from schedule2;
drop table schedule2;


------------------------------------------------

create table schedule(
	seq number(10) primary key,
	title varchar2(100) not null,
	writer varchar2(100) not null,
	content varchar2(200) not null,
	reg_date date
);
select * from schedule;
drop table schedule;
	
--calendar 날짜 불러오기 쿼리
select
  SEQ 
  ,WRITER 
  ,REG_DATE
  ,to_char(REG_DATE, 'dd') as REG_DAY
from SCHEDULE
where 
  WRITER = 'test' 
  and REG_DATE BETWEEN '20160401' and '20160430';

