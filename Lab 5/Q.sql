
create table student(
  regno varchar(20) primary key,
  name varchar(50),
  major varchar(20),
  bdate date);

create table course(
  courseNo int primary key,
  cname varchar(20),
  dept varchar(30));
 

create table enroll(
  regno varchar(20),
  courseNo int,
  foreign key (regno) references student(regno),
  foreign key(courseNo) references course(courseNo));

create table text(
  book_isbn int primary key,
  booktitle varchar(50),
  publisher varchar(50),
  author varchar(50));

create table book_adoption(
  courseNo int,
  sem int,
  book_isbn int,
  foreign key(courseNo) references course(courseNo),
  foreign key(book_isbn) references text(book_isbn));


  
   

STUDENT
insert into student values('AA','Abhishek','Computer', '11-JUL-2000');
insert into student values('BB','Ankit','Elect', '16-JUL-2000');
insert into student values('CC','Teheron','Humanity', '23-APR-2000');
insert into student values('DD','Dhruv','Humanity', '05-APR-2000');


COURSE
insert into course values(1111, 'CCE', 'IT');
insert into course values(2222, 'ECE', 'ELEC');
insert into course values(3333, 'EG', 'ARCH');

ENROLL
insert into enroll values('AA', 1111);
insert into enroll values('BB', 2222);
insert into enroll values('CC', 3333);
insert into enroll values('AA',3333);
insert into enroll values('CC', 1111);
insert into enroll values('AA', 2222);


BOOK_ADOPTION
insert into book_adoption values(1111, 1, 10);
insert into book_adoption values(2222, 2, 20);
insert into book_adoption values(3333, 3, 30);
insert into book_adoption values(3333, 4, 40);
insert into book_adoption values(3333, 5, 50);
insert into book_adoption values(1111,3,60);
insert into book_adoption values(2222,4,70);
insert into book_adoption values(2222,4,80);
insert into book_adoption values(2222,4,90);


TEXT
insert into text values(10,'c++','Newline','Robert W');
insert into text values(20,'Electronics','Winter','Hashville');
insert into text values(30,'Design','Shanton','Gracy L');
insert into text values(40,'pattern','Notting hill','Cheryl M');
insert into text values(50,'designing','Clinton','Clive C');
insert into text values(60,'Data', 'Newline','Lindsay M');
insert into text values(80,'Internet','Newline','Christ');
insert into text values(90,'Knowledge ','Newline','Joe G');
insert into text values(70,'Data struc','Shanton','Bob M');

a)

select cname
    from course
    where courseNo in (select courseNo from book_adoption group by courseNo having count(*)>1);


b)
select distinct dept
    from course c,book_adoption b,text t
    where b.book_isbn=t.book_isbn and c.courseNo=b.courseNo and t.book_isbn in
    (select book_isbn from text where publisher='Newline');


c)
select regno,name,count(distinct dept)
	from (student natural join course) natural join enroll
  	where regno in
  	(select regno from enroll group by regno having count(*)>=2)
  	group by regno,name;


d)
select regno 
	from student 
	where regno not in (select regno from enroll);


e)
select book_isbn
	from book_adoption natural join course
	where courseNo in
	(select courseNo from enroll);

f)
select distinct c.courseNo, t.publisher
	from book_adoption c , text t
	where c.book_isbn=t.book_isbn
	and t.publisher in
	( select t1.publisher
 	from text t1
  	group by t1.publisher
  	having count(*)>=2);



g)
select regno, name, count(*)
	from student natural join enroll natural join book_adoption
	group by regno,name 
	having count(*)>=all(
  	select count(book_isbn)
  	from book_adoption
  	group by courseNo);


h)
select publisher, count(distinct book_isbn) 
	from text
	where book_isbn in (
	select book_isbn
	from text)
	group by publisher;

i)
select distinct regno
	from student natural join enroll e
	where not exists(
	(select courseNo 
	from course natural join enroll 
	group by courseNo) 
	MINUS
	( select courseNo from course natural join book_adoption group by courseNo));




  