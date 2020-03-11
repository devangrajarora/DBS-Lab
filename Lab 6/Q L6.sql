Q2.
create or replace trigger on_accident
after insert or update on participated
for each row
declare
p_name person.name%type;
p_id person.driver_id%type;
p_addr person.Address%type;
begin
if inserting then
select driver_id, name, address
into p_id, p_name, p_addr
from person  
where driver_id = :new.driver_id;
dbms_output.put_line('name : '||p_name||' driver id : '||p_id||' address : '||p_addr);
end if;
end;
/



Q3.
create or replace function acc2(year1 in varchar) return number as
counter integer;
begin
select count(*) into counter from ACCIDENT a where extract(year from accd_date)=year1;
return counter;
end;
/

set serveroutput on;
declare year integer;
begin
year:=acc2(2018);
dbms_output.put_line(year);
end;
/

declare n number(2);
begin
n:=acc2(2000);
dbms_output.put_line('No of accidents: '||n);
end;
/

Statement processed.
No of accidents: 3


Q4.
create or replace procedure acc3(driv_id in varchar, year1 in varchar) is
total integer;
begin
total:=0;
for item in (select * from ACCIDENT a natural join PARTICIPATED p where driver_id=driv_id and year1=extract(year from acc_date)) loop
total:=total+item.damage_amount;
end loop;
dbms_output.put_line('Total damage amount : '||total);
end;
/

set serveroutput on;
execute acc3('a31','2021');


Statement processed.
Total damage amount : 20000

Q5. 

create or replace procedure acc1(loc in varchar) is
begin
for item in(select * from ACCIDENT where ACCIDENT.location=loc) loop
dbms_output.put_line('Report Number : '||item.report_number);
dbms_output.put_line('Accident Date : '||item.acc_date);
dbms_output.put_line('Location : '||item.location);
end loop;
end;
/

set serveroutput on;
execute acc1('Patiala');

declare
begin
acc1('canada');
end;
/

Statement processed.
Report Number : 4
Accident Date : 21-JAN-19
Location : canada



Q6. 
create table T2(id integer,name varchar(20));

create or replace procedure ord1 is
begin
for item in (select custNo,cname,sum(ordamt) from customer natural join orders group by custNo,cname having sum(ordamt)>=10000) loop
insert into T2 values(item.custNo,item.cname);
end loop;
end;
/

set serveroutput on;
execute ord1;

select * from T2;

Q7.
create table t4(
          reportno integer,
          accddate date,
          location varchar(10));

create table t3(
          reportno integer,
          accddate date,
          location varchar(10));

 create or replace procedure test5
 	as
 	CURSOR details is
 	     select * from accident;

 	acc_rec details%rowtype;
 	BEGIN
 	OPEN details;
 	LOOP
 	FETCH details into acc_rec;
 	EXIT WHEN details%NOTFOUND;
 	  if(acc_rec.location in ('punjab','bombay','delhi')) THEN
 	       insert into t4
 	       	values(acc_rec.report_number,acc_rec.acc_date,acc_rec.location);
 	  else
 	   		insert into t3
 	   			values(acc_rec.report_number,acc_rec.acc_date,acc_rec.location);
 	   END IF;
 	   END LOOP;
 	END;
 	/

execute test5;