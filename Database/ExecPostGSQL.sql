USE PostGSQL;

--1.a).1: insert gucian 
EXEC StudentRegister 'Hamza', 'Youssef', 'hamza+12', 'Pharmacy', 1, 'hamza.youssef@gmail.com', 'Tagamoo', 'Masters'

--show results
SELECT *
FROM PostGradUser

SELECT *
FROM GucianStudent

--1.a).1: insert nongucian
EXEC StudentRegister 'Omar', 'Moataz', 'omar123', 'Engineering', 0, 'omar.moataz@gnmail.com', 'Tagamoo', 'Masters'

-- show results
SELECT *
FROM PostGradUser

SELECT *
FROM NonGucianStudent

--1.a).2: insert supervisor
EXEC SupervisorRegister 'Yasmine', 'Ahmed', 'yasmine=11', 'Applied Arts', 'yasmine.ahmed@gmail.com', 'Rehab'

-- show results
SELECT *
FROM PostGradUser

SELECT *
FROM Supervisor

--2.a): valid login
DECLARE @successBit BIT
EXEC userLogin '20', 'radwa$11', @successBit OUTPUT
PRINT @successBit

--2.a): invalid login
DECLARE @successBit BIT
EXEC userLogin '21', 'radwa$11', @successBit OUTPUT
PRINT @successBit

--2.b): insert phone gucian
EXEC addMobile '5', '+201005628393'

-- show results
SELECT *
FROM GUCStudentPhoneNumber

--2.b): insert phone nongucian
EXEC addMobile '12', '+201003451346'

-- show results
SELECT *
FROM NonGUCStudentPhoneNumber

--3.a):
EXEC AdminListSup

--3.b): valid
EXEC AdminViewSupervisorProfile '21'

--3.b): invalid
EXEC AdminViewSupervisorProfile '28'

--3.c):
EXEC AdminViewAllTheses

--3.d):
DECLARE @count INT
SET @count = dbo.AdminViewOnGoingTheses()
PRINT @count

--3.e):
EXEC AdminViewStudentThesisBySupervisor

--3.f): valid
EXEC AdminListNonGucianCourse '2'

--3.f): invalid
EXEC AdminListNonGucianCourse '8'

--3.g): valid
EXEC AdminUpdateExtension '2'

-- show results
SELECT *
FROM Thesis

--3.g): invalid
EXEC AdminUpdateExtension '20'

-- show results
SELECT *
FROM Thesis

-- register the new student to the unused thesis
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(23, 19, 16)

-- 3.h):
DECLARE @successBit BIT
EXEC AdminIssueThesisPayment '16', '80000', '2', '0', @successBit OUTPUT
PRINT @successBit

-- update the dates of thesis after registration
UPDATE Thesis
SET startDate = '30/12/2021', endDate = '31/12/2023' 
WHERE serialNumber = 16;

-- show results
SELECT *
FROM Thesis

--3.i): valid
EXEC AdminViewStudentProfile '3'

--3.i): invalid
EXEC AdminViewStudentProfile '18'

--3.j):
EXEC AdminIssueInstallPayment '21', '10/1/2022'

-- show results
SELECT *
FROM Installment
ORDER BY paymentID

--3.k):
EXEC AdminListAcceptPublication

--3.l).1: 
EXEC AddCourse 'CSEN605', '4', '4000'

-- show results
SELECT *
FROM Course

--3.l).2:
EXEC linkCourseStudent '5', '11'

-- show results
SELECT *
FROM NonGucianStudentTakeCourse

--3.l).3: valid
EXEC addStudentCourseGrade '5', '11', '92.3'

-- show results
SELECT *
FROM NonGucianStudentTakeCourse

--3.l).3: 2 invalid cases
EXEC addStudentCourseGrade '7', '11', '92'

EXEC addStudentCourseGrade '5', '8', '92'

--3.m): valid
EXEC ViewExamSubDefense '1/9/2020'

--3.m): invalid
EXEC ViewExamSubDefense '1/12/2020'

-- show results
SELECT *
FROM GUCianProgressReport

SELECT *
FROM NonGUCianProgressReport


--4.a): invalid 'eval > 3'
EXEC EvaluateProgressReport '18', '1', '1', '5'

--4.a): valid
EXEC EvaluateProgressReport '18', '9', '4', '0'

--4.a): valid
EXEC EvaluateProgressReport '18', '1', '1', '3'

--4.a): invalid
EXEC EvaluateProgressReport '18', '1', '9', '3'

--4.b): valid
EXEC ViewSupStudentsYear '18'

--4.b): invalid
EXEC ViewSupStudentsYear '12'

--4.c).1: valid
EXEC SupViewProfile '18'

--4.c).1: invalid
EXEC SupViewProfile '12'

--4.c).2: valid
EXEC UpdateSupProfile '18', 'Salem Omar', 'Engineering/CS'

--4.c).2: invalid
EXEC UpdateSupProfile '12', 'Salem omar', 'Engineering'

--4.d): valid
EXEC ViewAStudentPublications '1'

--4.d): empty
EXEC ViewAStudentPublications '13'

--4.e).1: valid
EXEC AddDefenseGucian '16', '20/12/2023', 'H13'

-- show results
SELECT *
FROM Thesis

SELECT *
FROM Defense

-- 4.e).2: valid
EXEC AddDefenseNonGucian '7', '10/10/2023', 'H12'

-- show results
SELECT *
FROM Thesis

SELECT *
FROM Defense

--4.f): valid
EXEC AddExaminer '6', '21/2/2022', 'Hany Ahmed', '1', 'Maths'

-- show results
SELECT *
FROM ExaminerEvaluateDefense

-- 4.g): invalid
EXEC CancelThesis '1'

-- 4.g): valid
EXEC CancelThesis '9'

-- show results
SELECT *
FROM Thesis

--4.h): valid
EXEC AddGrade '6', '95'

--4.h): invalid
EXEC AddGrade '50', '95'

-- show results
SELECT *
FROM Thesis

--5.a): valid
EXEC AddDefenseGrade '6', '21/2/2022', '80'

--5.a): invalid
EXEC AddDefenseGrade '6', '21/2/2021', '80'

-- show results
SELECT *
FROM Defense

--5.b): valid
EXEC AddCommentsGrade '6', '21/2/2022', 'Great!'

--5.b): invalid
EXEC AddCommentsGrade '10', '21/2/2022', 'Great!'

-- show results
SELECT *
FROM ExaminerEvaluateDefense

--6.a): valid
EXEC viewMyProfile '6'

--6.a): invalid
EXEC viewMyProfile '20'

--6.b): valid, Only change password
EXEC editMyProfile '15', 'Marina', 'Mina', 'marina##123', 'marina.mina@gmail.com', 'Zatoon', 'Masters'

-- show results
SELECT *
FROM PostGradUser

--6.c): valid
EXEC addUndergradID '6', '49-0831'

--6.c): invalid
EXEC addUndergradID '20', '49-12312'

-- show results
SELECT *
FROM GucianStudent

--6.d): valid
EXEC ViewCoursesGrades '11'

--6.d): invalid
EXEC ViewCoursesGrades '30'

--6.e).1: valid
EXEC ViewCoursePaymentsInstall '12'

--6.e).2: valid
EXEC ViewThesisPaymentsInstall '6'

--6.e).3: valid
EXEC ViewUpcomingInstallments '7'

--6.e).4: valid
EXEC ViewMissedInstallments '13'

--6.f).1: valid
EXEC AddProgressReport '12', '1/12/2021'

-- show results
SELECT *
FROM GUCianProgressReport

--6.f).2: valid
EXEC FillProgressReport '12', '7', '50', 'Half way through!'

-- show results
SELECT *
FROM GUCianProgressReport

--6.g):
EXEC ViewEvalProgressReport '15', '4'

--6.g):
EXEC ViewEvalProgressReport '9', '4'

--6.h): valid
EXEC addPublication 'Data Structures Applications', '18/7/2018', 'Machine learning', 'H3', '0'

--6.i): valid
EXEC linkPubThesis '6', '1'

-- show results
SELECT *
FROM Publication

SELECT *
FROM ThesisHasPublication