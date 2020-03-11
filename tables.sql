CREATE TABLE person (
driver_id VARCHAR(10),
name VARCHAR(20),
address VARCHAR(20),
PRIMARY KEY(driver_id)
);

CREATE TABLE car(
regno VARCHAR(10),
model VARCHAR(10),
year INT,
PRIMARY KEY(regno)
);

CREATE TABLE accident(
report_number INT,
acc_date DATE,
location VARCHAR(20),
PRIMARY KEY(report_number)
);

CREATE TABLE owns(
driver_id VARCHAR(10),
regno VARCHAR(10),
PRIMARY KEY(driver_id, regno),
FOREIGN KEY(driver_id) REFERENCES person(driver_id),
FOREIGN KEY(regno) REFERENCES car(regno)
);

CREATE TABLE participated(
driver_id VARCHAR(10),
regno VARCHAR(10),
report_number INT,
damage_amount INT,
PRIMARY KEY(driver_id, regno, report_number),
FOREIGN KEY(driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
FOREIGN KEY(regno) REFERENCES car(regno) ON DELETE CASCADE,
FOREIGN KEY(report_number) REFERENCES accident(report_number) ON DELETE CASCADE
);

INSERT INTO person VALUES('1', 'devang', 'naraina');
INSERT INTO person VALUES('2', 'dhruv', 'pune');
INSERT INTO person VALUES('3', 'vishrut', 'churchgate, mumbai');
INSERT INTO person VALUES('4', 'shamanth', 'manipal');
INSERT INTO person VALUES('5', 'avi', 'chandigarh');

INSERT INTO car VALUES('10', 'xuv 500', 2000);
INSERT INTO car VALUES('11', 'maruti 800', 1990);
INSERT INTO car VALUES('12', 'skoda', 2005);
INSERT INTO car VALUES('13', 'ford fiat', 2008);
INSERT INTO car VALUES('14', 'BMW', 2019);

INSERT INTO accident VALUES('1', '10/feb/2000', 'california');
INSERT INTO accident VALUES('2', '13/mar/2000', 'udipi');
INSERT INTO accident VALUES('3', '10/feb/2000', 'bombay');
INSERT INTO accident VALUES('4', '21/jan/2019', 'canada');
INSERT INTO accident VALUES('6', '01/jul/2011', 'patiala');
INSERT INTO accident VALUES('7', '10/dec/2012', 'china');
INSERT INTO accident VALUES('8', '10/may/2017', 'punjab');


INSERT INTO owns VALUES('1', '10');
INSERT INTO owns VALUES('2', '11');
INSERT INTO owns VALUES('3', '12');
INSERT INTO owns VALUES('4', '13');
INSERT INTO owns VALUES('5', '14');

INSERT INTO participated VALUES('1', '10', '1', 20000);
INSERT INTO participated VALUES('2', '11', '2', 10000);
INSERT INTO participated VALUES('3', '12', '3', 12000);
INSERT INTO participated VALUES('4', '13', '4', 14000);
INSERT INTO participated VALUES('5', '14', '6', 2000);
INSERT INTO participated VALUES('1', '10', '7', 240000);
INSERT INTO participated VALUES('1', '10', '8', 6969);

SQL> update participated set damage_amount = 25000 WHERE regno = 14 AND report_number = 12;

1 rows updated.

SQL> delete from accident where extract(year from acc_date) = 2011;

1 rows deleted.

SQL> alter table accident add time int;

Table altered.

SQL> alter table accident drop column time;

Table altered.

SQL> alter table participated add check (damage_amount > 1000);

Table altered.
SQL> INSERT INTO participated VALUES('1', '10', '1', 200);
INSERT INTO participated VALUES('1', '10', '1', 200)
*
ERROR at line 1:
ORA-02290: check constraint (CC3336.SYS_C00208010) violated