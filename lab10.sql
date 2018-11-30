use CSE581labs;

go
CREATE VIEW Question1 (FirstName, LastName, CourseTitle) AS
 select a.FirstName, a.LastName, d.CourseTitle
    from Courses d inner join Users a inner join CourseEnrollment c
	on a.NTID = c.StudentId
	on d.CourseId = c.CourseId;

select * from Question1;

go
create view Question3 as
select a.FirstName as StudentFirstName,
a.LastName, b.CourseTitle, c.FinalGrade, d.FirstName as FacultyFirstName,
d.LastName as FacultyLastName
from Courses b, Users a, CourseEnrollment c, Users d
where b.Facult = d.NTID
and a.NTID = c.StudentId
and b.CourseId = c.CourseId;

select * from Question3;


select * from Question3 
where StudentFirstName = 'Harry';

