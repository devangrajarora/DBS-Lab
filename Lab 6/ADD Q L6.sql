Q2.

create or replace trigger accd_limit_reached
before insert on participated
for each row
declare
c number;
begin
if inserting then
select count(driver_id) into c
from participated
group by driver_id
having driver_id = :new.driver_id;
if (c = 1) then
dbms_output.put_line('Warning! you have reached the accident limit of 2. Here are your accident details.');
for i in (select *
from participated
where driver_id = :new.driver_id) loop
dbms_output.put_line('driver id : '||i.driver_id||' regno : '||i.regno||' report_number : '||i.report_number||' damage amount : '||i.damage_amount);
end loop;
end if;
end if;
end;
/

INSERT INTO participated VALUES('4', '13', '2', 14000);

Warning! you have reached the accident limit of 2. Here are your accident details.
driver id : 4 regno : 13 report_number : 4 damage amount : 14000
name : shamanth driver id : 4 address : manipal

Q3.
create or replace procedure discount
as
d_orderNo orders.orderNo%type;
d_odate orders.odate%type;
d_custNo orders.custNo%type;
d_ordamt orders.ordamt%type;
begin
for i in
(select orderNo, odate, custNo, ordamt 
from orders
where orderNo in(
select orderNo
from order_items
group by orderNo
having sum(qty)>=5)) loop
dbms_output.put_line('orderNo : '||(i.orderNo)||' order date : '||(i.odate)||' customerNo : '||(i.custNo)||' discounted amount : '||(i.ordamt * 0.8));
end loop;
end;
/
