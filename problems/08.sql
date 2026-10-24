-- https://leetcode.com/problems/find-customer-referee/

select c.name
  from customer c
 where c.referee_id is null
    or c.referee_id != 2;