-- DDL clauses for data definintion language
-- SQL create table statements
/* primary key's relationship - 
 * - to foreign keys determines order
 * remembering to create a table:
 * related foreign key must be create first
 * 1. customer
 * 2. salesperson
 * 3. mechanics
 * 4. parts
 * 5. services
 * 6. vehicle
 * 7. sales transactions
 * 8. service history
 */
-- create statements syntax:
-- CREATE TABLE table_name(
-- column1 datatype constraint,
-- );
/* constraints:
 * serial: each int increase in seriel number reflects single row/record addition
 * not null: column cannot have a null values
 * primary key: combination of not null and unique
 * 				uniquely identifies each row in a table
 * foreign key: ensures links between tables can't be broken
 */

 -- 1. customer
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75)
);
-- verify customer table 
select * from customer

-- 2. salesperson
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75)
);
-- verify salesperson table
select * from salesperson

-- 3. mechanics
CREATE TABLE mechanics(
	mechanics_id SERIAL PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75)
);
-- verify mechanics table
select * from mechanics

-- 4. parts
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	mechanics_id INT NOT NULL,
	FOREIGN KEY(mechanics_id) REFERENCES mechanics(mechanics_id)
);
-- verify parts table
select * from parts

-- 5. service
CREATE TABLE service(
	service_ticket SERIAL PRIMARY KEY,
	amount NUMERIC(10,2),
	mechanics_id INT NOT NULL,
	FOREIGN KEY(mechanics_id) REFERENCES mechanics(mechanics_id),
	customer_id INT NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- verify service
select * from service

-- 6. vehicle
-- NUM instead of INT sets memory limit
CREATE TABLE vehicle(
	VIN NUMERIC(17,0) PRIMARY KEY,
	model VARCHAR(100),
	make VARCHAR(100),
	vehicle_year NUMERIC(4,0),
	service_ticket INT NOT NULL,
	FOREIGN KEY(service_ticket) REFERENCES service(service_ticket),
	customer_id INT NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INT NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);
-- VERIFY VEHICLE
select * from VEHICLE

-- 7. sales transactions
CREATE TABLE sales_transaction(
	sales_id SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	VIN INT NOT NULL,
	FOREIGN KEY(VIN) REFERENCES vehicle(VIN),
	salesperson_id INT NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);	
-- VERIFY SALES
select * from sales_transaction

-- 8. service history
	CREATE TABLE service_history(
	service_history_id SERIAL PRIMARY KEY,
	VIN INT NOT NULL,
	FOREIGN KEY(VIN) REFERENCES vehicle(VIN)
);
-- VERIFY SERVICE
select * from service_history

-- DML clauses for data manipulation language
-- SQL insert commands

-- Insert for customer table
INSERT INTO customer(
	customer_id,
	first_name,
	last_name
) VALUES(
	1,
	'Vanessa',
	'Kalscheur'
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name
) VALUES(
	2,
	'Vanessa',
	'Roman Delgado'
);

-- verify insert 
select * from customer

-- Insert for SALESPERSON table
insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) VALUES(
	0001,
	'Austin',
	'Powers'
);

insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) VALUES(
	0002,
	'Vanessa',
	'Williams'
);
--verify salespersons
select * from salesperson

-- insert into mechanics
insert into mechanics(
	mechanics_id,
	first_name,
	last_name
) Values(0001, 'Bob', 'The Builder'), (0002,'Rob', 'The Builder');
-- verify mechanics
select * from mechanics

-- insert into parts 
insert into parts(
	parts_id,
	mechanics_id
)Values(
	0000000000000000000000001,
	0001	
);
insert into parts(
	parts_id,
	mechanics_id
)Values(
	0000000000000000000000002,
	0002	
);
-- verify parts
select * from parts

--insert into service
insert into service(
	service_ticket,
	amount,
	mechanics_id,
	customer_id
) Values(00000001, 259.99, 0002, 2), (00000002, 465.89, 0001, 1);
-- verify service
select * from service

-- insert into vehicles
insert into vehicle(
	VIN,
	model,
	make,
	vehicle_year,
	service_ticket,
	customer_id,
	salesperson_id
)Values(12345678912345678, 'chevy', 'cobalt', 2010, 00000001, 1, 0001), (12345678998765432, 'honda', 'crv', 2003, 0002, 2, 0002);
-- verify vehicles

select * from vehicle
-- in the future use INT, num lesson learned for year

-- insert into sales transactions'CREATE TABLE sales_transaction(
insert into sales_transaction(
	sales_id,
	amount,
	VIN,
	salesperson_id
)VALUES(
	1,
	5000,
	12345678912345678,
	0001
);

-- ran into difficulty here, need to revise insert statements for sales transaction and service history
-- VERIFY SALES
SELECT * FROM sales_transaction
-- insert into service history
insert into sales_transaction(
	service_history_id,
	VIN
)VALUES(
	1,
	5000,
	12345678912345678
);