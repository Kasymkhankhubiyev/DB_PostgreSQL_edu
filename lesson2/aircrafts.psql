select current_date;

select '2022-06-11'::date;

select 'Jun 11, 2022'::date;

select to_char(current_date, 'dd-mm-yyyy');

select '11:19'::time;

select '11:19:21'::time;

select '11:19 am'::time as AM, '11:19 pm'::time as PM;

select timestamp '2022-06-11 11:22';

select current_timestamp ;

--- timestamp приводит время предустановленное и не приводятся при выводе
-- timestamptz хранятся приведенные в нулевому часовому поясу и приводится к ч.п. пользователя при вызове

select '1 year 2 months ago'::interval;

select 'P0001-02-00T04:00:00'::interval;

select 'P0123-04-13T05:06:17'::interval;

select ('2022-06-11'::timestamp - '2021-06-01'::timestamp)::interval;

---точность временны'х данных

select date_trunc('minute', current_timestamp) ;

select date_trunc('hour', current_timestamp) ;

select date_trunc('day', current_timestamp) ;

---извлекаем определенные элементы

select extract('mon' from current_timestamp);

select extract('year' from timestamp'2022-06-11 11:39:21');

--BOOLEAN 

drop table if exists databases;

create table databases (is_open_source boolean, dbms_name text);

insert into databases (is_open_source, dbms_name)
values 
	(true, 'PostgreSQL'),
	(false, 'Oracle'),
	(true, 'MySQL'),
	(false, 'MS SQL Server');
	
select * from databases;

select * from databases where is_open_source;

select * from databases where not is_open_source;

insert into databases (is_open_source, dbms_name) values('yes', 'SQLite');


---массивы

drop table if exists pilots;

create table pilots(
pilot_name text,
schedule integer[]
);

insert into pilots (pilot_name, schedule)
values
	('Ivan', '{ 1, 3, 5, 6, 7}'::integer[]),
	('Petr', '{ 1, 2, 5, 7}'::integer[]),
	('Pavel', '{ 2, 5}'::integer[]),
	('Boris', '{3, 5, 6}'::integer[]);

select * from pilots;

update pilots  --конкатенация
set schedule = schedule || 7
where pilot_name = 'Boris';

update pilots --добавляем в конец списка методом array_append()
set schedule = array_append(schedule, 6) 
where pilot_name = 'Pavel';

update pilots --добавляем в начало списка методом array_prepend()
set schedule = array_prepend(1, schedule) 
where pilot_name = 'Pavel';

update pilots  --удаляем выбранный элемент не по индексу, а по значению
set schedule = array_remove( schedule, 5)
where pilot_name = 'Ivan';

update pilots 
set schedule[1] = 2, schedule[2] = 3
where pilot_name = 'Petr';

update pilots --через slice
set schedule[1:2] = array[2, 3]
where pilot_name = 'Petr';

select * from pilots;

--основные операции с массивами:

---array_position(array, element) - возвращает индекс первого встречного элемента с указанным значением, иначе null
select * from pilots 
where array_position(schedule, 3) is not null;

select * from pilots  --@> означает проверку, лежит ли правый массив полностью в левом или нет.
where schedule @> '{1, 7}'::integer[];

select * from pilots  --&& - проверяет массивы на наличие пересечений.
where schedule && array[2, 5];

select * from pilots
where not schedule && array[2, 5];


--unnest() - разворачивает массив в отдельные строки
select unnest (schedule) as days_of_week
from pilots 
where pilot_name = 'Ivan';



--типы JSON / JSONB - JavaScript Object Notation
drop table if exists pilots_hobbies;

create table pilots_hobbies(
pilot_name text,
hobbies jsonb
);

insert into pilots_hobbies
values
	('Ivan',
	'{"sports": ["футбол", "плавание"],
		"home_lib": true, "trips": 3
	}'::jsonb
	),
	('Petr',
	'{"sports": ["теннис", "плавание"],
		"home_lib": true, "trips": 2
	}'::jsonb
	),
	('Pavel',
	'{"sports": ["плавание"],
		"home_lib": false, "trips": 4
	}'::jsonb
	),
	('Boris',
	'{"sports": ["футбол", "плавание", "теннис"],
		"home_lib": true, "trips": 0
	}'::jsonb
	);

select * from pilots_hobbies ;

select * from pilots_hobbies 
where hobbies @> '{"sports":["футбол"]}'::jsonb;

select pilot_name, hobbies->'sports' as sports
from pilots_hobbies 
where hobbies->'sports' @> '["футбол"]'::jsonb;


--у нас структуры всех JSON-объектов одинаковые, но не всегда структуры задаются явно и ключи могут быть разными,
--как проверить наличие ключа?

select count(*) from pilots_hobbies 
where hobbies ? 'sport'; --ключа sport нет

select count(*) from pilots_hobbies 
where hobbies ? 'sports';

update pilots_hobbies --полностью заменили массив
set hobbies = hobbies || '{"sports":["хоккей"]}'
where pilot_name = 'Boris';

select pilot_name, hobbies
from pilots_hobbies 
where pilot_name = 'Boris';

--добавление в массив:
update pilots_hobbies 
set hobbies = jsonb_set( hobbies, '{sports, 1}', '"футбол"')
where pilot_name = 'Boris'


----Задания
drop table if exists numeric_table;

create table numeric_table(
numeric_nums numeric(4,2),
description text
);

insert into numeric_table
values
	(4.2, '4.2'),
	(13.4, '13.4'),
	(4.234, '4.234'),
	(23.234, '23.234');

insert into numeric_table
values
	(41.23456, '41.23456');

--4.21

insert into numeric_table values(1234.2, '1234.2'); --число долно округляться

insert into numeric_table values( 123.4, '123.4'); --

select * from numeric_table;
