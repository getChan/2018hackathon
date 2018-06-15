create table selling(
  id varchar2(20),
  number NUMBER,
  title VARCHAR2(20),
  price number,
  indate date default sysdate,
  primary key(number)
  );