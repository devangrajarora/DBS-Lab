a)
select cname 
	from customer
	where (cname) in (select cname from customer where city is NULL);


b)
select distinct(cname),ordamt 
	from orders natural join customer 
	where ordamt>= all (select ordamt from orders);


c)
select distinct(orderNo) 
	from shipment 
	where (orderNo) in (select orderNo from shipment where shipdate is NULL);


d)
select itemNo
	from item 
	where (itemNo) not in (select itemNo from order_items natural join item);


e)
with tot(item,qty) as (select itemNo,count(itemNo) from order_items group by itemNo) 
	select * 
	from tot 
	order by qty desc;


f)
select * 
	from shipment s1 
	where (s1.shipdate) in (select s2.shipdate from shipment s2 where shipdate<>'21-MAR-2017');


g)
select cname 
	from customer 
	where (cname) in 
	(select cname from customer natural join orders natural join shipment where shipdate='30-JAN-2018' and shipdate='31-JAN-2018');


h)
with temp as
	(select warehouseNo,custNo from shipment natural join orders natural join warehouse group by warehouseNo,custNo) 
	select cname from customer where custNo in (
	select custNo
	from temp group by custNo having count(*)=1);


i)
with tot(custNo,name,qty) as 
	(select custNo,cname,count(custNo) from orders natural join customer group by custNo,cname) 
	select * from tot where qty >= all (
		select qty from tot);
