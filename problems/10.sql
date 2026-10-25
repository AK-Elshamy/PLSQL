-- https://leetcode.com/problems/big-countries/
select w.name,
       w.population,
       w.area
  from world w
 where w.area >= 3000000
    or population >= 25000000;