select sub
from orders o
left join  returns r on o.order = r.order
group by o.category
having count(distinct  r.return ) = 3;