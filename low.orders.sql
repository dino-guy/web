create database low;
use low;

create table customers(
customer_ID int primary key,
customer_name varchar(255),
shipping_address varchar(255),
payment_method varchar(255));

insert into customers(customer_ID,customer_name,shipping_address,payment_method)values
(1001,'Bob','174 IT st,lightfield','Home devlivery'),
(1002,'Jack','178 milk st,lightfield','Credit card'),
(1003,'Lee','167 pine st,lightfield','Paypal');

select*from customers;

create table products (
product_ID int primary key,
product_name varchar(255),
price int,
service_details varchar(255),
foreign key (product_ID)references products(product_ID));

insert into products(product_ID,product_name,price,service_details)value
(101,'Realme phone',12000,'Realme x50'),
(102,'Lenovo mouse',1300,'lenovo 130 wireless mouse'),
(103,'Phone model Z',15000,'model z series');

select * from products;

create table orders(
order_ID int primary key ,
order_date date,
customer_ID int,
Total_amt int,
foreign key (customer_ID)references customers(customer_ID));

insert into orders(order_ID,order_date,customer_ID,Total_amt)value
(1,'2024-07-12',1001,12000),
(2,'2024-07-15',1002,1300),
(3,'2024-07-18',1003,150000);

select * from orders;

create table orderItems(
orderItem_ID int primary key,
order_ID int,
product_ID int,
productItem_ID int,
Quantity int,
price int,
foreign key (order_ID) references orders(order_ID),
foreign key (product_ID) references products(product_ID),
constraint unique_orders_products unique(order_ID,product_ID));

drop table orderItems;
 
insert into orderItems(orderItem_ID,order_ID ,product_ID,productItem_ID,Quantity,price)value
(1,1,101,301,2,12000),
(2,2,102,302,1,1300),
(3,3,103,303,1,15000);

select * from orderItems;

create table Delivery(
Delivery_ID int primary key,
order_ID int,
Delivery_date date,
Deliveryboy_ID int,
Delivery_status varchar(255),
foreign key (order_ID) references orders(order_ID));

insert into Delivery(Delivery_ID,order_ID,Delivery_date,Deliveryboy_ID,Delivery_status)value
(1,1,'2024-07-12',301,'Delivered'),
(2,2,'2024-07-15',302,'Delivered'),
(3,3,'2024-07-18',303,'Delivered');

select*from Delivery;

select*from orders where Total_amt>1300;

select customers.customer_name,count(orders.order_ID)as Totalorders 
from customers join orders on customer_ID=customers.customer_ID group by customers.customer_name;
 
 select orders.order_ID,orders.order_date,
 customers.customer_name,
 products.product_name,
 orderItems.Quantity,
 orderItems.price,
 orders.Total_amt
 from orders
 join customers on orders.customer_ID=customers.customer_ID 
 join orderItems on orders.order_ID=orderItems.order_ID
 join products on orderItems.product_ID=products.product_ID;

 select products.product_name,orderItems.price
from orderItems join products on orderItems.product_ID=products.product_ID where orderItems.order_ID=1;
 
select Delivery.Delivery_ID,
Delivery.Delivery_date,
Delivery.Deliveryboy_ID,
Delivery.Delivery_status,
orders.order_ID,
customers.customer_name
from Delivery join orders on Delivery.order_ID=orders.order_ID
join customers on orders.customer_ID=customers.customer_ID;

select orders.order_ID,
orders.order_date,
orders.Total_amt 
from orders join customers on orders.customer_ID where customers.customer_name='Jack';

select orders.order_ID,orders.order_date,customers.customer_name,Delivery.Delivery_date,Delivery.Delivery_status
from orders join customers on orders.customer_ID=customers.customer_ID 
join Delivery on orders.order_ID=Delivery.order_ID where Deliveryboy_ID=303;



