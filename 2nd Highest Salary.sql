select * from employee
select * from department

select max(salary) from employee where salary < (select max(salary) from employee)

----Using Subquery to retrieve 2nd highest salary------
select * from employee where salary < ( select max(salary) from employee)
order by salary desc limit 1

----Using Subquery to retrieve 2nd highest salary------
select firstname, max(salary) from employee where salary < ( select max(salary) from employee)
group by firstname,salary
order by salary desc limit 1

--------Query to retrive nth highest salary limit 1 offset (n-1) ----------
Select e.firstname, e.lastname, e.salary, e.datehired, d.departmentname
from Employee as e
inner join Department as d
on e.departmentid = d.departmentid
order by salary Desc limit 1 offset 2



-------Inner join Employee and Departmnent table------
select e.employeeid, e.firstname, e.lastname, d.departmentname,e.salary, e.datehired 
from employee as e
inner join department as d
on e.departmentid = d.departmentid

-----Using Window Fn/ Query to retrieve 2nd highest salary -----
select * from 
(select e.firstname, e.lastname, d.departmentname, e.salary, dense_rank() over (order by salary desc) as rn
from employee as e
inner join department as d
on e.departmentid = d.departmentid) as Rank
where rn = 2;

----using CTE Query to retrieve 2nd highest salary---
with RankedSalary as
(Select e.firstname, e.lastname, e.salary, d.departmentname, dense_rank () over (order by salary desc) as rn
from employee as e
inner join department as d
on e.departmentid = d.departmentid)

select * from RankedSalary where rn = 2

---------Department wise 2nd highest paid employees------------
select * from 
(select e.firstname, e.lastname, d.departmentname, e.salary, dense_rank() over (partition by departmentname order by salary desc) as rn
from employee as e
inner join department as d
on e.departmentid = d.departmentid) as Rank
where rn = 2;

----using CTE Department wise 2nd highest paid employees---
with RankedSalary as
(Select e.firstname, e.lastname, e.salary, d.departmentname, dense_rank () over (partition by departmentname order by salary desc) as rn
from employee as e
inner join department as d
on e.departmentid = d.departmentid)

insert into Employee values (10,'Aadil', 'Reyaz',2,58000,'2025-05-10'),
                             (11,'Eve', 'Davis',3,90000,'2021-02-25')

------Query to retrive duplicate records-----
select firstname,lastname,salary, count(*) from Employee 
Group by firstname,lastname,salary
having count(*)>1

select salary from employee
order by salary desc limit 5

select * from employee

select * from employee where DATE_PART('year', datehired) = 2019

----Running total of salaries by department-----
select * from 
(select e.firstname, e.lastname, d.departmentname, e.salary, sum(salary) over (partition by departmentname order by salary desc) as Running_Total
from employee as e
inner join department as d
on e.departmentid = d.departmentid)


