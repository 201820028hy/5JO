select * from library.book_mst;

select * from book_mst order by publication_date;

update book_mst
set publication_date = date_format('2010-11-23', '%Y-%m-%d')
where publication_date = '2110-11-23';

select
	*
from
	book_mst
where
	1 = 1 /* 아무런 조건 없을 때도 조회 가능하게 끔*/ 
-- and (
-- 		book_name like '%사용%'
-- 	or	author like '%사용%'
--     or publisher like '%사용%'
--     )
and category = '소설'
order by
	
	#book_name,
    #author,
    #publication_date,
    publication_date desc,
    book_id; /* book_id는 항상 정렬되어있어야 함. */
-- limit 0, 20; /* 인덱스번호, 갯수*/

create view test as
select
	username,
    name
from
	user_mst;
	