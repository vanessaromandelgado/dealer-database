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

-- 2. salesperson
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75)
);

-- 3. mechanics
CREATE TABLE mechanics(
	mechanics_id SERIAL PRIMARY KEY,
	first_name VARCHAR(75),
	last_name VARCHAR(75)
);

-- 4. parts
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	FOREIGN KEY(mechanics_id) REFERENCES mechanics(mechanics_id)
);

-- 5. services
CREATE TABLE service(
	service_ticket SERIAL PRIMARY KEY,
	amount NUMERIC (5,2) NOT NULL,
	FOREIGN KEY(mechanics_id) REFERENCES mechanics(mechanics_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- 6. vehicle
CREATE TABLE vehicle(
	VIN SERIAL PRIMARY KEY,
	model VARCHAR(100),
	make VARCHAR(100),
	vehicle_year YEAR,
	FOREIGN KEY(service_ticket) REFERENCES service(service_ticket),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);

-- 7. sales transactions
CREATE TABLE sales_transaction(
	sales_id SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	FOREIGN KEY(VIN) REFERENCES vehicle(VIN),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);	

-- 8. service history
	CREATE TABLE service_history(
	service_history_id SERIAL PRIMARY KEY,
	FOREIGN KEY(VIN) REFERENCES vehicle(VIN)
);