create database employee_1bm23cs166;
use employee_1bm23cs166;

create table dept(
dno varchar(20),
dname varchar(20),
dloc varchar(20),
primary key(dno));

create table employee(
empno int,
ename varchar(20),
mgr_no int,
hiredate varchar(20),
sal float,
dno varchar(20),
primary key(empno,dno),
foreign key(dno) references dept(dno));

create table incentives(
empno int,
date varchar(20),
amt float,
primary key(empno,date),
foreign key(empno) references employee(empno));

create table project(
pno int,
ploc varchar(20),
pname varchar(20),
primary key(pno));

create table AssignedTo(
empno int,
pno int,
job_role text,
primary key(empno, pno),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno));

insert into dept values(1,"cse","pj");
insert into dept values(2,"ise","pj");
insert into dept values(3,"csds","pg");
insert into dept values(4,"ece","pg");
insert into dept values(5,"aiml","pj");

insert into employee values(101,"Lakshya",100,"12/01/1999",100000,1);
insert into employee values(201,"Utkarsh",200,"17/01/2020",50000,2);
insert into employee values(301,"Achintya",100,"01/09/2004",30000,3);
insert into employee values(401,"Vivek",101,"03/08/2003",10000,4);
insert into employee values(501,"Aditya",101,"29/02/2008",90000,5);
insert into employee values(301,"Lucky",101,"29/02/2007",20000,1);

insert into incentives values(101,"12/03/2004",50000);
insert into incentives values(201,"17/03/2024",25000);
insert into incentives values(401,"03/11/2019",5000);

insert into project values(10,"bangalore","chatbot");
insert into project values(40,"delhi","ml_model");
insert into project values(50,"bombay","blockchain");
insert into project values(30,"hyderabad","stocks");
insert into project values(80,"mysore","android app");

insert into AssignedTo values(101,10,"devops");
insert into AssignedTo values(201,40,"sde");
insert into AssignedTo values(301,50,"manager");
insert into AssignedTo values(401,30,"jpa");
insert into AssignedTo values(501,80,"pa");

select * from dept;
select * from employee;
select * from incentives;
select * from project;
select * from AssignedTo;

select a.empno from assignedTo a
where a.pno=any(select pno from project where ploc in ("bangalore","hyderabad","mysore"));

select e.empno from employee e
where e.empno!=all(select i.empno from incentives i);

update dept
set dloc="bangalore" where dno=1;

update dept
set dloc="Hyderabad" where dno=4;


select e.empno,e.ename,d.dname,a.job_role,d.dloc,p.ploc
from employee e, dept d,assignedTo a,project p
where e.dno=d.dno and e.empno=a.empno and a.pno = p.pno and d.dloc=p.ploc;


select ename from employee
where mgr_no = (select max(mgr_no) from employee);

select ename from employee 
where sal>(select avg(sal) from employee);

select ename from employee
where sal = (select max(sal) from employee where 
sal<(select max(sal) from employee));

select * from employee
where empno=(select empno from incentives 
where amt=(select max(amt) from incentives
where amt<(select max(amt) from incentives)));

select e.ename,m.ename as mgr_name from employee e,employee m
where e.mgr_no=m.empno and e.dno=m.dno;
