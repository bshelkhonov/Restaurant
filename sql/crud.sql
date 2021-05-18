-- crud

insert into customer
values (11, 'Алла', 'Пугачёва', current_date);

select *
from customer;

update customer
set last_nm = 'Субэкваториальный'
where customer_id = 1;

delete
from customer
where extract(day from current_date - register_dttm) < 1;


insert into employee
values (12, 'Лев', 'Толстой', 500000, '4123424211');

select *
from employee
where salary_amt >= 100000;

update employee
set salary_amt = salary_amt + 5000
where salary_amt <= 95000;

delete
from employee
where salary_amt >= 500000;