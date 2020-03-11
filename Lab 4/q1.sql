SQL> select count(*)
  2  from owns, participated p, accident a
  3  where owns.driver_id = p.driver_id and p.report_number = a.report_number and extract(year from acc_date) = 2008;

  COUNT(*)
----------
         0

select count(*) as total_acc
from car, participated p
where p.regno = car.regno and car.model = 'skoda';

 TOTAL_ACC
----------
         1

SQL> select name, count(driver_id) as Total_acc, sum(damage_amount) as total_damage
  2  from  person natural join participated
  3  group by driver_id, name;

NAME                  TOTAL_ACC TOTAL_DAMAGE
-------------------- ---------- ------------
shamanth                      1        14000
vishrut                       1        12000
dhruv                         1        10000
devang                        1        20000


SQL> select driver_id as id, name, count(*) as total
  2  from person natural join participated
  3  group by driver_id, name
  4  having count(*) > 2;

ID         NAME                      TOTAL
---------- -------------------- ----------
1          devang                        3

no rows selected

SQL> select name from person where driver_id not in(
  2  select driver_id from participated);

NAME
--------------------
avi

