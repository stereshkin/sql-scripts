select distinct  t1.customer_id, t1.product_id, t1.order_date
from

(select so.customer_id, product_id, order_date, i.order_id
		 from sales_order so, item i
			where so.order_id=i.order_id) t1,

(select so.customer_id, product_id, order_date, i.order_id
		 from sales_order so, item i
			where so.order_id=i.order_id) t2

where t1.customer_id=t2.customer_id
and	  t1.product_id=t2.product_id
and   abs(datediff(day, t1.order_date, t2.order_date))<7
and   t1.order_id<>t2.order_id

order by t1.customer_id