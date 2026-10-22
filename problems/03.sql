-- https://leetcode.com/problems/customers-who-never-order
select c.name as "Customers"
  from customers c
  left outer join orders o
on c.id = o.customerid
 where o.customerid is null;