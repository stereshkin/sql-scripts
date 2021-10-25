select distinct d.[name], c.city 
from customer c,
department d,
employee e  
where c.salesperson_id = e.employee_id
and e.department_id = d.department_id
and c.[state] = 'TX'