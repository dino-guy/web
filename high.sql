create database high;
use high;

create table salesman(
salesman_id int primary key,
name varchar(255),
city varchar (255),
commission float);

insert into salesman(salesman_id,name,city,commission)value
(5001,'James hoog','New york',0.15),
(5002,'Nail knite','Paris',0.13),
(5005,'Pit alex','Londan',0.11),
(5006,'Mc lyon','Paris',0.14),
(5007,'Paul adam','Rome',0.13),
(5003,'Lauson Hen','San jose',0.12);

create table orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int,
foreign key(salesman_id)references salesman(salesman_id));

insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70001,150.50,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.50,'2012-08-17',3009,5003),
(70007,948.50,'2012-09-10',3005,5002),
(70005,2400.60,'2012-07-27',3007,5001),
(70008,5760.00,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.40,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.60,'2012-04-25',3002,5001);

create table customers(
customer_id int,
cust_name varchar(255),
city varchar(255),
grade int,
salesman_id int,
foreign key (salesman_id)references salesman(salesman_id));

insert into customers(customer_id,cust_name,city,grade,salesman_id)value
(3002,'Nick rimando','New york',100,5001),
(3007,'Brad davis','New york',200,5001),
(3005,'Graham zusi','California',200,5002),
(3008,'Julian green','London',300,5002),
(3004,'Fabian johnson','Paris',300,5006),
(3009,'Geoff cameron','Berlin',100,5003),
(3003,'Jozy altidor','Moscow',200,5007),
(3001,'Brad guzan','London',null,5005);

create table nobel_win(
year year,
subject varchar(155),
winner varchar(155),
country varchar(155),
category varchar(155));

insert into nobel_win(year,subject,winner,country,category)value
(1970,'Physics','Hannes alfven','Sweden','Scientist'),
(1970,'Physics','Louis neel','France','Scientist'),
(1970,'Chemistry','Luis federico','France','Scientist'),
(1970,'Physiology','Ulf von euler','Sweden','Scientist'),
(1970,'Physiology','Bernard katz','Germany','Scientist'),
(1970,'Literature','Aleksandar solzhenitsyn','Russia','Linguist'),
(1970,'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970,'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971,'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971,'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971,'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971,'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971,'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978,'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978,'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987,'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987,'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987,'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1994,'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994,'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
(1987,'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987,'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987,'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994,'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

select*from salesman;
select*from orders;
select*from customers;
select distinct salesman_id from orders;
select name,city from salesman where city='Paris';
select customer_id,cust_name,city,grade,salesman_id from customers where grade=200;
select ord_no,ord_date,purch_amt from orders where salesman_id=5001;
select year,subject,winner,country,category from nobel_win where year=1970;
select sum(purch_amt)as total_purchase_amount from orders;
select salesman.name as salesman,customers.cust_name as customerm,
customers.city as city from salesman join customers on salesman.city=customers.city;
select orders.ord_no as order_no,orders.purch_amt,customers.cust_name,
customers.city as City from customers join orders on purch_amt between 500 and 2000;
