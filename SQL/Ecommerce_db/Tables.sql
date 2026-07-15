create table customers (
cid int primary key,
cname varchar(100),
gender varchar(10),
city varchar(50),
signup_date date
);

Create table products (
prodid int primary key,
prodname varchar(100),
category varchar(50),
price decimal(10,2)
);

Create table orders (
oid int primary key,
cid int,
order_date date,
order_status varchar(30),
foreign key (cid) references customers (cid)
);

Create table order_items (
order_item_id int primary key,
oid int,
prodid int,
quan int,
unit_price decimal(10,2),
foreign key (oid) references orders(oid),
foreign key (prodid) references products(prodid)
);