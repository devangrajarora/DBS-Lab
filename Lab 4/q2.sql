SQL> select c.cname
  2  from customer c, orders o
  3  where o.odate = '09/may/2015' and c.custNo = o.custNo;

no rows selected

SQL> select orderNo, sum(qty) as total_quantity
  2  from orders natural join order_items
  3  group by orderNo;

   ORDERNO TOTAL_QUANTITY
---------- --------------
         1             12
         2            103
         3            300
         4            122
         5            998

select distinct o1.orderNo, o1.qty 
from order_items o1, order_items o2 
where o1.qty > o2.qty;

select o1.orderNo, o1.qty
from order_items o1
where o1.qty >= all (
  select o2.qty
  from order_items o2
);


   ORDERNO        QTY
---------- ----------
         5        998



select s1.shipdate, count(*) as frequency
from shipment s1
group by s1.shipdate
having count(*) >= all(
  select count(*)
  from shipment s2
  group by s2.shipdate
);

SHIPDATE   FREQUENCY
--------- ----------
12-AUG-18          2
21-MAY-18          2
21-MAR-17          2


SQL> select orderNo
  2  from warehouse natural join shipment
  3  where city = 'Bangalore';

   ORDERNO
----------
        10
         9
         1
         7
         6

SQL> select *
  2  from customer
  3  where cname like '%Arora';

    CUSTNO CNAME         CITY
--------------------  --------------
        6 Devang Arora  Delhi


SQL>  select custNo, sum(ordamt) as total
  2   from customer natural join orders
  3   group by custNo
  4   order by sum(ordamt) desc;

    CUSTNO      TOTAL
---------- ----------
         1      18000
         2      18000
         5       9121
         3       8560
         4        108

select orderNo
from shipment
where shipdate = '25/jun/2019';

select *
from customer c
where c.custNo in (
select custNo
from orders natural join shipment
where shipdate =  '25/jun/2019'
);


SQL> select *
  2  from customer c
  3  where c.custNo in (
  4  select custNo
  5  from orders natural join shipment
  6  group by custNo, shipdate
  7  having shipdate = '25/jun/2019' and count(*) > 2
  8  );

    CUSTNO CNAME   CITY
----------------------------------
         1 Devang Delhi

         2 Vishrut Mumbai