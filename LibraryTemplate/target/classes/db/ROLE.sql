SELECT * FROM library.role_mst;

insert into role_mst
values 
	(0, 'ROLE_USER', now(), now()),
    (0, 'ROLE_ADMIN', now(), now());