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
where extract(day from current_date - customer_since) < 1;


insert into employee
values (12, 'Лев', 'Толстой', 500000);

select *
from employee
where salary >= 100000;

update employee
set salary = salary + 5000
where salary <= 95000;

delete
from employee
where salary >= 500000;