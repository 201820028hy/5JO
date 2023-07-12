SELECT * FROM library.book_like;

select
	*
from
	book_mst bm
    left outer join book_like bl on(bl.book_id = bm.book_id and bl.user_id = 2);
    
insert into book_like
values(0, 4, 1);