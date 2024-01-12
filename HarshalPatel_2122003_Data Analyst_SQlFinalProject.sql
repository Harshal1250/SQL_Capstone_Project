create database AbleJobs;
use AbleJobs;

create table Sales1(
salesan_id int primary key,
name varchar(20),
city varchar(20),
commission float
);
describe Sales1;
insert into Sales1 values(5001,"James Hoog","New York",0.15);
insert into Sales1 values(5002,"Nail Knite","Paris",0.13);
insert into Sales1 values(5005,"Pit Alex","London",0.11);
insert into Sales1 values(5006,"Mc Lyon","Paris",0.14);
insert into Sales1 values(5007,"Paul Adam","Rome",0.13);
insert into Sales1 values(5003,"Lauson Hen","San Jose",0.12);
Select * from Sales1;
alter table Sales1 rename column salesan_id to salesman_id;
use AbleJobs;
create table Sales2(
customer_id int primary key,
cust_name varchar(20),
city varchar(20),
grade int,
salesman_id int
);
describe Sales2;
insert into Sales2 values(3002,"Nick Rimando","New York",100,5001);
insert into Sales2 values(3007,"Brad Davis","New York",200,5001);
insert into Sales2 values(3005,"Garam Zusi","California",200,5002);
insert into Sales2 values(3008,"Julian Green","London",300,5002);
insert into Sales2 values(3004,"Fabian Johnson","Paris",300,5006);
insert into Sales2 values(3009,"Geoff Cameron","Berlin",100,5003);
insert into Sales2 values(3003,"Jozy Altidor","Mpscow",200,5007);
Select * from Sales2;
use AbleJobs;
create table Orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
);
insert into Orders values(70001,150.5,"2012-10-05",3005,5002);
insert into Orders values(70009,270.65,"2012-09-10",3001,5005);
insert into Orders values(70002,65.26,"2012-10-05",3002,5001);
insert into Orders values(70004,110.5,"2012-08-17",3009,5002);
insert into Orders values(70005,2400.6,"2012-07-27",3007,5001);
insert into Orders values(70008,5760,"2012-09-10",3002,5001);
insert into Orders values(70010,1983.43,"2012-10-10",3004,5006);
insert into Orders values(70003,2480.4,"2012-10-10",3009,5003);
insert into Orders values(70012,250.45,"2012-06-27",3008,5002);
insert into Orders values(70011,75.29,"2012-08-17",3003,5007);
insert into Orders values(70013,3045.6,"2012-08-25",3002,5001);

select * from Orders;
create table Nobel(
year int,
subject varchar(20),
winner varchar(30),
country varchar(20),
category varchar(20)
);
select * from Nobel;
insert into Nobel values (1970,"Physics","Hannes Alfen","Sweden","Scientist");
insert into Nobel values (1970,"Physics","Louis Neel","France","Scientist");
insert into Nobel values (1970,"Chemistry","Luis Federico Leloir","Feance","Scientist");
insert into Nobel values (1970,"Physiology","Ulf Von Euler","Sweden","Scientist");
insert into Nobel values (1970,"Physiology","Bernard Katz","Getmany","Scientist");
insert into Nobel values (1970,"Literature","Aleksandr Solzhenitsyn","Russia","Linguist");
insert into Nobel values (1970,"Economics","Paul Soizhenittsn","USA","Economist");
insert into Nobel values (1970,"Physiology","Julis Axeirod","USA","Scientist");
insert into Nobel values (1971,"Physics","Denis Gabor","Hungary","Scientist");
insert into Nobel values (1971,"Vhemistry","Gerhsrf Hrrxbrg","Getmany","Scientist");
insert into Nobel values (1971,"Peace","Willy Brandt","Getmany","Chancellor");
insert into Nobel values (1971,"Litrature","Pablo Neruda","Chile","Linguist");
insert into Nobel values (1971,"Economics","Simon Kuznets","Russia","Economist");
insert into Nobel values (1978,"Peace","Anwer al-Sadat","Egypt","President");
insert into Nobel values (1978,"Peace","Menachem Begin","Israel","Prime Minister");
insert into Nobel values (1987,"Chemistry","onald J. Cram","USA","Scientist");
insert into Nobel values (1987,"Chemistry","Jean-Marie Lehn","France","Scientist");
insert into Nobel values (1987,"Physiology","Susumu Seltem","Japan","Scientist");
insert into Nobel values (1994,"Economics","Reinhard Selten","Germany","Economist");
insert into Nobel values (1994,"Peace","Yitzhak Rabin","Israel","Prime Minister");
insert into Nobel values (1987,"Physics","Johannes Georg Bednorz","Germany","Scientist");
insert into Nobel values (1987,"Litrature","Joseph Brodsky","Russia","Linguist");
insert into Nobel values (1987,"Economics","Robert Solow","USA","Economist");
insert into Nobel values (1987,"Litrature","Kenzaburo Oe","Japan","Linguist");
use AbleJobs;
Select * from Sales2;
update Sales1
set commission=0.22 
where name="Pit Alex";
update Sales1
set city="Paris"
where salesman_id=5003;
set sql_safe_updates=0;
update Sales2
set grade=300
where cust_name="Garam Zusi";
update Sales2
set city="London"
where customer_id=3009;
select salesman_id,name,city from Sales1 where city="Paris" or city="Rome";
select salesman_id,name,city from Sales1 where city="Paris" and city="Rome";
select salesman_id,name,city,commission from Sales1 where commission between 0.12 and 0.14;
SELECT * from Sales1 where LEFT(name, 1) BETWEEN "A" AND "L";
select * from Sales2 where cust_name like ("B%");
select * from Sales2 where cust_name like ("%n");
select * from Sales2 where cust_name like ("N__l%");
Select * from Nobel;
select year,subject,winner from Nobel where year=1970 or year=1987;
select winner from Nobel where subject="Litrature" and year=1971;
select year,subject from Nobel where winner="Denis Gabor";
select winner from Nobel where subject="Physics" and year=1970;
select year,subject,winner,country from Nobel where subject="Chemistry" and year between 1965 and 1975;
select * from Nobel where year>1972 and winner in("Menachem Begin","Yitzhak Rabin");
select * from Nobel where winner like "Louis%";
select * from Nobel where winner="Johannes Georg Bednorz";
select * from Orders;
select round(sum(purch_amt),2) from Orders;
select round(avg(purch_amt),2) from Orders;
SELECT COUNT(DISTINCT salesman_id) 
FROM Orders;
select count(*) from Orders;
select Sales1.name as "SalesPerson",
Sales2.cust_name as "Customer", Sales2.city 
FROM Sales1,Sales2 
WHERE Sales1.city=Sales2.city;
SELECT b.cust_name AS "Customer Name", 
b.city, a.name AS "Salesman", a.commission 
FROM Sales2 b
INNER JOIN Sales1 a
ON b.salesman_id=a.salesman_id;
SELECT b.cust_name as "Cutomer name", b.city, a.name AS "Salesman", a.commission 
FROM Sales2 b
INNER JOIN Sales1 a 
ON b.salesman_id=a.salesman_id 
WHERE a.commission>.12;
SELECT b.cust_name AS "Customer Name", 
b.city, a.name AS "Salesman", a.city,a.commission  
FROM Sales2 b 
INNER JOIN Sales1 a 
ON b.salesman_id=a.salesman_id 
WHERE a.commission>.12 
AND b.city<>a.city;
create database online_bookstore;
use online_bookstore;
create table Customer_table(
customer_id int,
customer_name varchar(20),
city varchar(20)
);
insert into Customer_table values(1,"John Smith","New York");
insert into Customer_table values(2,"Jane Doe","Los Angeles");
insert into Customer_table values(3,"Bob Johnson","Chicago");
Select * from Customer_table;
create table Order_table(
Order_id int,
customer_id int,
product varchar(20),
quantity int,
price int
);
insert into Order_table values(1,1,"Laptop",2,340);
insert into Order_table values(2,1,"Printer",1,240);
insert into Order_table values(3,2,"Smartphone",3,70);
insert into Order_table values(4,3,"Tablet",2,80);
select * from Order_table; 
select Customer_table.customer_name 
from Customer_table
where Customer_table.customer_id in (
	select Order_table.customer_id from Order_table where Order_table.price > 100
);
select Order_table.product from Order_table
where Order_table.customer_id in (
	select Customer_table.customer_id from Customer_table where Customer_table.customer_name="John Smith"
);
select Order_table.Order_id,Order_table.price as "Total Amount" from Order_table
where Order_table.quantity>2;
