create schema if not exists restaurant;

set search_path to restaurant, public;

create table "employee"
(
    employee_id integer not null primary key,
    first_nm    varchar(256),
    last_nm     varchar(256),
    salary      integer,
    passport    varchar(256)
);

create table if not exists "administrator"
(
    administrator_id serial primary key not null,
    employee_id      integer            not null references "employee" (employee_id)
);

create table if not exists "hall"
(
    hall_id    serial primary key not null,
    hall_nm    varchar(256),
    tables_cnt integer
);

create table if not exists "hall_x_administrator"
(
    hall_id          integer not null references "hall" (hall_id),
    administrator_id integer not null references "administrator" (administrator_id),
    constraint hall_administrator_id primary key (hall_id, administrator_id)
);

create table if not exists "cook"
(
    cook_id     serial primary key not null,
    employee_id integer            not null references "employee" (employee_id)
);

create table if not exists "dish"
(
    dish_id serial primary key not null,
    dish_nm varchar(256)
);

create table if not exists "cook_x_dish"
(
    cook_id integer not null references "cook" (cook_id),
    dish_id integer not null references "dish" (dish_id),
    constraint dish_cook_id primary key (cook_id, dish_id)
);

create table if not exists "product"
(
    product_id serial primary key not null,
    product_nm varchar(256),
    amount     integer
);

create table if not exists "product_x_dish"
(
    product_id integer not null references "product" (product_id),
    dish_id    integer not null references "dish" (dish_id),
    constraint product_dish_id primary key (product_id, dish_id)
);

create table if not exists "customer"
(
    customer_id    integer primary key not null,
    first_nm       varchar(256),
    last_nm        varchar(256),
    customer_since timestamp           not null default now()
);

create table if not exists "card"
(
    card_id integer primary key not null,
    dish_id integer references "dish" (dish_id),
    bonuses integer             not null default 0
);

create table if not exists "customer_x_card"
(
    customer_id integer not null references customer (customer_id),
    card_id     integer not null references "card" (card_id),
    constraint customer_x_card_id primary key (customer_id, card_id)
);