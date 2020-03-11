create or replace function q1(id in number, month1 in varchar) return number as
value integer;
begin
select sum(ordamt) into value from orders where extract(month from odate) = month1 and id = custNo;
return value;
end;
/ 

set serveroutput on;
declare val number(10);
begin
val:=q1(5,'06');
if(val is NULL) then
val := 0;
end if;
dbms_output.put_line(val);
end;
/

create or replace procedure test(id in number, month in varchar) is
val integer;
begin
val:=q1(id,month);
if(val is NULL) then
val := 0;
end if;
dbms_output.put_line(val);
end;
/

create or replace procedure q2 is
begin
for item in (select sum(ordamt) sum, count(orderno) total, warehouseno from orders natural join shipment group by warehouseno having count(*) > 2)
loop
dbms_output.put_line('Warehouse: '|| item.warehouseno || ' Total orders: ' || item.total || ' Sum: ' || item.sum);
end loop;
end;
/