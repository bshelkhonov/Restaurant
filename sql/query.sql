-- блюда, в состав которых входят продукты, остаток (amount) которых меньше 50
select distinct dish_nm
from dish
         inner join product_x_dish
                    on dish.dish_id = product_x_dish.dish_id
where product_x_dish.product_id in
      (select product_id from product where supply_amt < 100);

-- средняя зарплата поваров, которые умеют готовить >= 3 блюд
select avg(salary_amt)
from employee e
         inner join cook c on e.employee_id = c.employee_id
where c.cook_id in (
    select cook_id from cook_x_dish group by cook_id having count(dish_id) >= 3
);

-- минимальная зарплата администраторов по залам
select h.hall_nm, min(salary_amt)
from employee e
         inner join administrator a on e.employee_id = a.employee_id
         inner join hall_x_administrator ha on a.administrator_id = ha.administrator_id
         inner join hall h on h.hall_id = ha.hall_id
group by h.hall_id
order by min(salary_amt);

-- для каждого блюда найдём количество карт с данным любимым блюдом
select dish_nm, count(card.card_id)
from dish
         inner join card on dish.dish_id = card.dish_id
group by dish.dish_id;

-- среднее количество бонусов у клиентов для каждого блюда, которое является любимым хотя бы у 2х клиентов.
-- при подсчёте среднего нужно учитывать только клиентов, которые добавились в базу менее 2х лет назад
select dish_nm, avg(bonuses_amt)
from (
         select dish.dish_id, dish_nm
         from dish
                  inner join card on dish.dish_id = card.dish_id
         group by dish.dish_id, dish_nm
         having count(card.card_id) >= 2
     ) A
         inner join card on A.dish_id = card.dish_id
         inner join customer_x_card cc on cc.card_id = card.card_id
         inner join customer c on cc.card_id = c.customer_id
where extract(year from current_date - register_dttm) < 2
group by A.dish_id, dish_nm;