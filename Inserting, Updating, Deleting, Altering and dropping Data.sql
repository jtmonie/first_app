/* Before we begin today's cless, 
I would like us to drop the following details in the comment section 
1. full name
2. complexion
3. weight,
4. height
5. state of origin
6. age (optional)
*/

########## Create database ############
# SYNTAX
# CREATE DATABASE databasename;

create database if not exists datalab;
create database datalab;
/* query is not executed as 'datalab' database already exists 
'IF NOT EXISTS' returns a warning instead */

CREATE DATABASE if not exists Read_And_Write;
CREATE DATABASE dl_interns;

create database sakila;
CREATE DATABASE if not exists sakila;

#to tell the sever the database to use
USE Read_And_Write;

## Create table
# SYNTAX
# CREATE TABLE table_name (
 -- column1 datatype,
 -- column2 datatype,
 -- column3 datatype,
 -- );
 
create table students(
id int,
fname varchar(20),
lname varchar(25),
phone varchar(100) unique
);

select * from students;
desc students;

create table features( 
complexion char(15), 
weight float (22), 
height float (23), 
age int, 
s_origin varchar(67) 
);

select * from features;
desc features;


############ Insert into tables ############
insert into students(id,fname, lname, phone)
values(1,"Dan","Aderinto", "08023775867"),
(2,"Agbo", "James", "07032319391"),
(3,"Jonah", "Ogbada", "08063524398"),
(4,"Esther","Odili", "07064110944"),
(5, "Jim", "Omajawu", "08063328146");


insert into features(complexion, weight, height, age, s_origin)
values ("brown", 76, 5.71, 37, "Oyo"),
("brown", 78, 5.71, 29, "Kogi"),
("fair", 66, 5.80, 25, "Benue"),
("brown", 75, 5.70, 37, "Abia"),
("brown", 75, 5.70, 37, "Benue");

select * from features;
select * from students;


CREATE TABLE Test_Table (
ID_test INT NOT NULL,
First_Name VARCHAR(100) NOT NULL,
Last_Name VARCHAR(100) NOT NULL,
s_origin VARCHAR(100) NOT NULL
);

desc test_table;
SELECT * FROM Test_Table;

-- Note that the 'Test_Table' does not accept null values
INSERT INTO Test_Table (ID_test, First_Name, Last_Name, s_origin) 
VALUES (1, 'Oyeleke', 'Olayemi', 'Ogun'),
(2, 'Comfort', 'Godwin', null);

-- inserting correctly 
INSERT INTO Test_Table (ID_test, First_Name, Last_Name, s_origin) 
VALUES (1, 'Oyeleke', 'Olayemi', 'Ogun'),
(2, 'Comfort', 'Godwin' , 'Benue');

-- insert more data to the 'students' table
INSERT INTO students(id, fname, lname, phone)
values(6, 'Godwin', 'Ejeh', '07032230650');

select * from students;

SELECT * FROM Test_Table;

##### Class Fun - Create Person Table ###########
#Create a table called “persons”
#Create two fields in the table: First Name, and Last Name
#Each field should be the data type VARCHAR with 255 bytes
#Insert Your Name into the table
#Select your name from the table

create table persons (
first_name varchar(255),
last_name varchar (255)
);
 
insert into persons values ('Comfort', 'Godwin');

select * from persons; 

-- concatenate first and last name
select first_name from persons;
select last_name from persons;
SELECT concat(first_name, '_', last_name) as full_name from persons;


# Creating more Tables
CREATE TABLE customer (
    id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(2),
    zip_code VARCHAR(10)
);

CREATE TABLE drink_order (
	id INTEGER, 
	customer_id INTEGER,
	drink_description VARCHAR(100)
);

insert into customer values (1, 'Michael', 'Weston', '123 Brickel', 'Miami', 'FL', '33123');

insert into drink_order values 
(1, 1234, 'Scotch'),
(2, 8859, 'Wine'),
(3, 5454, 'Beer'),
(4, 7233, 'Spirit');

select * from drink_order;

select * from customer;

-- insert more values to customer table
insert into customer values 
(2, 'John', 'Thompson', '123 Brickel', 'Miami', 'FL', '1234'),
(3, 'Glory', 'Abutu', '123 Brickel', 'Massachusetts', 'BS', '8859');

-- get all records from customer table
select * from customer;


################ Update Records in Database ###############
select * from customer
where first_name = 'John';

-- update record in a table
UPDATE customer
SET last_name = 'Tom' WHERE first_name = 'John';

select * from customer;

#Alas! -- Error Code: 1175. You are using safe update 
#mode and you tried to update a table without a WHERE that uses a KEY column 
#To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- update Glory to Gloria
SELECT first_name, last_name FROM customer
WHERE first_name = 'Glory' and last_name = 'Abutu';


UPDATE customer
SET first_name = 'Gloria' 
WHERE first_name = 'Glory';

select * from customer;

################### Deleting Records from Database ##################
select * from drink_order;
select * from drink_order where drink_description = 'Spirit';

-- delete record with id = 4
delete from drink_order where id = 4;

select * from drink_order;

-- delete record whose drink_description ends with r
delete from drink_order where drink_description like '%r';

select * from drink_order;

-- get all record from students
select * from students;

-- delete record from students where the last_name contains 'j'
delete from students where lname like '%j%';

select * from students;

-- Use another database
use classicmodels;

select count(*) from offices; 

select * from offices;

## create a new table from existing table 
CREATE TABLE sub_offices as (select city, addressLine1, country from offices);

select * from sub_offices;

select * from orders;

-- get all tables in database
show tables;

-- select customers who have never placed an order 
-- from table created in previous class
select * from Non_order;

-- Create table of customer who never made a payment
select * from payments;
select * from customers;

select * from customers
where customerNumber not in (select customerNumber from payments);

create table neverpaid as (select * from customers
where customerNumber not in (select customerNumber from payments));

select * from neverpaid;

/* compare customers who never placed an order (Non_order table)
with customers who never made a payment before */

select * from Non_order where customerNumber not in 
(select customerNumber from neverpaid);

############### Deleting Tables from the Database ###########

-- tell sql we want to use Read_and_Write database 
use Read_And_Write;

-- drop drink_order table
drop table drink_order;
drop table Test_Table;
show tables;

drop database sakila;

drop table if exists Non_orders;

-- The SQL DELETE Query is used to delete the 
-- existing records from a table.
-- You can use the WHERE clause with a DELETE 
-- query to delete the selected rows,
-- otherwise all the records would be deleted

-- DELETE FROM table_name
-- WHERE [condition];

select * from customer;

insert into customer values 
(4, 'Gift', 'Beke', '123 Brickel', 'Massachusetts', 'BS', '8859'),
(5, 'Phillip', 'Sampson', '123 Brickel', 'Massachusetts', 'BS', '8859'),
(6, 'Glo', 'With Pride', '123 Brickel', 'Massachusetts', 'BS', '8859'),
(7, 'Gee', 'Alpha', '123 Brickel', 'Massachusetts', 'BS', '8859'),
(8, 'Rit', 'Terna', '123 Brickel', 'Miami', 'FL', '8859');

# delete a range of values
delete from customer
where id between 4 and 8;

select * from customer;


# The ALTER TABLE command is used to add, delete or modify columns in an existing table. 
# You can also use the ALTER TABLE command to add and drop various constraints on an existing table.

##### to add new columns
#ALTER TABLE table_name ADD column_name datatype;

use datalab;

show tables;

select * from interns;

-- add column salary
ALTER TABLE interns add column salary varchar(250) not null;

select * from interns;

-- update salary for al interns to 50,000
update interns
set salary = 50000
where id between "sage101" and  "sage107";

select * from interns;

-- update salary of a single intern
update interns
set salary = 65000
where id = "sage101";

select * from interns;

###  Drop columns
#ALTER TABLE table_name DROP COLUMN column_name;
alter table interns drop column salary;

select * from interns;

### to modify columns datatype
#ALTER TABLE table_name MODIFY COLUMN column_name datatype;
desc interns;
ALTER TABLE interns MODIFY COLUMN last_name varchar(500);

desc interns;

ALTER TABLE interns add column salary varchar(250);

desc interns;
select * from interns;
## to add a Not Null constraints
#ALTER TABLE table_name MODIFY column_name datatype;
alter table interns modify state_of_origin varchar(100) not null;

desc interns;

### ADD PRIMARY KEY constraint
# ALTER TABLE table_name 
# ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (column1, column2...);

use Read_And_Write;
show tables;

-- Add primary key to students table
select * from students;
desc students;
select * from customer;

ALTER TABLE students add primary key (id);
desc students;

--  add primary key to test_test table
desc customer;
ALTER TABLE customer add primary key (id);
desc customer;

-- The SQL TRUNCATE TABLE command is used to delete all data from an existing table
-- but not the table itself.

select * from students;

CREATE TABLE STUDENTS as (select * from students);

--  select everything from the new table students
select * from STUDENTS;

truncate TABLE STUDENTS;

desc STUDENTS;
/* the structure of the table remains */

select * from STUDENTS;
/* but no data in the table */

### Export data
use realparsmodel;
show tables;

-- On the result grid, select export(left icon), select format, save
select * from courses;



### Import data
use newdb;
select * from bank_additional;
select distinct (job) from bank_additional;

				   
# NOTE: the export icon wont be visible if prvious select statement does 
-- not have a primary key
# To import data,
-- On the result grid, select import(right icon), navigate filepath to file
-- check 'create new table', check 'drop table if exists', click next



## HOME - FUN
-- use datalab database
-- Import facebook ads data
-- set a primary key for the table
-- gruop the data by xyz_campaign
-- - find the most expensive campaign
-- - find the most successful campaign by conversion 
-- which campaign do women like the most
-- find the age range with most impression for each company (xyz_campaign)

