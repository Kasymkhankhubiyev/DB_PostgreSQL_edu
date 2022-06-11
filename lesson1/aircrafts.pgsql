drop table if exists aircrafts;

create table aircrafts(
aircraft_code char(3) primary key not null, 
model text not null,
range_ integer not null,
check( range_ > 0)
);

insert into aircrafts(aircraft_code, model, range_)
values 
	('SU9', 'Sukhoi SuperJet-100', 3000),
	('773', 'Boeing 777-300', 11100),
	('763', 'Boeing 767-300', 7900),
	('733', 'Boeing 737-300', 4200),
	('320', 'Airbus A320-200', 5700),
	('321', 'Airbus A321-200', 5600),
	('319', 'Airbus A319-200', 6700),
	('CN1', 'Cessna 208 Caravan', 1200),
	('CR2', 'Bombardier CRJ-200', 2700);

select * from aircrafts;

drop table if exists seats;

create table seats(
aircraft_code char(3) not null,
seat_no varchar(4) not null,
fare_conditions varchar(10) not null,
check( fare_conditions in ('Economy', 'Comfort', 'Business')),
primary key (aircraft_code, seat_no),
foreign key (aircraft_code) references aircrafts(aircraft_code) on delete cascade
);

insert into seats values
	('SU9', '1A', 'Business'), ('SU9', '1B', 'Business'), ('SU9', '10A', 'Economy'), ('SU9', '10B', 'Economy'), ('SU9', '10F', 'Economy'),
	('SU9', '10E', 'Economy'), ('SU9', '10G', 'Economy'),
	('773', '1A', 'Business'), ('773', '1B', 'Business'), ('773', '10A', 'Economy'), ('773', '10B', 'Economy'), ('773', '10F', 'Economy'),
	('773', '10E', 'Economy'), ('773', '10G', 'Economy'),
	('763', '1A', 'Business'), ('763', '1B', 'Business'), ('763', '10A', 'Economy'), ('763', '10B', 'Economy'), ('763', '10F', 'Economy'),
	('763', '10E', 'Economy'), ('763', '10G', 'Economy'),
	('733', '1A', 'Business'), ('733', '1B', 'Business'), ('733', '10A', 'Economy'), ('733', '10B', 'Economy'), ('733', '10F', 'Economy'),
	('733', '10E', 'Economy'), ('733', '10G', 'Economy'),
	('320', '1A', 'Business'), ('320', '1B', 'Business'), ('320', '10A', 'Economy'), ('320', '10B', 'Economy'),	('320', '10F', 'Economy'),
	('320', '10E', 'Economy'), ('320', '10G', 'Economy'),
	('321', '1A', 'Business'), ('321', '1B', 'Business'), ('321', '10A', 'Economy'), ('321', '10B', 'Economy'),	('321', '10F', 'Economy'),
	('321', '10E', 'Economy'), ('321', '10G', 'Economy'),
	('319', '1A', 'Business'), ('319', '1B', 'Business'), ('319', '10A', 'Economy'), ('319', '10B', 'Economy'),	('319', '10F', 'Economy'),
	('319', '10E', 'Economy'), ('319', '10G', 'Economy'),
	('CN1', '1A', 'Business'), ('CN1', '1B', 'Business'), ('CN1', '10A', 'Economy'), ('CN1', '10B', 'Economy'),	('CN1', '10F', 'Economy'),
	('CN1', '10E', 'Economy'), ('CN1', '10G', 'Economy'),
	('CR2', '1A', 'Business'), ('CR2', '1B', 'Business'), ('CR2', '10A', 'Economy'), ('CR2', '10B', 'Economy'),	('CR2', '10F', 'Economy'),
	('CR2', '10E', 'Economy'), ('CR2', '10G', 'Economy');


select * from seats;

select aircraft_code, count(*)
from seats
group by aircraft_code
order by aircraft_code;

select aircraft_code,fare_conditions, count(*)
from seats
group by aircraft_code, fare_conditions
order by aircraft_code, fare_conditions;

select * from aircrafts;

update aircrafts set range_ =range_ *2 where model = 'Sukhoi SuperJet-100'
