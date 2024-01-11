use AWA

CREATE or replace TABLE owners 
(id int identity PRIMARY KEY,
first_name VARCHAR(20),  
last_name VARCHAR(20));

CREATE or replace TABLE vehicles 
(id int identity PRIMARY KEY,
make VARCHAR(20), 
model VARCHAR(20),  
year INTEGER, 
price REAL, 
owner_id INTEGER REFERENCES owners (id));

INSERT INTO owners (first_name, last_name) VALUES ('Bob', 'Hope');
INSERT INTO owners (first_name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Melody', 'Jones');
INSERT INTO owners (first_name, last_name) VALUES ('Sarah', 'Palmer');
INSERT INTO owners (first_name, last_name) VALUES ('Alex', 'Miller');
INSERT INTO owners (first_name, last_name) VALUES ('Shana', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Maya', 'Malarkin');


INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Corolla', 2002, 2999.99, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2012, 12999.99, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 2016, 23999.99, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Subaru', 'Legacy', 2006, 5999.99, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Ford', 'F150', 2012, 2599.99, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2016, 12999.99, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2014, 22999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Avalon', 2009, 12999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Camry', 2013, 12999.99, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2001, 7999.99, 5);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 1999, 1899.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Lexus', 'ES350', 1998, 1599.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '300', 2012, 22999.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '700', 2015, 52999.99, 6);



select * from owners;
select * from vehicles;

select * from owners as o
full join vehicles as v
on o.id=v.owner_id;
describe table vehicles;

-- •	Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles.
select o.first_name, o.last_name, count(v.id) as count_of_vehicles from owners as o
inner join vehicles as v
on o.id=v.owner_id
group by 1,2
order by 3;

-- •	Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles.

select o.first_name, o.last_name, cast(avg(v.price) as integer) as avgprice, count(v.id) from owners as o
inner join vehicles as v
on o.id=v.owner_id
group by 1,2
order by 3 desc;