create database insurance_1BM23CS166;
use insurance_1BM23CS166;

create table person_1BM23CS166(
driver_id varchar(20),
name varchar(30),
address varchar(50),
PRIMARY KEY(driver_id)
);
create table car_1BM23CS166(
reg_num varchar(15),
model varchar(10),
year int,
PRIMARY KEY(reg_num)
);
create table owns_1BM23CS166(
driver_id varchar(20),
reg_num varchar(10),
PRIMARY KEY(driver_id, reg_num),
FOREIGN KEY(driver_id) REFERENCES person_1BM23CS146(driver_id),
FOREIGN KEY(reg_num) REFERENCES car_1BM23CS146(reg_num)
);
create table accident_1BM23CS166(
report_num int,
accident_date date,
location varchar(50),
PRIMARY KEY(report_num)
);
create table participated_1BM23CS166(
driver_id varchar(20),
reg_num varchar(10),
report_num int,
damage_amount int,
PRIMARY KEY(driver_id,reg_num,report_num),
FOREIGN KEY(driver_id) REFERENCES person_1BM23CS146(driver_id),
FOREIGN KEY(reg_num) REFERENCES car_1BM23CS146(reg_num),
FOREIGN KEY(report_num) REFERENCES accident_1BM23CS146(report_num)
);
insert into person_1BM23CS146 values('A01','Richard','Srinivas nagar');
insert into person_1BM23CS146 values('A02','Pradeep','Rajaji nagar');
insert into person_1BM23CS146 values('A03','Smith','Ashok nagar');
insert into person_1BM23CS146 values('A04','Venu','N R Colony');
insert into person_1BM23CS146 values('A05','John','Hanumanth nagar');

insert into car_1BM23CS146 values('KA052250','Indica',1990);
insert into car_1BM23CS146 values('KA031181','Lancer',1957);
insert into car_1BM23CS146 values('KA095477','Toyota',1998);
insert into car_1BM23CS146 values('KA0523408','Honda',2008);
insert into car_1BM23CS146 values('KA041702','Audi',2005);      

insert into accident_1BM23CS146 values(11, '2003-01-01', 'Mysore Road');
insert into accident_1BM23CS146 values (12,'2004-02-02','South end Circle');
insert into accident_1BM23CS146 values (13,'2003-01-21','Bull temple Road');
insert into accident_1BM23CS146 values (14,'2008-02-17','Mysore Road');
insert into accident_1BM23CS146 values (15,'2004-03-05','Kanakpura Road');

insert into owns_1BM23CS146 values('A01','KA052250');
insert into owns_1BM23CS146 values('A02','KA031181');
insert into owns_1BM23CS146 values('A03','KA095477');
insert into owns_1BM23CS146 values('A04','KA0523408');
insert into owns_1BM23CS146 values('A05','KA041702');

insert into participated_1BM23CS146 values('A01','KA052250',11,10000);
insert into participated_1BM23CS146 values('A02','KA053408',12,50000);
insert into participated_1BM23CS146 values('A03','KA095477',13,25000);
insert into participated_1BM23CS146 values('A04','KA031181',14,3000);
insert into participated_1BM23CS146 values('A05','KA041702',15,5000);

desc person_1BM23CS166;
desc car_1BM23CS166;
desc accident_1BM23CS166;
desc owns_1BM23CS166;
desc participated_1BM23CS166;

select * from person_1BM23CS166;
select * from car_1BM23CS166;
select * from accident_1BM23CS166;
select * from owns_1BM23CS166;
select * from participated_1BM23CS166;

update participated_1BM23CS166
set damage_amount=25000
where reg_num='KA053408' and report_num=12;

select count(distinct driver_id) CNT
FROM participated_1BM23CS166 a, accident_1BM23CS166 b
WHERE a.report_num = b.report_num and b.accident_date LIKE '2008%';

INSERT INTO accident_1BM23CS146 VALUES(16,'2008-03-08','Domlur');
select * from accident_1BM23CS166;

select accident_date,location 
from accident_1BM23CS166;

select distinct a.driver_id 
from participated_1BM23CS166 a
join participated_1BM23CS166 b ON a.report_num = b.report_num 
where a.damage_amount>=25000;

select * from participated_1BM23CS166 
order by damage_amount desc;

select avg(damage_amount) from participated_1BM23CS166;

DELETE FROM participated_1BM23CS166
WHERE damage_amount < (
    SELECT avg_damage
    FROM (SELECT AVG(damage_amount) AS avg_damage FROM participated_1BM23CS146) AS avg_table
);
 
SELECT p.name 
FROM person_1BMS23CS166 p
JOIN participated_1BM23CS166 part ON p.driver_id = part.driver_id
WHERE part.damage_amount >= (SELECT AVG(damage_amount) FROM participated_1BM23CS166);


SELECT AVG(damage_amount) FROM participated_1BM23CS166;
SELECT driver_id, damage_amount FROM participated_1BM23CS166;

SELECT MAX(damage_amount) FROM participated_1BM23CS166;
