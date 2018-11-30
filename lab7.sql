use CSE581labs;

/*
1.	Create the following tables

Table Name: Users	 	 
Column Name	Column Type	Notes
NTID	string, max length of 20	Primary Key
FirstName	string, max length of 50	Required
MiddleI	string, max length of 1	Optional
LastName	string, max length of 50	Required
EmailAddress	string, max length of 100	Optional
Password	string, max length of 50	Optional


Table Name: Courses	 	 
Column Name	Column Type	Notes
CourseId	int	Primary Key, auto generated, starts at 1
CourseCode	string, max len of 10	Required
CourseTitle	string, max len of 50	Required
Faculty	string, max len of 20	Optional, references Users
OpenSeats	int	Required

Table: LetterGrades	 	 
Column Name	Column Type	Notes
LetterGradeId	int	Primary Key, auto generated, starts at 1
LetterGrade	string, max len of 2	Required
Description	string, max len of 50	Optional


Table Name: CourseGrade	 	 
Column Name	Column Type	Notes
GradingScaleId	int	Primary Key, auto generated, starts at 1
LetterGradeId	int	Required, references LetterGrades
CourseId	int	Required, references Courses
GradeValue	int	Required, >= 0

Table Name: CourseEnrollment
Column Name	Column Type	Notes
EnrollmentId	int	primary key, auto generated, starts at 1
StudentId	string, max len 20	Required, references Users
CourseId	int	Required, references Courses
FinalGrade	decimal	Optional, >=0, <=100
*/

CREATE TABLE Users (
NTID VARCHAR(20) PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
MiddleI VARCHAR(1),
LastName VARCHAR(50) NOT NULL,
EmailAddress VARCHAR(100),
Password VARCHAR(50)
);

CREATE TABLE Courses (
CourseId INT PRIMARY KEY IDENTITY(1,1),
CourseCode VARCHAR(10) NOT NULL,
CourseTitle VARCHAR(50) NOT NULL,
Facult VARCHAR(20) REFERENCES Users,
OpenSeats INT NOT NULL
);

CREATE TABLE LetterGrades (
LetterGradeID INT PRIMARY KEY IDENTITY(1,1),
LetterGrade VARCHAR(2) NOT NULL,
Description VARCHAR(5)
);


CREATE TABLE CourseGrade (
GradingScaleID INT PRIMARY KEY IDENTITY(1,1),
LetterGradeID INT NOT NULL REFERENCES LetterGrades,
CourseID INT NOT NULL REFERENCES Courses,
GradeValue INT NOT NULL CHECK(GradeValue >= 0)
);

CREATE TABLE CourseEnrollment (
ENROLLMENTId INT PRIMARY KEY IDENTITY(1,1),
StudentId VARCHAR(20) NOT NULL REFERENCES Users,
CourseId INT NOT NULL REFERENCES Courses,
FinalGrade DECIMAL CHECK(FinalGrade >=0 and FinalGrade <=100)
);

SELECT * FROM Users;
SELECT * FROM Courses;
SELECT * FROM LetterGrades;
SELECT * FROM CourseGrade;
SELECT * FROM CourseEnrollment;
