select distinct j.[function] 
from employee e, 
	department d,
	 location l, 
	 job j
where l.regional_group = 'DALLAS'
