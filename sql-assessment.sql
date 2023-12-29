# Question 1

create database assesmentdata;

use assesmentdata;
create table worker(
worker_id int,
first_name varchar(30),
last_name varchar(30),
salary int,
joining_date datetime,
department varchar(30));

use assesmentdata;
insert into worker (worker_id,first_name,last_name,salary,joining_date,department)
values ( 1 , 'Monika' , 'Arora' , 100000 , '2014-02-20 9:00:00' , "HR"),
	   ( 2 , 'Niharika' , 'Verma' , 8000 , '2014-06-11 9:00:00' , "Admin"),
       ( 3 , 'Vishal' , 'Singhal' , 30000 , '2014-02-20 9:00:00' , "HR"),
       ( 4 , 'Amitabh' , 'Singh' , 50000 , '2014-02-20 9:00:00' , "Admin"),
       ( 5 , 'Vivek' , 'Bhati' , 50000 , '2014-06-11 9:00:00' , "Admin"),
       ( 6 , 'Vipul' , 'Diwan' , 20000 , '2014-06-11 9:00:00' , "Account"),
       ( 7 , 'Satish' , 'Kumar' , 75000 , '2014-01-20 9:00:00' , "Account"),
       ( 8 , 'Geetika' , 'Chauhan' , 90000 , '2014-04-11 9:00:00' , "Admin");
       
select *
from worker;

# 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select *
from worker
order by first_name , department desc;

# 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.

select *
from worker
where first_name in("Vipul" , "Satish");

# 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 

select *
from worker
where first_name like "%h" and length(first_name) = 6;

# 4. Write an SQL query to print details of the Workers whose SALARY lies between 0 and 80000. 

select *
from worker
where salary between 0 and 80000;

# 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 

select distinct*
from worker;
# no duplicate data found

# 6. Write an SQL query to show the top 6 records of a table.

select *
from worker
order by salary
limit 6;
# top 6 according to salary.

# 7. Write an SQL query to fetch the departments that have less than 3 people in them. 

select department , count(department)
from worker
group by department
having count(department) < 3;

# 8. Write an SQL query to show all departments along with the number of people in there. 

select department , count(*) as "head_count_per_department"
from worker
group by department;

# 9. Write an SQL query to print the name of employees having the highest salary in each department. 

select first_name , department , max(salary)
from worker
group by department , first_name
order by max(salary) desc
limit 3;

select department , first_name , salary
from worker
where (department , salary ) in (
select department , max(salary) 
from worker 
group by department );

# Question 2: Open school database, then select student table and use following SQL statements. 
# TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT  

create database school;

use school;

create table student( 
std_id int,
std_name varchar(30),
sex varchar(30),
percentage int ,
class int , 
sec varchar(30),
stream varchar(30),
dob date);

insert into student (std_id,std_name,sex,percentage,class, sec,stream,dob)
values (1001,"Surekha Joshi","Female",82,12,"A","Science","1998-03-8"),
       (1002,"Maahi Agarwal","Female",56,11,"C","Commerce","2003-11-23"),
       (1003,"Sanam Verma","male",59,11,"C","Commerce","2006-06-29"),
       (1004,"Ronit Kumar","male",63,11,"C","Commerce","1997-11-05"),
       (1005,"Dipesh Pulkit","male",78,11,"B","Science","2003-09-14"),
       (1006,"Jahanvi Puri","Female",60,11,"B","Commerce","2008-07-11"),
       (1007,"Sanam Kumar","male",23,12,"F","Commerce","1998-03-8"),
       (1008,"Sahil Saras","male",56,11,"C","Commerce","2008-11-07"),
       (1009,"Akshra Agarwal","Female",72,12,"B","Commerce","1996-10-6"),
       (1010,"Stuti Mishra","Female",39,11,"F","Science","2008-11-23"),
       (1011,"Harsh Agarwal","male",42,11,"C","Science","1998-03-8"),
       (1012,"Nikunj Agarwal","male",49,12,"C","Commerce","1998-06-28"),
       (1013,"Akriti Saxena","Female",89,12,"A","Science","2008-11-23"),
       (1014,"Tani Rastogi","Female",82,12,"A","Science","2008-11-23");
       
# 1 To display all the records form STUDENT table.  

select *
from student;

# 2. To display any name and date of birth from the table STUDENT.

select std_name , dob
from student;

# 3. To display all students record where percentage is greater or equal to 80 FROM student table. 

select *
from student
where percentage >= 80;

# 4. To display student name, stream and percentage where percentage of student is more than 80.                                           

select std_name , stream , percentage
from student
where percentage >= 80;

# 5. To display all records of science students whose percentage is more than 75 form student table.                                  

select *
from student
where percentage > 75 and stream = 'science';
