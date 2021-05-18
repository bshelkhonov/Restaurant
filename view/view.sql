-- employee
create view employee_view as
select employee_id,
       first_nm,
       last_nm,
       salary_amt,
       case when passport_value is not null then substr(passport_value, 0, 3) || '********' end as passport_value
from employee;

select *
from employee_view;

-- administrator
create view administrator_view as
select *
from administrator;

select *
from administrator_view;

-- hall
create view hall_view as
select hall_id,
       hall_nm,
       tables_cnt,
       case when tables_cnt = 0 then 'currently unavailable' else 'available' end as status
from hall;

select *
from hall_view;

-- hall_administrator
create view hall_x_administrator_view as
select *
from hall_x_administrator;

select *
from hall_x_administrator;

-- cook
create view cook_view as
select c.cook_id, e.employee_id, first_nm, last_nm
from cook c
         inner join employee e on c.employee_id = e.employee_id;

select *
from cook_view;

-- dish
create view dish_view as
select *
from dish;

-- cook_x_dish
create view cook_x_dish_view as
select *
from cook_x_dish;

-- product
create view product_view as
select product_id,
       product_nm,
       supply_amt,
       case when supply_amt = 0 then 'run out' when supply_amt < 100 then 'running low' else 'enough' end as status
from product;

select *
from product_view;

-- product_x_dish
create view product_x_dish_view as
select *
from product_x_dish;

-- customer
create view customer_view as
select *
from customer;

select *
from customer_view;

-- card
create view card_view as
select *
from card;

select *
from card_view;

-- customer_x_card
create view customer_x_card_view as
select *
from customer_x_card;

select *
from customer_x_card_view;

-- complex view
create view verbose_administrator_view as
select a.administrator_id, e.employee_id, first_nm, last_nm, string_agg(hall_nm, ', ') as halls
from administrator a
         inner join employee e on e.employee_id = a.employee_id
         inner join hall_x_administrator ha on a.administrator_id = ha.administrator_id
         inner join hall h on ha.hall_id = h.hall_id
group by a.administrator_id, e.employee_id, first_nm, last_nm;

select *
from verbose_administrator_view;

-- complex view
create view verbose_dish_view as
select dish.dish_id,
       dish_nm,
       string_agg(distinct p.product_nm, ', ')                   as ingridients,
       string_agg(distinct e.first_nm || ' ' || e.last_nm, ', ') as cooks
from dish
         inner join cook_x_dish cxd on dish.dish_id = cxd.dish_id
         inner join product_x_dish pxd on dish.dish_id = pxd.dish_id
         inner join cook c on cxd.cook_id = c.cook_id
         inner join employee e on c.employee_id = e.employee_id
         inner join product p on pxd.product_id = p.product_id
group by dish.dish_id, dish_nm;

select *
from verbose_dish_view;
