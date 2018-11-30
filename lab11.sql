use CSE581labs;

/*
1.	Create a stored procedure. Input for the stored procedure will be Course Id and Student Id. 
The stored procedure will check if the student is enrolled in the class yet.
a)	If the student has already been enrolled, display a message that says “The student is already enrolled”.
b)	If the student has not been enrolled yet, and the course doesn’t have a faculty yet, display a message that says “Cannot enroll until faculty is selected”.
c)	If the student has not been enrolled yet, and the course does have a faculty assigned, then enroll the student in the course and display a message that says “Student enrolled”.

2.	Select from the Enrollment table, to see data prior to execution. 

3.	Run the stored procedure to prove that all 3 cases work. 
*/

select * from CourseEnrollment;
select * from Courses;

exec checkStudent '3', '01-HJPotter';
exec checkStudent '7', '01-HJPotter';
exec checkStudent '1', '01-HJPotter';

select * from courses;
select * from CourseEnrollment

go

DROP PROC checkStudent;

create procedure checkStudent (
									@CourseID as Integer,
									@StudentID as varchar(20))
as
	   declare @currentStudentId integer;
	   	   select @currentStudentId = (select ENROLLMENTId
										from CSE581labs.CourseEnrollment
										where @CourseID = CSE581labs.CourseEnrollment.CourseId and 
										@StudentID = CSE581labs.CourseEnrollment.StudentId);
	   declare @faculty varchar(20);
	   	   select @faculty = (select Facult
								from CSE581labs.Courses c
								where C.CourseId = @CourseID);
	   declare @open integer;
		select @open = (select OpenSeats
								from CSE581labs.Courses 
								where @CourseID = CSE581labs.Courses.CourseId);

	    if @currentStudentId is not NULL 
			begin
				print('The student is already enrolled');
			end;
		
		else if @currentStudentId is null and @faculty is null
			begin
				print('Cannot enroll until faculty is selected');
			end
			
		else if @currentStudentId is null and @faculty is not null
					if @open = 0
					begin
						print('No open seats');
					end
					else
						begin
							insert into CourseEnrollment(CourseId, StudentId)
							values (@CourseID, @StudentID)
							update Courses
								set OpenSeats = @open - 1
								where @CourseID = CourseId;
							print('inserted successfully');
						end

