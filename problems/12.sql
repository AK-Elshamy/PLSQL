-- https://leetcode.com/problems/sales-person/

select s.name
  from salesperson s
 where not exists (
   select 1
     from orders o
    inner join company c
   on o.com_id = c.com_id
    where s.sales_id = o.sales_id
      and c.name = "RED"
);