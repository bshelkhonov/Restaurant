-- tables
drop table if exists "employee" cascade;
drop table if exists "administrator" cascade;
drop table if exists "hall" cascade;
drop table if exists "hall_x_administrator" cascade;
drop table if exists "cook" cascade;
drop table if exists "dish" cascade;
drop table if exists "cook_x_dish" cascade;
drop table if exists "product" cascade;
drop table if exists "product_x_dish" cascade;
drop table if exists "customer" cascade;
drop table if exists "card" cascade;
drop table if exists "customer_x_card" cascade;

-- views
drop view if exists "employee_view";
drop view if exists "administrator_view";
drop view if exists "hall_view";
drop view if exists "hall_x_administrator_view";
drop view if exists "cook_view";
drop view if exists "dish_view";
drop view if exists "cook_x_dish_view";
drop view if exists "product_view";
drop view if exists "product_x_dish_view";
drop view if exists "customer_view";
drop view if exists "card_view";
drop view if exists "customer_x_card_view";
drop view if exists "verbose_administrator_view";
drop view if exists "verbose_dish_view";