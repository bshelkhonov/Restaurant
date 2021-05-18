insert into employee (employee_id, first_nm, last_nm, salary)
values (1, 'Булат', 'Шелхонов', 120000),
       (2, 'Николай', 'Кудрявцев', 148800),
       (3, 'Дерек', 'Шовин', 91100),
       (4, 'Энтони', 'Кидис', 50000),
       (5, 'Кирк', 'Хэмметт', 62000),
       (6, 'Юрий', 'Хованский', 34000),
       (7, 'Клава', 'Кока', 75000),
       (8, 'Алишер', 'Моргенштерн', 43122),
       (9, 'Райли', 'Рид', 78000),
       (10, 'Канье', 'Уэст', 59000),
       (11, 'Ким', 'Кардашьян', 59000);

insert into administrator (administrator_id, employee_id)
values (1, 1),
       (2, 3),
       (3, 8),
       (4, 11),
       (5, 6);

insert into hall (hall_id, hall_nm, tables_cnt)
values (1, 'VIP', 30),
       (2, 'Париж', 100),
       (3, 'Лондон', 70),
       (4, 'Берлин', 70),
       (5, 'Барселона', 80),
       (6, 'Амстердам', 90);

insert into hall_administrator (hall_id, administrator_id)
values (1, 1),
       (2, 1),
       (2, 2),
       (3, 4),
       (4, 5),
       (5, 4),
       (6, 3);


insert into cook (cook_id, employee_id)
values (1, 2),
       (2, 5),
       (3, 4),
       (4, 6),
       (5, 7),
       (6, 9);

insert into dish (dish_id, dish_nm)
values (1, 'Борщ'),
       (2, 'Яичница'),
       (3, 'Чизкейк'),
       (4, 'Латте'),
       (5, 'Пицца'),
       (6, 'Круассан'),
       (7, 'Фузилли с креветками'),
       (8, 'Паста карбонара');

insert into cook_dish (cook_id, dish_id)
values (1, 1),
       (1, 4),
       (2, 4),
       (2, 2),
       (3, 3),
       (4, 5),
       (4, 6),
       (4, 7),
       (5, 8),
       (6, 8),
       (6, 1),
       (6, 2),
       (6, 4);

insert into product (product_id, product_nm, amount)
values (1, 'Свёкла', 100),
       (2, 'Сливочный сыр', 50),
       (3, 'Яйцо куриное', 200),
       (4, 'Соль', 40),
       (5, 'Кофейные зёрна', 10),
       (6, 'Молоко', 100),
       (7, 'Мука', 120),
       (8, 'Масло сливочное', 15),
       (9, 'Макароны', 30),
       (10, 'Креветки', 20),
       (11, 'Бекон', 110);

insert into product_dish (product_id, dish_id)
values (1, 1),
       (2, 3),
       (3, 2),
       (4, 1),
       (4, 2),
       (4, 3),
       (5, 4),
       (6, 3),
       (6, 4),
       (7, 3),
       (8, 3),
       (9, 7),
       (9, 8),
       (10, 7),
       (11, 8),
       (11, 2);

insert into customer (customer_id, first_nm, last_nm, customer_since)
values (1, 'Алексей', 'Овальный', TO_TIMESTAMP('5 12 2010 12', 'MM-DD-YYYY HH')),
       (2, 'Евгений', 'Понасенков', TO_TIMESTAMP('4 4 2015 12', 'MM-DD-YYYY HH')),
       (3, 'Александр', 'Халяпов', TO_TIMESTAMP('2 12 2017 12', 'MM-DD-YYYY HH')),
       (4, 'Надежда', 'Меркурьева', TO_TIMESTAMP('3 10 2014 12', 'MM-DD-YYYY HH')),
       (5, 'Илья', 'Мэддисон', TO_TIMESTAMP('5 6 2013 12', 'MM-DD-YYYY HH')),
       (6, 'Барак', 'Обама', TO_TIMESTAMP('7 26 2019 12', 'MM-DD-YYYY HH')),
       (7, 'Дмитрий', 'Гордон', TO_TIMESTAMP('9 17 2016 12', 'MM-DD-YYYY HH')),
       (8, 'Тейлор', 'Свифт', TO_TIMESTAMP('11 1 2016 12', 'MM-DD-YYYY HH')),
       (9, 'Пётр', 'Первый', TO_TIMESTAMP('1 14 2017 12', 'MM-DD-YYYY HH')),
       (10, 'Наполеон', 'Бонапарт', TO_TIMESTAMP('2 2 2018 12', 'MM-DD-YYYY HH'));

insert into customer_card(customer_card_id, customer_id, dish_id, bonuses)
values (1, 1, 1, 2500),
       (2, 2, 1, 1456),
       (3, 3, 2, 3421),
       (4, 4, 2, 12),
       (5, 5, 3, 213),
       (6, 6, 3, 422),
       (7, 7, 4, 908),
       (8, 8, 4, 532),
       (9, 9, 5, 563),
       (10, 10, 7, 2051);

