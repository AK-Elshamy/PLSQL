-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

SELECT 
o.customer_number  
FROM orders o
GROUP BY o.customer_number
order by COUNT(*) desc
limit 1;