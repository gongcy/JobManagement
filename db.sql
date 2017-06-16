CREATE DATABASE JobManagement

USE JobManagement
GO

CREATE TABLE Student (
	StudentId INT PRIMARY KEY,
	StudentName VARCHAR(10),
	Password VARCHAR(20),
	Gender CHAR(1) CHECK (Gender='M' OR Gender='F'),
	ResumeAmount INT,
	Status VARCHAR(3),
	ACTIVE CHAR(1)
)

GO

CREATE TABLE Resume (
	ResumeId INT PRIMARY KEY,
	StudentId INT FOREIGN KEY REFERENCES Student(StudentId),
	ResumeName VARCHAR(10),
	Gender CHAR(1) CHECK (Gender='M' OR Gender='F'),
	Age INT,
	PicPath VARCHAR(100),
	Education VARCHAR(20),
	Phone VARCHAR(20),
	Email VARCHAR(30),
	Skills VARCHAR(500),
	ExpectedJob VARCHAR(30)
)

GO

CREATE TABLE Job (
	JobId INT PRIMARY KEY,
	JobName VARCHAR(20),
	JobType VARBINARY(10)
)

GO

CREATE TABLE Company (
	CompanyId INT PRIMARY KEY,
	CompanyName VARCHAR(10),
	CompanyLocation VARCHAR(10)
)

GO

CREATE TABLE ToEmploy( 
    StudentId INT FOREIGN KEY REFERENCES Student(StudentID) ,
    JobId INT FOREIGN KEY REFERENCES Job(JobID), 
    StudentName VARCHAR(20),
    JobName VARCHAR(50),
    CompanyName VARCHAR(50),
	Status VARCHAR(3), 
	ApplyTime TIME,
    ExpectedSalary INT
)

GO

CREATE TABLE Recruitment(
    JobID int FOREIGN KEY REFERENCES Job(JobID),
    CompanyID int FOREIGN KEY REFERENCES Company(CompanyID),
    JobName varchar(50),
	JobDescription VARCHAR(500),
    CompanyName varchar(50),
    RecruitingAmout int,
    SkillRequired varchar(50),
	DeadLine TIME,
	Type CHAR(1),
    Salary INT
)

GO

CREATE TABLE Manager  (
	ManagerID INT PRIMARY KEY,
	Password VARCHAR(20)
)
