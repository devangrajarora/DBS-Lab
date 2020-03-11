select custNo as cNo, cname as name, city, count(odate) as no_of_orders, odate as date_
from customer natural join orders
group by odate, custNo, cname, city
having count(odate) > 2 and odate = '1/feb/2020';


select distinct warehouseNo, city, count(orderNo) as no_of_orders
from shipment natural join warehouse
group by warehouseNo, city
order by warehouseNo;

insert into shipment values(1,1,'25-JAN-2019');
insert into shipment values(2,2,'12-AUG-2018');
insert into shipment values(3,3,'31-DEC-2019');
insert into shipment values(4,4,'21-MAY-2018');
insert into shipment values(5,5,'11-MAR-2020');
insert into shipment values(6,6,'21-MAR-2017');
insert into shipment values(7,6,'21-MAR-2017');
insert into shipment values(8,4,'21-MAY-2018');
insert into shipment values(9,1,'25-JUL-2019');
insert into shipment values(10,1,'25-JUN-2019');
insert into shipment values(11,2,'12-AUG-2018');

insert into orders values(1,'10-FEB-2019',1,4000);
insert into orders values(6,'10-FEB-2019',1,2000);
insert into orders values(2,'10-JAN-2020',2,2000);
insert into orders values(3,'14-AUG-2019',3,4560);
insert into orders values(4,'20-JUL-2017',4,108);
insert into orders values(5,'02-JUN-2018',5,9099);
insert into orders values(7,'02-JUN-2018',5,22);
insert into orders values(8,'1-FEB-2020',1,4000);
insert into orders values(9,'1-FEB-2020',1,4000);
insert into orders values(10,'1-FEB-2020',2,4000);
insert into orders values(11,'1-FEB-2020',2,4000);
insert into orders values(12,'1-FEB-2020',3,4000);
insert into orders values(13,'1-FEB-2020',1,4000);
insert into orders values(14,'1-FEB-2020',2,4000);
insert into orders values(15,'1-FEB-2020',2,4000);

