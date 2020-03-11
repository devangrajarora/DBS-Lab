create table customer(
  custNo int,
  cname varchar(50),
  city varchar(20),
  primary key(custNo));

create table orders(
    orderNo int,
    odate date,
    custNo int,
    ordamt int,
    primary key(orderNo),
    foreign key(custNo) references customer(custNo) on delete cascade);

create table item(
  itemNo int,
  unitprice int,
  primary key(itemNo));

create table order_items(
  orderNo int,
  itemNo int,
  qty int,
  primary key(orderNo,itemNo),
  foreign key(orderNo) references orders(orderNo) on delete cascade,
  foreign key(itemNo) references item(itemNo) on delete cascade);


 create table warehouse(
  warehouseNo int,
  city varchar(30),
  primary key(warehouseNo));

create table shipment(
  orderNo int,
  warehouseNo int,
  shipdate date,
  primary key(orderNo),
  foreign key(warehouseNo) references warehouse(warehouseNo) on delete cascade);

 insert into customer values(1,'Devang','Delhi');
 insert into customer values(2,'Vishrut','Mumbai');
 insert into customer values(3,'Dhruv','Pune');
 insert into customer values(4,'Shamanth','Udipi');
 insert into customer values(5,'Abhishek','Mumbai');
insert into customer values(6,'Devang Arora','Delhi');

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
insert into orders values(17,'1-FEB-2020',2,4000);
insert into orders values(16,'1-FEB-2020',2,4000);
insert into orders values(19,'1-FEB-2020',1,4000);
insert into orders values(20,'1-FEB-2020',1,4000);



insert into item values (1,20);
insert into item values (2,100);
insert into item values (3,4500);
insert into item values (4,980);
insert into item values (5,330);

insert into warehouse values(1,'Bangalore');
insert into warehouse values(2,'Delhi');
insert into warehouse values(3,'Noida');
insert into warehouse values(4,'Patna');
insert into warehouse values(5,'Manipal');
insert into warehouse values(6,'Bangalore');

insert into order_items values(1,1,12);
insert into order_items values(2,2,103);
insert into order_items values(3,3,300);
insert into order_items values(4,4,122);
insert into order_items values(5,5,998);

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
insert into shipment values(13,1,'25-JUN-2019');
insert into shipment values(12,1,'25-JUN-2019');
insert into shipment values(17,1,'25-JUN-2019');
insert into shipment values(16,1,'25-JUN-2019');
insert into shipment values(19,1,'25-JUN-2019');
insert into shipment values(20,1,'25-JUN-2019');




SQL> SELECT cname AS Name, COUNT(*) AS Number_of_orders, AVG(ordamt) AS Avg
  2  from customer natural join orders
  3  group by cname;

NAME                                               NUMBER_OF_ORDERS        AVG
-------------------------------------------------- ---------------- ----------
Shamanth                                                          1        108
Dhruv                                                             1       4560
Devang                                                            2       3000
Vishrut                                                           1       2000
Abhishek                                                          2     4560.5


SQL> select orderNO from shipment natural join warehouse where warehouse.city = 'Bangalore';

   ORDERNO
----------
         1
         6
         7

