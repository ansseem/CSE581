use CSE581labs;

/*
1.	Create a function which will walk through the Enrollment table and calculate the average grades for each of the students . Provide a screenshot of script execution. The function will take in a student id as a parameter and then calculate that student’s average grade (round to hundredth).

2.	Execute the function. 
*/

select averageStudentGrade('01-HJPotter');

create function averageStudentGrade (@studentId as varchar(20))
returns float 
as
begin
	declare @total int =0
	declare @average float =0
	declare @counter int =0
	declare @current float = 0;

	declare AverageCursor cursor for
		select FinalGrade 
		from dbo.[CourseEnrollment]
		where @studentId = CourseEnrollment.StudentId;

	open AverageCursor;

	fetch next from AverageCursor into @current

	while @@FETCH_STATUS = 0
		begin
		if @current is not null
		begin
			set @total = @total + @current;
			set @counter = @counter + 1;
		end
			fetch next from AverageCursor into @current
		end

	close AverageCursor
	deallocate AverageCursor
	set @average = @total / @counter;
	return @average;
	
end;



		
