SELECT * FROM library.book_image;

insert into book_image
value
	(0, '소록-999', '가짜이름1.png', '진짜이름1.png'),
	(0, '소록-999', '가짜이름2.png', '진짜이름2.png'),
	(0, '소록-999', '가짜이름3.png', '진짜이름3.png'),
	(0, '소록-999', '가짜이름4.png', '진짜이름4.png');
    
select
	*

from
	book_mst bm
    left outer join book_image bi on(bi.book_code = bm.book_code)
where
	book_code = '소록-999';