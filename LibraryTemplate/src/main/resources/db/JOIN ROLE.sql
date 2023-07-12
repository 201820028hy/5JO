SELECT * FROM library.user_mst;
SELECT * FROM library.role_dtl;

insert into user_mst
values(0, "aaa", "1234", "aaa", "aaa@gmail.com", now(), now());

insert into role_dtl
values(0, 1, 2, now(), now());

select
	*
from
	user_mst um
    left outer join role_dtl rd on(rd.user_id = um.user_id)
    left outer join role_mst rm on(rm.role_id = rd.role_id)
where
um.username = 'aaa';