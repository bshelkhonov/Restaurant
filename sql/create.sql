create schema if not exists restaurant;

set search_path to restaurant, public;

create table "employee"
(
    id        bigint not null primary key,
    first_nm  varchar(256),
    second_nm varchar(256),
    salary    integer
);

create table if not exists "administrator"
(
    id          serial primary key not null,
    employee_id bigint             not null references "employee" (id)
);

create table if not exists "hall"
(
    id               serial primary key not null,
    hall_nm          VARCHAR(256),
    administrator_id bigint             not null references "administrator" (id)
);

create table if not exists "cook"
(
    id          serial primary key not null,
    employee_id bigint             not null references "employee" (id)
);

create table if not exists "dish"
(
    id      serial primary key not null,
    dish_nm VARCHAR(256)
);

create table if not exists "dish_cook"
(
    cook_id bigint references "cook" (id),
    dish_id bigint references "dish" (id),
    constraint dish_cook_key primary key (cook_id, dish_id)
);

create table if not exists "product"
(
    id         serial primary key not null,
    product_nm VARCHAR(256),
    amount     integer
);

create table if not exists "product_dish"
(
    product_id bigint references "product" (id),
    dish_id    bigint references "dish" (id),
    constraint product_dish_key primary key (product_id, dish_id)
);

create table if not exists "customer"
(
    id       bigint primary key not null,
    first_nm varchar(256),
    last_nm  varchar(256)
);

create table if not exists "customer_card"
(
    id          bigint primary key not null,
    customer_id bigint             not null references "customer" (id),
    dish_id     bigint             not null references "dish" (id)
);