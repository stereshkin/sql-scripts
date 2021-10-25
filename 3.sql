select count(*)
from sales_order so,
 customer c
 where so.customer_id = c.customer_id
 and so.order_date < '01.01.1990'
 and not exists (select so.order_date from sales_order s where s.order_date > '01.01.1990' and s.order_id = so.order_id ) 
