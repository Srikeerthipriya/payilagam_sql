-- Customers table

create table customers (
customer_id int primary key,
name varchar(80) not null,
email varchar(100),
city varchar(30),
state varchar(20)
);

-----------------------------------------------------------------------------
-- orders table

create table orders (
order_id int primary key,
customer_id int references customers(customer_id),
order_date date,
amount decimal(10,2),
product_name varchar(30),
product_category varchar(30),
status varchar(30) not null
);

-----------------------------------------------------------------------------
-- products table

create table products (
product_id int unique,
product_name varchar(30),
unit_price decimal(6,2),
category  varchar(30),
stock_quantity int,
order_id int references orders(order_id)
);

------------------------------------------------------------------------
-- sale table

Create table sale (
    sale_id int primary key,
    order_id int not null references orders(order_id),
    customer_id int not null references customers(customer_id),
    product_id int not null references products(product_id),
    sale_date date not null,
    quantity int not null check (quantity > 0),
    unit_price decimal(10,2) not null,
    total_amount decimal(10,2) not null,
    payment_method varchar(20),
    sale_status varchar(20) not null
);
