
select dept
from course t
where not exists (
	(select book_isbn
	from text
	where author = 'Rowling')
	minus
	(select book_isbn
	from book_adoption b
	where b.courseNo = t.courseNo)
);



-- select count(*)
-- from(
-- (select courseNo
-- from course
-- where dept = 'ICT')
-- intersect
-- (select courseNo
-- from enroll e, student s
-- where e.regno = s.regno)
-- )
-- group by courseNo;


-- with tab(no) as
-- ((select courseNo
-- from course
-- where dept = 'ICT')
-- intersect
-- (select courseNo
-- from enroll e, student s
-- where e.regno = s.regno)
-- group by courseNo)

-- select name, count

select regno, name, count(*)
from student natural join enroll natural join course
where dept = 'ICT'
group by regno, name;