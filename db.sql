CREATE DATABASE JobManagement

USE JobManagement
GO

CREATE TABLE Student (
	StudentNo VARCHAR(10) PRIMARY KEY,
	StudentName VARCHAR(10),
	Password VARCHAR(20),
	Gender CHAR(1) CHECK (Gender='M' OR Gender='F'),
	ResumeAmount INT,
	Status VARCHAR(3),
	ACTIVE CHAR(1)
)

GO

CREATE TABLE Resume (
	ResumeNo VARCHAR(10) PRIMARY KEY,
	StudentNo VARCHAR(10) FOREIGN KEY REFERENCES Student(StudentNo),
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
	JobNo VARCHAR(10) PRIMARY KEY,
	JobName VARCHAR(20),
	JobType VARCHAR(10)
)

GO

CREATE TABLE Company (
	CompanyNo VARCHAR(10) PRIMARY KEY,
	CompanyName VARCHAR(10),
	CompanyLocation VARCHAR(10)
)

GO

CREATE TABLE ToEmploy( 
	EmployNo VARCHAR(10) PRIMARY KEY,
    StudentNo VARCHAR(10) FOREIGN KEY REFERENCES Student(StudentNo) ,
    JobNo VARCHAR(10) FOREIGN KEY REFERENCES Job(JobNo), 
    StudentName VARCHAR(20),
    JobName VARCHAR(50),
    CompanyName VARCHAR(50),
	Status VARCHAR(3), 
	ApplyTime TIME,
    ExpectedSalary INT
)

GO

CREATE TABLE Recruitment(
	RecruitmentNo VARCHAR(10) PRIMARY KEY,
    JobNo VARCHAR(10) FOREIGN KEY REFERENCES Job(JobNo),
    CompanyNo VARCHAR(10) FOREIGN KEY REFERENCES Company(CompanyNo),
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
	ManagerNo VARCHAR(10) PRIMARY KEY,
	Password VARCHAR(20)
)
