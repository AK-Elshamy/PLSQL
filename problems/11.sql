-- https://leetcode.com/problems/classes-with-at-least-5-students/

select c.class
  from courses c
 group by c.class
having count(*) >= 5;