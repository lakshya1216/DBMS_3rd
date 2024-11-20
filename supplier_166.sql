create database supplier_166;
use  supplier_166;
create table supplier(
sid int,
sname varchar(20),
city varchar(20),
primary key(sid));
create table parts(
pid int,
pname varchar(20),
color varchar(20),
primary key(pid));

create table catalog(
sid int,pid int, cost int,
foreign key(sid) references supplier(sid),
foreign key(pid) references parts(pid));
 
 insert into Supplier values (10001, 'Acme Widget','Bangalore');
insert into Supplier values (10002, 'Johns','Kolkata');
insert into Supplier values (10003, 'Vimal','Mumbai');
insert into Supplier values (10004, 'Reliance','Delhi');

insert into Parts values (20001, 'Book','Red');
insert into Parts values (20002, 'Pen','Red');
insert into Parts values (20003, 'Pencil','Green');
insert into Parts values (20004, 'Mobile','Green');
insert into Parts values (20005, 'Charger','Black');

insert into Catalog values (10001, 20001 , 10);
insert into Catalog values (10001, 20002 , 10);
insert into Catalog values (10001, 20003 , 30);
insert into Catalog values (10001, 20004 , 10);
insert into Catalog values (10001, 20005 , 10);
insert into Catalog values (10002, 20001 , 10);
insert into Catalog values (10002, 20002 , 20);
insert into Catalog values (10003, 20003 , 30);
insert into Catalog values (10004, 20003 , 40);

select * from Supplier;
select * from Parts;
select * from Catalog;
 
select distinct p.pname from 
Parts p, Catalog c where
p.pid=c.pid; 

select s.sname from Supplier s where 
NOT EXISTS (select p.pid from Parts p where
			p.pid NOT IN (select c.pid from Catalog c where 
						  c.sid = s.sid)
            ); 
            
            
select s.sname from Supplier s where
NOT EXISTS ( select p.pid from Parts p where 
             p.color='red' and NOT EXISTS( select c.pid from Catalog c where 
										    c.sid=s.sid and c.pid=p.pid)
             );                
             
select p.pname from
Parts p, Supplier s, Catalog c where 
p.pid = c.pid and c.sid=s.sid and s.sname = 'Acme Widget' and 
NOT EXISTS ( select 1 from Catalog c1, Supplier s1 where 
			 c1.pid = p.pid and c1.sid = s1.sid and s1.sname !='Acme Widget');
             
             
             
select c.sid from Catalog c where 
c.cost > (select AVG(c1.cost) from Catalog c1 where 
		  c1.pid = c.pid)
group by c.sid;          


select p.pid, s.sname from Parts p
join Catalog c on p.pid = c.pid
join Supplier s on c.sid = s.sid
where c.cost = (select MAX(c1.cost) from Catalog c1
				where c1.pid = p.pid);