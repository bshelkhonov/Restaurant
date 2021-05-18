create schema if not exists restaurant;

set search_path to restaurant, public;

create table "employee"
(
    employee_id bigint not null primary key,
    first_nm    varchar(256),
    last_nm     varchar(256),
    salary      integer,
    passport    varchar(256)
);

create table if not exists "administrator"
(
    administrator_id serial primary key not null,
    employee_id      bigint             not null references "employee" (employee_id)
);

create table if not exists "hall"
(
    hall_id    serial primary key not null,
    hall_nm    varchar(256),
    tables_cnt integer
);

create table if not exists "hall_administrator"
(
    hall_id          bigint not null references "hall" (hall_id),
    administrator_id bigint not null references "administrator" (administrator_id),
    constraint hall_administrator_key primary key (hall_id, administrator_id)
);

create table if not exists "cook"
(
    cook_id     serial primary key not null,
    employee_id bigint             not null references "employee" (employee_id)
);

create table if not exists "dish"
(
    dish_id serial primary key not null,
    dish_nm varchar(256)
);

create table if not exists "cook_dish"
(
    cook_id bigint references "cook" (cook_id),
    dish_id bigint references "dish" (dish_id),
    constraint dish_cook_key primary key (cook_id, dish_id)
);

create table if not exists "product"
(
    product_id serial primary key not null,
    product_nm varchar(256),
    amount     integer
);

create table if not exists "product_dish"
(
    product_id bigint references "product" (product_id),
    dish_id    bigint references "dish" (dish_id),
    constraint product_dish_key primary key (product_id, dish_id)
);

create table if not exists "customer"
(
    customer_id    bigint primary key not null,
    first_nm       varchar(256),
    last_nm        varchar(256),
    customer_since timestamp          not null default now()
);

create table if not exists "customer_card"
(
    customer_card_id bigint primary key not null,
    customer_id      bigint             not null references "customer" (customer_id),
    dish_id          bigint             not null references "dish" (dish_id),
    bonuses          integer            not null default 0
);