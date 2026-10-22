-- https://leetcode.com/problems/employees-earning-more-than-their-managers

select e.name as "Employee"
  from employee e
 inner join employee m
on e.managerid = m.id
 where e.salary > m.salary
 order by e.salary desc,
          e.name asc;