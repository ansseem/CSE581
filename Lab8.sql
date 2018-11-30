use CSE581labs;

/*
1.	Insert the following data into the tables you created last lab in database CSE581labs. Make sure that the data matches perfectly. 

USERS:
NTID	FirstName	MiddleI	LastName	EmailAddress	Password
01-HJPotter	Harry	J	Potter	hp@hw.edu
Hedwig
02-RBWeasley	Ron	B	Weasley	rw@hw.edu
Scabbers
03-HJGranger	Hermione	J	Granger	hg@hw.edu
Crookshanks
10-Rlupin	Remus	 <NULL>	Lupin	rl@hw.edu
moon
11-Fflitwick	Filius	 <NULL>	Flitwick	ff@hw.edu
 <NULL>
16-Rhagrid	Rubeus	 <NULL>	Hagrid	rh@hw.edu
BuckBeak

COURSES:
CourseID	CourseCode	CourseTitle	Faculty	OpenSeats
1	DADA101	Defence Against the Dark Arts BASIC	10-Rlupin	3
2	DADA201	Defence Against the Dark Arts INTERMEDIATE	10-Rlupin	2
3	DADA301	Defence Against the Dark Arts ADVANCED	10-Rlupin	1
4	CHMS101	Charms BASIC	11-Fflitwick	2
5	CHMS201	Charms INTERMEDIATE	11-Fflitwick	0
6	CHMS301	Charms ADVANCED	11-Fflitwick	4
7	HOM101	History of Magic BASIC	<NULL>	10


NEXT PAGE

LETTER GRADES:
LetterGradeID	LetterGrade	Description
1	O	Outstanding
2	E	Exceeds Expectations
3	A	Acceptable
4	P	Poor
5	D	Dreadful
6	T	Troll

COURSE GRADING:
GradingScaleID	LetterGradeID	CourseID	GradeValue
1	1	1	95
2	2	1	90
3	3	1	80
4	4	1	70
5	5	1	60
6	6	1	0
7	1	2	100
8	2	2	90
9	3	2	85
10	4	2	75
11	5	2	64
12	6	2	0

COURSE ENROLLMENT:
EnrollmentID	StudentId	CourseID	FinalGrade
1	01-HJPotter	1	<NULL>
2	01-HJPotter	4	<NULL>
3	03-HJGranger	1	<NULL>
4	03-HJGranger	4	<NULL>
5	02-RBWeasley	1	<NULL>
6	02-RBWeasley	4	<NULL>

2.	Make the following updates (use UPDATE and DELETE, as needed):

a)	Lupin has been fired. Assign his classes to Hagrid. Remove Lupin from the database.
b)	Harry has received a final grade of 96 in Defence Against the Dark Arts, and 91 in Charms.
c)	Ron has received a final grade of 91 in Defence Against the Dark Arts, and 88 in Charms.
d)	Hermione has received a final grade of 92 in Defence Against the Dark Arts, and 99 in Charms.
e)	Enroll Harry in Intermediate Defence Against the Dark Arts.
f)	Enroll Hermione in Advanced Charms.
*/

insert into Users (NTID, FirstName, MiddleI, LastName, EmailAddress, Password)
VALUES ('01-HJPotter', 'Harry', 'J', 'Potter', 'hp@hw.edu', 'Hedwig'),
	   ('02-RBWeasley', 'Ron', 'B', 'Weasley', 'rw@hw.edu', 'Scabbers'),
	   ('03-HJGranger', 'Hermione', 'J', 'Granger', 'hg@hw.edu', 'Crookshanks'),
	   ('10-RIupin', 'Remus', NULL, 'Lupin', 'rl@hw.edu', 'moon'),
	   ('11-Fflitwick', 'Filius', NULL, 'Flitwick', 'ff@hw.edu', NULL),
	   ('16-Rhagrid', 'Ruebeus', NULL, 'Hagrid', 'rh@hw.edu', 'BuckBeak');

select * from dbo.[Users];

insert into Courses (CourseId, CourseCode, CourseTitle, Facult, OpenSeats)
values (1, 'DADA101', 'Defence Against the Dark Arts BASIC', '10-RIupin', 3),
	   (2, 'DADA201', 'Defence Against the Dark Arts INTERMEDIATE', '10-RIupin', 2),
	   (3, 'DADA301', 'Defence Against the Dark Arts ADVANCED', '10-RIupin', 1),
	   (4, 'CHMS101', 'Charms BASIC', '11-Fflitwick', 2),
	   (5, 'CHMS201', 'Charms INTERMEDIATE', '11-Fflitwick', 0),
	   (6, 'CHMS301', 'Charms ADVANCED', '11-Fflitwick', 4),
	   (7, 'HOM101', 'History of Magic BASIC', NULL, 10);

select * from dbo.[Courses];

insert into LetterGrades (LetterGradeID, LetterGrade, Description)
values (1, 'O', 'Outstanding'),
	   (2, 'E', 'Exceeds Expectations'),
	   (3, 'A', 'Acceptable'),
	   (4, 'P', 'Poor'),
	   (5, 'D', 'Dreadful'),
	   (6, 'T', 'Troll');

select * from dbo.[LetterGrades];

insert into CourseGrade (GradingScaleID, LetterGradeID, CourseID, GradeValue)
values (1, 1, 1, 95),
	   (2, 2, 1, 90),
	   (3, 3, 1, 80),
	   (4, 4, 1, 70),
	   (5, 5, 1, 70),
	   (6, 6, 1, 0),
	   (7, 1, 2, 100),
	   (8, 2, 2, 90),
	   (9, 2, 2, 85),
	   (10, 4, 2, 75),
	   (11, 5, 2, 74),
	   (12, 6, 2, 0);

select * from dbo.[CourseGrade];

insert into CourseEnrollment (ENROLLMENTId, StudentId, CourseId, FinalGrade)
 values (1, '01-HJPotter', 1, NULL),
        (2, '01-HJPotter', 4, NULL),
		(3, '03-HJGranger', 1, NULL),
		(4, '03-HJGranger', 4, NULL),
		(5, '02-RBWeasley', 1, NULL),
		(6, '02-RBWeasley', 4, NULL);

select * from dbo.[CourseEnrollment];

update [Courses]
set 
	Facult='16-Rhagrid'
where
	Facult='10-RIupin'

delete from dbo.[Users]
	where NTID='10-RIupin';

update dbo.[CourseEnrollment]
set 
	FinalGrade=96
where 
	StudentId = '01-HJPotter' AND CourseId = 1;

update dbo.[CourseEnrollment]
set 
	FinalGrade=91
where 
	StudentId = '01-HJPotter' AND CourseId = 4;

update dbo.[CourseEnrollment]
set 
	FinalGrade=91
where 
	StudentId = '02-RBWeasley' AND CourseId = 1;

update dbo.[CourseEnrollment]
set 
	FinalGrade=88
where 
	StudentId = '02-RBWeasley' AND CourseId = 4;

update dbo.[CourseEnrollment]
set 
	FinalGrade=92
where 
	StudentId = '03-HJGranger' AND CourseId = 1;

update dbo.[CourseEnrollment]
set 
	FinalGrade=99
where 
	StudentId = '03-HJGranger' AND CourseId = 4;

insert into CourseEnrollment (ENROLLMENTId, StudentId, CourseId, FinalGrade)
 values (7, '01-HJPotter', 2, NULL),
        (8, '03-HJGranger', 6, NULL);

select * from dbo.[CourseEnrollment];