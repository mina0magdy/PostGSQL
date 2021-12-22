USE PostGSQL;

GO

--1.a).1: Register a student to the webiste
CREATE PROC StudentRegister
	@first_name VARCHAR(20),
	@last_name VARCHAR(20),
	@password VARCHAR(20),
	@faculty VARCHAR(20),
	@Gucian BIT,
	@email VARCHAR(50),
	@address VARCHAR(50),
	@type VARCHAR(10)
	AS
	INSERT INTO PostGradUser(email, password)
	VALUES(@email, @password)
	DECLARE @lastID INT
	SET @lastID = SCOPE_IDENTITY()
	IF (@Gucian = 0)
	BEGIN
		INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address)
		VALUES(@lastID ,@first_name, @last_name, @type, @faculty, @address)
	END
	ELSE
	BEGIN
		INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address)
		VALUES(@lastID, @first_name, @last_name, @type, @faculty, @address)
	END

GO

--1.a).2: Register a supervisor to the website
CREATE PROC SupervisorRegister
	@first_name VARCHAR(20),
	@last_name VARCHAR(20),
	@password VARCHAR(20),
	@faculty VARCHAR(20),
	@email VARCHAR(50),
	@address VARCHAR(10)
	AS
	INSERT INTO PostGradUser(email, password)
	VALUES(@email, @password)
	DECLARE @lastID INT
	SET @lastID = SCOPE_IDENTITY()
	INSERT INTO Supervisor(id, name, faculty)
	VALUES(@lastID, @first_name + ' ' + @last_name, @faculty)

GO

--2.a): login the user to the website
CREATE PROC userLogin
	@ID INT,
	@password VARCHAR(20),
	@successBit BIT OUTPUT
	AS
	IF(EXISTS(SELECT *
		FROM PostGradUser U
		WHERE U.id = @ID AND U.password = @password))
	BEGIN
		SET @successBit = 1
	END
	ELSE
	BEGIN
		SET @successBit = 0
	END

GO

--2.b): add mobile number to a student
CREATE PROC addMobile
	@ID INT,
	@mobile_number VARCHAR(20)
	AS
	IF(EXISTS(SELECT *
		FROM NonGucianStudent N
		WHERE N.id = @ID))
	BEGIN
		INSERT INTO NonGUCStudentPhoneNumber VALUES(@id, @mobile_number)
	END
	IF(EXISTS(SELECT *
		FROM GucianStudent G
		where G.id = @ID))
	BEGIN
		INSERT INTO GUCStudentPhoneNumber VALUES (@id, @mobile_number)
	END

GO

--3.a): List all supervisors in the system
CREATE PROC AdminListSup
	AS
	SELECT *
	FROM Supervisor

GO

--3.b): View a supervisor profile
CREATE PROC AdminViewSupervisorProfile
	@supId INT
	AS
	SELECT *
	FROM Supervisor S
	WHERE S.id = @supId

GO

--3.c): List all theses in the system
CREATE PROC AdminViewAllTheses
	AS
	SELECT *
	FROM Thesis

GO

--3.d): Get the number of ongoing theses
CREATE FUNCTION AdminViewOnGoingTheses()
	RETURNS INT
	AS 
	BEGIN
	DECLARE @thesisNumber INT
	SELECT @thesisNumber = COUNT(*)
	FROM Thesis
	WHERE endDate > CURRENT_TIMESTAMP
	RETURN @thesisNumber
	END

GO

--3.e): List supervisors names supervising students currently doing their theses specifying the title of the thesis and the student's name
CREATE PROC AdminViewStudentThesisBySupervisor
	AS 
	(SELECT Su.name AS 'Supervisor Name' , TH.title AS 'Thesis Title', (ST.firstName + ' '  +  ST.lastName) AS 'Student Name'
	FROM GUCianStudentRegisterThesis GSRT
	INNER JOIN Supervisor Su ON Su.id = GSRT.supid 
	INNER JOIN Thesis TH ON TH.serialNumber = GSRT.serial_no 
	INNER JOIN GucianStudent ST ON ST.id = GSRT.sid
	WHERE TH.endDate > CURRENT_TIMESTAMP
	) 
	UNION
	(SELECT Su.name AS 'Supervisor Name', TH.title AS 'Thesis Title', (ST.firstName + ' '  +  ST.lastName) AS 'Student Name'
	FROM NonGUCianStudentRegisterThesis NGSRT
	INNER JOIN Supervisor Su ON su.id = NGSRT.supid 
	INNER JOIN Thesis TH ON TH.serialNumber = NGSRT.serial_no 
	INNER JOIN NonGucianStudent ST on ST.id = NGSRT.sid
	WHERE TH.endDate > CURRENT_TIMESTAMP
	)

GO

--3.f): List students' names taking a specific course and their respective grade
CREATE PROC AdminListNonGucianCourse
	@courseID INT 
	AS
	SELECT (ST.firstname + ' ' + ST.lastname) AS 'Student Name', C.code AS 'Course Code', NGSTC.grade AS 'Grade'
	FROM NonGucianStudentTakeCourse NGSTC
	INNER JOIN NonGucianStudent St on St.id = NGSTC.sid
	INNER JOIN Course C ON C.id = NGSTC.cid
	WHERE @courseID = C.id

GO

--3.g): Increment the number of extensions by 1 for a specific thesis
CREATE PROC AdminUpdateExtension
	@ThesisSerialNo INT
	AS
	UPDATE Thesis
	SET noExtension = noExtension + 1
	WHERE serialNumber = @ThesisSerialNo

GO
--3.h): Create a payment for a specific thesis and link it to that thesis
CREATE PROC AdminIssueThesisPayment
	@ThesisSerialNo INT, 
	@amount DECIMAL(18,2), 
	@noOfInstallments INT, 
	@fundPercentage DECIMAL(18,2),
	@Success BIT OUTPUT
	AS
	IF(EXISTS(SELECT *
		FROM Thesis
		WHERE serialNumber = @ThesisSerialNo))
	BEGIN
		INSERT INTO Payment VALUES(@amount, @noOfInstallments, @fundPercentage)
		DECLARE @lastID INT
		SET @lastID = SCOPE_IDENTITY()
		UPDATE Thesis
		SET payment_id = @lastID
		WHERE serialNumber = @ThesisSerialNo
		SET @Success = 1
	END
	ELSE
	BEGIN
		SET @Success = 0
	END

GO

--3.i): View the profile of a student specifying his/her id
CREATE PROC AdminViewStudentProfile
	@sid INT
	AS
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @sid))
	BEGIN
		SELECT *
		FROM GucianStudent
		WHERE id = @sid
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @sid))
	BEGIN
		SELECT *
		FROM NonGucianStudent
		WHERE id = @sid
	END

GO

--3.j): Create installments for a payment every 6 months starting from a given start date
CREATE PROC AdminIssueInstallPayment
	@paymentID INT,
	@InstallStartDate DATE
	AS
	DECLARE @counter INT
	DECLARE @noOfInstallments INT
	DECLARE @totalAmount DECIMAL(18,2)
	SET @counter = 0
	SELECT @noOfInstallments = no_Installments, @totalAmount = amount
	FROM Payment
	WHERE id = @paymentID
	WHILE(@counter < @noOfInstallments)
	BEGIN
		INSERT INTO Installment VALUES(DATEADD(month, @counter * 6, @InstallStartDate), @paymentID, @totalAmount / @noOfInstallments, 0)
		SET @counter = @counter + 1
	END

GO

--3.k): List all publications' titles in the system with its corresponding thesis title
CREATE PROC AdminListAcceptPublication
	AS
	SELECT TH.title AS 'Thesis Title', P.title AS 'Publication Title'
	FROM Thesis TH 
	INNER JOIN ThesisHasPublication THP ON TH.serialNumber = THP.serialNo 
	INNER JOIN Publication P ON THP.pubid = P.id
	WHERE P.accepted = 1
	GROUP BY TH.title, P.title

GO

--3.l).1: Add a new course to the system
CREATE PROC AddCourse
	@courseCode VARCHAR(10),
	@creditHrs INT,
	@fees DECIMAL(18,2)
	AS
	INSERT INTO Course(fees,creditHours,code)
	VALUES(@fees,@creditHrs,@courseCode)

GO

--3.l).2: Link a non gucian student to a course
CREATE PROC linkCourseStudent
	@courseID INT,
	@studentID INT
	AS
	INSERT INTO NonGucianStudentTakeCourse(sid, cid)
	VALUES(@studentID,@courseID)

GO

--3.l).3: Add a grade for a non gucian student in a specific course
CREATE PROC addStudentCourseGrade
	@courseID INT,
	@studentID INT,
	@grade DECIMAL(18,2)
	AS
	UPDATE NonGucianStudentTakeCourse
	SET grade = @grade
	WHERE sid = @studentID AND cid = @courseID

GO

--3.m): List examiners' names and supervisors' names attending a defense on a specific date
CREATE PROC ViewExamSubDefense
	@defenseDate DATETIME
	AS
	(SELECT e.name AS 'Examiner Name', s.name AS 'Supervisor Name'
	FROM ExaminerEvaluateDefense evd 
	INNER JOIN Examiner e ON evd.examinerId = e.id
	INNER JOIN GUCianStudentRegisterThesis gsr ON evd.serialNo = gsr.serial_no
	INNER JOIN Supervisor s ON gsr.supid = s.id
	WHERE evd.date = @defenseDate
	)
	UNION
	(SELECT e.name AS 'Examiner Name', s.name AS 'Supervisor Name'
	FROM ExaminerEvaluateDefense evd 
	INNER JOIN Examiner e ON evd.examinerId = e.id
	INNER JOIN NonGUCianStudentRegisterThesis ngsr ON evd.serialNo = ngsr.serial_No 
	INNER JOIN Supervisor s ON ngsr.supid = s.id
	WHERE evd.date = @defenseDate
	)

GO

--4.a): Evaluate a progress report given the report number and the corresponding thesis serial number
CREATE PROC EvaluateProgressReport
	@supervisorID INT,
	@thesisSerialNo INT,
	@progressReportNo INT,
	@evaluation INT
	AS 
	IF(@evaluation >= 0 AND  @evaluation <= 3)
	BEGIN
		DECLARE @sid INT
		IF(EXISTS(SELECT * 
			FROM GUCianStudentRegisterThesis
			WHERE serial_no = @thesisSerialNo))
		BEGIN
			SELECT @sid = sid
			FROM GUCianStudentRegisterThesis
			WHERE serial_no = @thesisSerialNo
			UPDATE GUCianProgressReport
			SET eval = @evaluation
			WHERE thesisSerialNumber = @thesisSerialNo AND supid = @supervisorID  AND no = @progressReportNo AND @sid = sid
		END
		IF(EXISTS(SELECT *
			FROM NonGUCianStudentRegisterThesis
			WHERE serial_no = @thesisSerialNo))
		BEGIN
			SELECT @sid = sid
			FROM NonGUCianStudentRegisterThesis
			WHERE serial_no = @thesisSerialNo
			UPDATE NonGUCianProgressReport
			SET eval = @evaluation
			WHERE thesisSerialNumber = @thesisSerialNo AND supid = @supervisorID AND no = @progressReportNo AND @sid = sid
		END
	END
	ELSE
	BEGIN
		RAISERROR(N'GRADE SHOULD BE FROM 0 TO 3 ',16,1)
	END

GO

--4.b): View students and years spent on their thesis for every supervisor
CREATE PROC ViewSupStudentsYear
	@supervisorID INT
	AS
	(SELECT (s.firstName + ' ' + s.lastName) AS 'Student Name', th.years AS 'Thesis Years'
	FROM GUCianStudentRegisterThesis gsr
	INNER JOIN GucianStudent s ON gsr.sid = s.id
	INNER JOIN Thesis th ON th.serialNumber = gsr.serial_No
	WHERE gsr.supid = @supervisorID
	)
	UNION
	(SELECT (s.firstName + ' ' + s.lastName) AS 'Student Name', th.years AS 'Thesis Years'
	fROM NonGUCianStudentRegisterThesis ngsr
	INNER JOIN NonGucianStudent s ON ngsr.sid = s.id
	INNER JOIN Thesis th ON th.serialNumber = ngsr.serial_No
	WHERE ngsr.supid = @supervisorID
	)

GO

--4.c).1: View the profile of a supervisor given her/her id
CREATE PROC SupViewProfile
	@supervisorID INT
	AS
	SELECT *
	FROM Supervisor
	WHERE id = @supervisorID

GO

--4.c).2: Update the profile of a supervisor
CREATE PROC UpdateSupProfile
	@supervisorID INT,
	@name VARCHAR(20),
	@faculty VARCHAR(20)
	AS
	UPDATE Supervisor
	SET name = @name, faculty = @faculty
	WHERE id = @supervisorID

GO

--4.d): List publications of a specific student
CREATE PROC ViewAStudentPublications 
	@StudentID INT
	AS
	IF(EXISTS(SELECT *
		FROM GUCianStudent
		WHERE id = @StudentID))
	BEGIN
		SELECT P.*
		FROM GUCianStudent GS
		INNER JOIN GUCianStudentRegisterThesis GSRT ON GS.id = GSRT.sid
		INNER JOIN ThesisHasPublication THP ON GSRT.serial_no = THP.serialNo
		INNER JOIN Publication P ON P.id = THP.pubid
		WHERE GS.id = @StudentID
	END
	ELSE
	BEGIN
		SELECT P.*
		FROM NonGUCianStudent NGS
		INNER JOIN NonGUCianStudentRegisterThesis NGSRT ON NGS.id = NGSRT.sid
		INNER JOIN ThesisHasPublication THP ON NGSRT.serial_no = THP.serialNo
		INNER JOIN Publication P ON P.id = THP.pubid
		WHERE NGS.id = @StudentID
	END

GO

--4.e).1: Create a defense for a gucian student and link it to the thesis
CREATE PROC AddDefenseGucian
	@ThesisSerialNo INT, 
	@DefenseDate DATETIME, 
	@DefenseLocation VARCHAR(15)
	AS
	INSERT INTO Defense(serialNumber, date, location)
	VALUES(@ThesisSerialNo, @DefenseDate, @DefenseLocation)
	UPDATE Thesis
	SET defenseDate = @DefenseDate
	WHERE serialNumber = @ThesisSerialNo

GO

--4.e).2: Create a defense for a gucian student and link it to the thesis, the student should get more than 50% in all courses to be able to create a defense
CREATE PROC AddDefenseNonGucian
	@ThesisSerialNo INT, 
	@DefenseDate DATETIME, 
	@DefenseLocation VARCHAR(15)
	AS
	IF(50 < ALL(SELECT ngts.grade
		FROM NonGUCianStudentRegisterThesis ngrt
		INNER JOIN NonGucianStudentTakeCourse ngts ON ngrt.sid = ngts.sid
		WHERE ngrt.serial_no = @ThesisSerialNo))
	BEGIN
		INSERT INTO Defense(serialNumber, date, location)
		VALUES(@ThesisSerialNo, @DefenseDate, @DefenseLocation)
		UPDATE Thesis
		SET defenseDate = @DefenseDate
		WHERE serialNumber = @ThesisSerialNo
	END

GO

--4.f): Create an examiner and add him/her to attend a defense
CREATE PROC AddExaminer
	@ThesisSerialNo INT,
	@DefenseDate DATETIME,
	@ExaminerName VARCHAR(20),
	@National BIT,
	@fieldOfWork VARCHAR(20)
	AS
	INSERT INTO PostGradUser(email, password)
	VALUES(NULL, NULL)
	DECLARE @lastID INT
	SET @lastID = SCOPE_IDENTITY()
	INSERT INTO Examiner VALUES(@lastID, @ExaminerName, @fieldOfWork, @National)
	INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId)
	VALUES(@DefenseDate, @ThesisSerialNo, @lastID)

GO

--4.g): Cancel a thesis if the evaluation of the last progress report of that thesis is 0
CREATE PROC CancelThesis
	@ThesisSerialNo INT
	AS
	DECLARE @lastPRDate DATE
	DECLARE @lastEval INT
	IF(EXISTS(SELECT *
		FROM GUCianStudentRegisterThesis
		WHERE serial_no = @ThesisSerialNo))
	BEGIN
		SELECT @lastPRDate = MAX(date)
		FROM GUCianProgressReport
		WHERE thesisSerialNumber = @ThesisSerialNo
		SELECT @lastEval = eval
		FROM GUCianProgressReport
		WHERE thesisSerialNumber = @ThesisSerialNo AND date = @lastPRDate
		IF(@lastEval = 0)
		BEGIN
			DELETE Thesis
			WHERE serialNumber = @ThesisSerialNo
		END
	END
	IF(EXISTS(SELECT *
		FROM NonGUCianStudentRegisterThesis
		WHERE serial_no = @ThesisSerialNo))
	BEGIN
		SELECT @lastPRDate = MAX(date)
		FROM NonGUCianProgressReport
		WHERE thesisSerialNumber = @ThesisSerialNo
		SELECT @lastEval = eval
		FROM NonGUCianProgressReport
		WHERE thesisSerialNumber = @ThesisSerialNo AND date = @lastPRDate
		IF(@lastEval = 0)
		BEGIN
			DELETE Thesis
			WHERE serialNumber = @ThesisSerialNo
		END
	END

GO

--4.h): Add grade for a thesis
CREATE PROC AddGrade
	@ThesisSerialNo INT,
	@grade DECIMAL(18,2)
	AS
	UPDATE Thesis
	SET grade = @grade
	WHERE serialNumber = @ThesisSerialNo

GO

--5.a): Add grade for a defense
CREATE PROC AddDefenseGrade
	@ThesisSerialNo INT,
	@DefenseDate DATETIME,
	@grade DECIMAL(18,2)
	AS
	UPDATE Defense
	SET grade = @grade
	WHERE serialNumber = @ThesisSerialNo AND date = @DefenseDate

GO

--5.b): Add comments for a defense
CREATE PROC AddCommentsGrade
	@ThesisSerialNo INT,
	@DefenseDate DATETIME,
	@comments VARCHAR(300)
	AS
	UPDATE ExaminerEvaluateDefense
	SET comment = @comments
	WHERE serialNo = @ThesisSerialNo AND date = @DefenseDate

GO

--6.a): View a specific student's profile
CREATE PROC viewMyProfile
	@studentId INT
	AS
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @studentId))
	BEGIN
		SELECT *
		FROM GucianStudent
		WHERE id = @studentId
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @studentId))
	BEGIN
		SELECT *
		FROM NonGucianStudent
		WHERE id = @studentId
	END

GO

--6.b): Edit a specific student's profile
CREATE PROC editMyProfile
	@studentID INT, 
	@firstName VARCHAR(20),
	@lastName VARCHAR(20),
	@password VARCHAR(20),
	@email VARCHAR(50),
	@address VARCHAR(50),
	@type VARCHAR(10)
	AS
	IF(EXISTS(SELECT *
		FROM GUCianStudent
		WHERE id = @studentID))
	BEGIN
		UPDATE PostGradUser
		SET email = @email, password = @password
		WHERE id = @studentID
		UPDATE GUCianStudent
		SET firstName = @firstName, lastName = @lastName, type = @type, address = @address
		WHERE id = @studentID
	END
	IF(EXISTS(SELECT *
		FROM NonGUCianStudent
		WHERE id = @studentID))
	BEGIN
		UPDATE PostGradUser
		SET email = @email, password = @password
		WHERE id = @studentID
		UPDATE NonGUCianStudent
		SET firstName = @firstName, lastName = @lastName, type = @type, address = @address
		WHERE id = @studentID
	END

GO

--6.c): Add an undergrad ID for a gucian student
CREATE PROC addUndergradID
	@studentID INT, 
	@undergradID VARCHAR(10)
	AS
	IF(EXISTS(SELECT *
		FROM GUCianStudent
		WHERE id = @studentID))
	BEGIN
		UPDATE GucianStudent
		SET undergradID = @undergradID
		WHERE id = @studentID
	END

GO

--6.d): View the grades of courses for a non gucian student
CREATE PROC ViewCoursesGrades
	@studentID INT
	AS
	SELECT C.code AS 'Course Code', A.grade AS 'Grade'
	FROM NonGucianStudentTakeCourse A
	INNER JOIN Course C ON  A.cid = C.id
	WHERE A.sid = @studentID

GO

--6.e)1: View the payments and installments corresponding to courses for non gucian student
CREATE PROC ViewCoursePaymentsInstall
	@studentID INT
	AS
	IF(EXISTS(SELECT *
		FROM NonGucianStudentPayForCourse
		WHERE sid = @studentID))
		BEGIN
		SELECT NGPFC.cid AS 'Course ID', P.*, I.*
		FROM NonGucianStudentPayForCourse NGPFC
		INNER JOIN Payment P ON NGPFC.paymentNo = P.id
		INNER JOIN Installment I ON P.id = I.paymentId
		WHERE NGPFC.sid = @studentID
		--GROUP BY NGPFC.cid
		END

GO

--6.e)2: View the payments and installments corresponding to thesis for a student
CREATE PROC ViewThesisPaymentsInstall
	@studentID INT
	AS
	DECLARE @gucian BIT
	DECLARE @thesisSerialNo INT
	DECLARE @paymentID INT
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @studentID))
	BEGIN
		SET @gucian = 1
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @studentID))
	BEGIN
		SET @gucian = 0
	END
	IF(@gucian = 1)
	BEGIN
		SELECT @thesisSerialNo = G.serial_no
		FROM GUCianStudentRegisterThesis G
		WHERE G.sid = @studentID
	END
	ELSE
	BEGIN
		SELECT @thesisSerialNo = N.serial_no
		FROM NonGUCianStudentRegisterThesis N
		WHERE N.sid = @studentID
	END

	SELECT @paymentID = T.payment_id
	FROM Thesis T
	WHERE T.serialNumber = @thesisSerialNo

	SELECT *
	FROM Payment P
	INNER JOIN Installment I ON P.id = I.paymentId
	WHERE @paymentID = P.id
	--GROUP BY P.id

GO

--6.e)3: List all the upcoming installments for a student
CREATE PROC ViewUpcomingInstallments
	@studentID INT
	AS
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @studentID))
	BEGIN
		SELECT I.*
		FROM GUCianStudentRegisterThesis GSRT
		INNER JOIN Thesis T ON GSRT.serial_no = T.serialNumber
		INNER JOIN Installment I ON T.payment_id = I.paymentId
		WHERE @studentID = GSRT.sid AND I.done = 0 AND I.date > CURRENT_TIMESTAMP
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @studentID))
	BEGIN
		SELECT I.*
		FROM NonGUCianStudentRegisterThesis NGSRT
		INNER JOIN Thesis T ON NGSRT.serial_no = T.serialNumber
		INNER JOIN Installment I ON T.payment_id = I.paymentId
		WHERE NGSRT.sid = @studentID AND I.done = 0 AND I.date > CURRENT_TIMESTAMP
		UNION
		(SELECT I.*
		FROM NonGucianStudentPayForCourse NGSPFC
		INNER JOIN Installment I ON NGSPFC.paymentNo = I.paymentId
		WHERE NGSPFC.sid = @studentID AND I.done = 0 AND I.date > CURRENT_TIMESTAMP)
	END

GO

--6.e)4: List all the missed installments for a student
CREATE PROC ViewMissedInstallments
	@studentID INT
	AS
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @studentID))
	BEGIN
		SELECT I.*
		FROM GUCianStudentRegisterThesis GSRT
		INNER JOIN Thesis T ON GSRT.serial_no = T.serialNumber
		INNER JOIN Installment I ON T.payment_id = I.paymentId
		WHERE @studentID = GSRT.sid AND I.done = 0 AND I.date < CURRENT_TIMESTAMP
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @studentID))
	BEGIN
		SELECT I.*
		FROM NonGUCianStudentRegisterThesis NGSRT
		INNER JOIN Thesis T ON NGSRT.serial_no = T.serialNumber
		INNER JOIN Installment I ON T.payment_id = I.paymentId
		WHERE NGSRT.sid = @studentID AND I.done = 0 AND I.date < CURRENT_TIMESTAMP
		UNION
		(SELECT I.*
		FROM NonGucianStudentPayForCourse NGSPFC
		INNER JOIN Installment I ON NGSPFC.paymentNo = I.paymentId
		WHERE NGSPFC.sid = @studentID AND I.done = 0 AND I.date < CURRENT_TIMESTAMP)
	END

GO

--6.f)1: Add a progress report for a thesis on a given date
CREATE PROC AddProgressReport
	@thesisSerialNo INT,
	@progressReportDate DATE
	AS
	DECLARE @gucian BIT
	DECLARE @sid INT
	DECLARE @supID INT
	IF(EXISTS(SELECT *
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 1
	END
	IF(EXISTS(SELECT *
		FROM NonGUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 0
	END
	IF(@gucian = 1)
	BEGIN
		SELECT @sid = G.sid, @supID = G.supid
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo
	END
	ELSE
	BEGIN
		SELECT @sid = N.sid, @supID = N.supid
		FROM NonGUCianStudentRegisterThesis N
		WHERE N.serial_no = @thesisSerialNo
	END
	IF(@gucian = 1)
	BEGIN
		INSERT INTO GUCianProgressReport(sid, date, thesisSerialNumber, supid)
		VALUES(@sid, @progressReportDate, @thesisSerialNo, @supID)
	END
	ELSE
	BEGIN
		INSERT INTO NonGUCianProgressReport(sid, date, thesisSerialNumber, supid)
		VALUES(@sid, @progressReportDate, @thesisSerialNo, @supID)
	END

GO

--6.f)2: Fill a progress report for a thesis specifying it's number
CREATE PROC FillProgressReport
	@thesisSerialNo INT,
	@progressReportNo INT,
	@state INT,
	@description VARCHAR(200)
	AS
	DECLARE @gucian BIT
	DECLARE @sid INT
	DECLARE @supID INT
	IF(EXISTS(SELECT *
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 1
	END
	IF(EXISTS(SELECT *
		FROM NonGUCianStudentRegisterThesis N
		WHERE N.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 0
	END
	IF(@gucian = 1)
	BEGIN
		SELECT @sid = G.sid, @supID = G.supid
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo
	END
	ELSE
	BEGIN
		SELECT @sid = N.sid, @supID = N.supid
		FROM NonGUCianStudentRegisterThesis N
		WHERE N.serial_no = @thesisSerialNo
	END
	IF(@gucian = 1)
	BEGIN
		UPDATE GUCianProgressReport
		SET description = @description, state = @state
		WHERE sid = @sid AND no = @progressReportNo
	END
	ELSE
	BEGIN
		UPDATE NonGUCianProgressReport
		SET description = @description, state = @state
		WHERE sid = @sid AND no = @progressReportNo
	END

GO

--6.g): View the evaluation of a specific progress report for a specific thesis
CREATE PROC ViewEvalProgressReport
	@thesisSerialNo INT,
	@progressReportNo INT
	AS
	DECLARE @gucian BIT
	DECLARE @sid INT
	DECLARE @supID INT
	IF(EXISTS(SELECT *
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 1
	END
	IF(EXISTS(SELECT *
		FROM NonGUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo))
	BEGIN
		SET @gucian = 0
	END
	IF(@gucian = 1)
	BEGIN
		SELECT @sid = G.sid, @supID = G.supid
		FROM GUCianStudentRegisterThesis G
		WHERE G.serial_no = @thesisSerialNo
	END
	ELSE
	BEGIN
		SELECT @sid = N.sid, @supID = N.supid
		FROM NonGUCianStudentRegisterThesis N
		WHERE N.serial_no = @thesisSerialNo
	END
	IF(@gucian = 1)
	BEGIN
		SELECT eval
		FROM GUCianProgressReport
		WHERE sid = @sid AND no = @progressReportNo
	END
	ELSE
	BEGIN
		SELECT eval
		FROM NonGUCianProgressReport
		WHERE sid = @sid AND no = @progressReportNo
	END

GO

--6.h): Add a publication to the system
CREATE PROC addPublication
	@title VARCHAR(50),
	@pubDate DATETIME,
	@host VARCHAR(50),
	@place VARCHAR(50),
	@accepted BIT
	AS
	INSERT INTO Publication(title, date, place, accepted, host)
	VALUES(@title, @pubDate, @place, @accepted, @host)

GO

--6.i): Link an existing publication to a thesis
CREATE PROC linkPubThesis
	@PubID INT,
	@thesisSerialNo INT
	AS
	INSERT INTO ThesisHasPublication(serialNo, pubid)
	VALUES(@thesisSerialNo, @PubID)

GO

--extra
CREATE PROC GetID
	@email VARCHAR(50),
	@id INT OUTPUT
	AS
	SELECT @id = id
	FROM PostGradUser
	WHERE email = @email;

GO

CREATE PROC ExaminerRegister
	@name VARCHAR(20),
	@fieldOfWork VARCHAR(20),
	@isNational BIT,
	@email VARCHAR(50),
	@password VARCHAR(20)
	AS
	INSERT INTO PostGradUser(email, password)
	VALUES(@email, @password)
	DECLARE @lastID INT
	SET @lastID = SCOPE_IDENTITY()
	INSERT INTO Examiner(id, name, fieldOfWork, isNational)
	VALUES(@lastID, @name, @fieldOfWork, @isNational)

GO

CREATE PROC GetType
	@id INT,
	@type INT OUTPUT
	AS
	IF(EXISTS(SELECT *
		FROM GucianStudent
		WHERE id = @id))
	BEGIN
		SET @type = 1
	END
	IF(EXISTS(SELECT *
		FROM NonGucianStudent
		WHERE id = @id))
	BEGIN
		SET @type = 2
	END
	IF(EXISTS(SELECT *
		FROM Supervisor
		WHERE id = @id))
	BEGIN
		SET @type = 3
	END
	IF(EXISTS(SELECT *
		FROM Examiner
		WHERE id = @id))
	BEGIN
		SET @type = 4
	END
	IF(EXISTS(SELECT *
		FROM Admin
		WHERE id = @id))
	BEGIN
		SET @type = 5
	END
