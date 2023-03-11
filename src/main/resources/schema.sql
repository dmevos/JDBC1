/*скрипт создания таблицы с параметрами:
название таблицы — CUSTOMERS;
содержит в себе 5 столбцов — id, name, surname, age, phone_number;
поле id будет первичным ключом, который инкрементируется каждый раз при создании пользователя.
*/

create schema if not exists jdbc_schema;

create table jdbc_schema.customers
(
    id int primary key auto_increment,
    name           varchar(30) not null,
    surname        varchar(50) not null,
    age            smallint    not null check ( age > 0 and age < 130 ),
    phone_number   varchar(11)
);

# delete from jdbc_schema.customers;

insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('Alexey', 'Petrov', 26, 89031111111);
insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('alexey', 'Vasin', 27, 89032222222);
insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('ALEXEY', 'Ivanov', 28, 89033333333);
insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('Ivan', 'Kolin', 29, 89034444444);
insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('Denis', 'Zhukov', 30, 89035555555);
insert into jdbc_schema.customers (name, surname, age, phone_number)
values ('Onufriy', 'Psaki', 31, 89036666666);

/*скрипт создания таблицы с параметрами:
название таблицы — ORDERS;
содержит в себе 4 столбца — id, date, customer_id,product_name, amount;
поле id будет первичным ключом, который инкрементируется каждый раз при создании заказа;
внешним ключом на поле id таблицы пользователей будет customer_id.*/

create table jdbc_schema.orders
(
    id int primary key auto_increment,
    date date,
    customer_id int,
    product_name varchar(50),
    amount decimal(8,2),
    foreign key (customer_id) references customers(id)
);

# delete from osipov_schema.orders;

insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-01', 1, 'Валенки', 123.22);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-02', 1, 'Фуфайка', 222.33);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-02', 1, 'Шапка', 23.44);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 2, 'Ноутбук', 500.13);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 2, 'Наушники', 10.10);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 3, 'Яблочный сок', 5);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 4, 'Билет в театр', 15.90);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 5, 'Перфоратор', 85.99);
insert into jdbc_schema.orders (date, customer_id, product_name, amount)
values ('2023-01-03', 6, 'Англо-Русский словарь', 1000.65);