create table student(
    regno varchar(20),
    name varchar(20),
    major varchar(20),
    bdate date,
    primary key(regno));



 create table course(
    courseNo int,
    cname varchar(20),
    dept varchar(20),
    primary key(courseNo));



 create table enroll(
    regno varchar(20),
   courseNo int,
   primary key(regno,courseNo),
    foreign key (regno) references student(regno) on delete cascade,
    foreign key (courseNo) references course(courseNo) on delete cascade);

 create table text(
    book_isbn int,
    booktitle varchar(30),
    publisher varchar(30),
    author varchar(20),
    primary key(book_isbn));

 create table book_adoption(
    courseNo int,
    sem int,
    book_isbn int,
    primary key(courseNo,book_isbn),
    foreign key (courseNo) references course(courseNo) on delete cascade,
    foreign key (book_isbn) references text(book_isbn) on delete cascade);

insert into student values ('3318','Vishrut','BTech','14-MAR-2000');
insert into student values ('3320','Abhinav','BTech','04-NOV-2000');
insert into student values ('3328','Dhruv','BTech','24-MAY-2000');
insert into student values ('3310','Shamanth','BArch','23-OCT-1999');
insert into student values ('3340','Devang','BTech','12-APR-2000');

insert into course values (1,'DBS','ICT');
insert into course values (2,'OS','ICT');
insert into course values (6,'CNP','ICT');
insert into course values (3,'Algo','CSE');
insert into course values (4,'Drawing','FOA');
insert into course values (5,'Finance','DOC');

insert into enroll values ('3318',1);
insert into enroll values ('3318',6);
insert into enroll values ('3320',1);
insert into enroll values ('3320',2);
insert into enroll values ('3318',2);
insert into enroll values ('3328',1);
insert into enroll values ('3328',2);
insert into enroll values ('3328',3);
insert into enroll values ('3318',3);
insert into enroll values ('3310',4);
insert into enroll values ('3340',5);


insert into text values(1892,'DBMS System','Collins','Rowling');
insert into text values(1890,'DBMS','Collins','Rowling');
insert into text values(1204,'DB Manage','Collins','King');
insert into text values(1441,'Algo Intro','Penguin','Newton');
insert into text values(1703,'OS Guide','Penguin','Silberschatz');
insert into text values(2000,'How to Draw','Penguin','Artist');
insert into text values(2456,'Make Money','Penguin','Bill Gates');

insert into book_adoption values(1, 3, 1892);
insert into book_adoption values(2, 4, 1204);
insert into book_adoption values(3, 5, 1441);
insert into book_adoption values(4, 5, 1703);
insert into book_adoption values(5, 4, 2000);
insert into book_adoption values(2, 4, 1890);
insert into book_adoption values(3, 4, 1890);











  

--  select cname
--  from course
--   3  where courseNo in (select courseNo from book_adoption group by courseNo having count(*)>1);

-- CNAME
-- --------------------
-- DBS

-- select regno from student where regno not in (select regno from enroll);

-- REGNO
-- --------------------
-- 3322


-- select distinct dept
--  from course c,book_adoption b,text t
--   3  where b.book_isbn=t.book_isbn and c.courseNo=b.courseNo and t.book_isbn in
--   4  (select book_isbn from text where publisher='Collins');

-- DEPT
-- --------------------
-- ICT


--  select regno,name,count(distinct dept)
--  from (student natural join course) natural join enroll
--   3  where regno in
--   4  (select regno from enroll group by regno having count(*)>=2)
--   5  group by regno,name
--   6  having count(distinct dept)>=2;

-- REGNO                NAME                 COUNT(DISTINCTDEPT)
-- -------------------- -------------------- -------------------
-- 3328                 Dhruv                                  2
-- 3318                 Vishrut                                2

