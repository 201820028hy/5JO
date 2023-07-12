/*
	서브쿼리(하위쿼리)
    select 안에서 select 하는 방법
*/

/* 문제: 서울대를 다니는 학생을 찾으세요 */

select
	*
from
	student_mst sm
	left outer join school_mst scm on(scm.school_id = sm.school_id)
where
	scm.school_name like '서울대%';


/* 서울대, 부산대 학생 출력 */
select
	*
from
	student_mst
where
	school_id in (select 
					school_id 
				from 
					school_mst 
				where 
					school_name like '서울대%'
				or	school_name like '부산대%');
                
select
	*
from
	student_mst
where
	school_id in(1,3);
    
/* select 때 마다 계속 비교 */
select
	*,
    (select school_name from school_mst scm where scm.school_id = stm.student_id) as 학교이름
from
	student_mst stm;
    
set profiling = 1;
show profiles;

/* 단순 총원 */
select
	count(*) as 총인원
from
	student_mst;

/* 오른쪽에 총인원이라는 컬럼 생성 */
select
	*,
    (select 
		count(*) 
    from 
		student_mst) as 총인원
from
	student_mst stm;


/* select 하고 각 줄 마다 true인지 비교하고, join까지 하고, 최종적으로 밖에 select까지 함. */
select
	*
from
	student_mst sm
    left outer join(select count(*) as 총원 from student_mst) sc on(1 = 1);
    
select
	*
from
	user_mst;
