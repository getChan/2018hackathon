create table selling(
id varchar2(20),
num NUMBER,
title VARCHAR2(20),
sellprice number,
price number,
status varchar2(20),
indate date default sysdate,
primary key(num)
);

CREATE SEQUENCE SEQ_NUMBER
         INCREMENT BY 1
         START WITH 1
         MAXVALUE  1000
         NOCACHE
         NOCYCLE;

INSERT INTO selling(id, NUM, title, sellprice, price, status, type) VALUES('id123', SEQ_NUMBER.NEXTVAL,'컴퓨터공학개론', 20000, 30000, '상');

select * from selling

alter table selling add type varchar(10);

create table book(
num NUMBER,
title VARCHAR2(20),
subtitle varchar2(20),
author varchar2(20),
publisher varchar2(10),
moreinfo varchar2(200),
image varchar2(10),
primary key(num),
foreign key(num) REFERENCES selling(num) ON DELETE CASCADE);

create table bookmember(
	id varchar2(20),
	password varchar2(20),
	primary key(id)
	);
	
select * from selling;

drop table selling;

delete from bookorder

create table selling(
  id varchar2(20),
  num NUMBER,
  title VARCHAR2(50),
  subtitle varchar2(50),
  author varchar2(50),
  publisher varchar2(50),
  moreinfo varchar2(100),
  image varchar2(50),
  price varchar2(50),
  sellprice varchar2(50),
  status varchar2(10),
  type varchar2(10),
  indate date default sysdate,
  primary key(num)
  );
  
  create table bookorder(
   num number primary key,
   id varchar2(20),
   content varchar2(100),
   type varchar2(20),
   indate date default sysdate
);

CREATE SEQUENCE SEQ_NUMBER2
         INCREMENT BY 1
         START WITH 1
         MAXVALUE  1000
         NOCACHE
         NOCYCLE;
         
drop table selling;

select * from selling;

delete from selling;