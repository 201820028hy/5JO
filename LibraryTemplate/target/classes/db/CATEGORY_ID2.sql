SELECT * FROM test;

create view category_view as

select
	row_number() over(order by category) as category_id,
    category
from
	book_mst
group by
	category;
    
drop view test;

select
	*
from
	category_view
where
	category_id < 5;