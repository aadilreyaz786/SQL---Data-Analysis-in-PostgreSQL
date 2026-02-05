Select * from Employee;
select * from Department;

-------Inner join Employee and Departmnent table------
Select e.firstname, e.lastname, e.salary, e.datehired, d.departmentname
from Employee as e
inner join Department as d
on e.departmentid = d.departmentid

--------Query to retrive nth highest salary limit 1 offset (n-1) ----------
Select e.firstname, e.lastname, e.salary, e.datehired, d.departmentname
from Employee as e
inner join Department as d
on e.departmentid = d.departmentid
order by salary Desc limit 1 offset 2

---------Department wise top 2 highest paid employees------------
Select * from
(Select e.firstname, e.lastname, e.salary, e.datehired, d.departmentname, dense_rank() over (partition by departmentname order by salary desc) as rn 
from Employee as e
inner join Department as d
on e.departmentid = d.departmentid) 
where rn <=2;

---------Using CTE Department wise top 2 highest paid employees------------
with RankedSalaries as
(Select e.firstname, e.lastname, e.salary, e.datehired, d.departmentname, dense_rank() over (partition by departmentname order by salary desc) as rn 
from Employee as e
inner join Department as d
on e.departmentid = d.departmentid)

select * from RankedSalaries


Select * from Department;
Select * from Employee;

insert into Employee values (10,'Aadil', 'Reyaz',2,58000,'2025-05-10'),
                             (11,'Eve', 'Davis',3,90000,'2021-02-25')
							 
------Query to retrive duplicate records-----
select firstname,lastname,salary, count(*) from Employee 
Group by firstname,lastname,salary
having count(*)>1
                             