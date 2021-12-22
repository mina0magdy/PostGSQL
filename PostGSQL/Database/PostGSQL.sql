CREATE DATABASE PostGSQL;

SET DATEFORMAT dmy;

CREATE TABLE PostGradUser (
	id INT PRIMARY KEY IDENTITY,
	email VARCHAR(50),
	password VARCHAR(20)
	);

CREATE TABLE Admin (
	id INT PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES PostGradUser ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE GucianStudent (
	id INT PRIMARY KEY,
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	type VARCHAR(10),
	faculty VARCHAR(20),
	address VARCHAR(50),
	GPA REAL,
	undergradID VARCHAR(10),
	FOREIGN KEY (id) REFERENCES PostGradUser ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE NonGucianStudent (
	id INT PRIMARY KEY,
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	type VARCHAR(10),
	faculty VARCHAR(20),
	address VARCHAR(50),
	GPA REAL,
	FOREIGN KEY (id) REFERENCES PostGradUser ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE GUCStudentPhoneNumber (
	id INT,
	phone VARCHAR(20),
	PRIMARY KEY(id, phone),
	FOREIGN KEY(id) REFERENCES GucianStudent ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE NonGUCStudentPhoneNumber (
	id INT,
	phone VARCHAR(20),
	PRIMARY KEY(id, phone),
	FOREIGN KEY(id) REFERENCES NonGucianStudent ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE Course (
	id INT PRIMARY KEY IDENTITY,
	fees DECIMAL(18,2),
	creditHours INT,
	code VARCHAR(10)
	);

CREATE TABLE Supervisor (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	faculty VARCHAR(20),
	FOREIGN KEY (id) REFERENCES PostGradUser ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE Payment (
	id INT PRIMARY KEY IDENTITY,
	amount DECIMAL(18,2),
	no_Installments INT,
	fundPercentage DECIMAL(18,2)
	);

CREATE TABLE Thesis (
	serialNumber INT PRIMARY KEY IDENTITY,
	field VARCHAR(20),
	type VARCHAR(20),
	title VARCHAR(50),
	startDate DATE,
	endDate DATE,
	defenseDate DATETIME,
	years AS (YEAR(endDate) - YEAR(startDate)),
	grade DECIMAL(18,2),
	payment_id INT FOREIGN KEY REFERENCES Payment ON DELETE CASCADE ON UPDATE CASCADE,
	noExtension INT
	);

CREATE TABLE Publication (
	id INT PRIMARY KEY IDENTITY,
	title VARCHAR(50),
	date DATETIME,
	place VARCHAR(50),
	accepted BIT,
	host VARCHAR(50)
	);

CREATE TABLE Examiner (
	id INT PRIMARY KEY,
	name VARCHAR(20),
	fieldOfWork VARCHAR(20),
	isNational BIT
	FOREIGN KEY (id) REFERENCES PostGradUser ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE Defense (
	serialNumber INT,
	date DATETIME,
	location VARCHAR(15),
	grade DECIMAL(18,2),
	PRIMARY KEY(serialNumber, date),
	FOREIGN KEY(serialNumber) REFERENCES Thesis ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE GUCianProgressReport (
	sid INT,
	no INT IDENTITY,
	description VARCHAR(200),
	date DATE,
	eval INT,
	state INT,
	thesisSerialNumber INT,
	supid INT
	PRIMARY KEY(sid, no),
	FOREIGN KEY(sid) REFERENCES GucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(thesisSerialNumber) REFERENCES Thesis ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(supid) REFERENCES Supervisor ON DELETE NO ACTION ON UPDATE NO ACTION
	);

CREATE TABLE NonGUCianProgressReport (
	sid INT,
	no INT IDENTITY,
	description VARCHAR(200),
	date DATE,
	eval INT,
	state INT,	
	thesisSerialNumber INT,
	supid INT
	PRIMARY KEY(sid, no),
	FOREIGN KEY(sid) REFERENCES NonGucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(thesisSerialNumber) REFERENCES Thesis ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(supid) REFERENCES Supervisor ON DELETE NO ACTION ON UPDATE NO ACTION
	);

CREATE TABLE Installment (
	date DATE,
	paymentID INT,
	amount DECIMAL(18,2),
	done BIT
	PRIMARY KEY(date, paymentID),
	FOREIGN KEY(paymentID) REFERENCES Payment ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE NonGucianStudentPayForCourse (
	sid INT FOREIGN KEY references NonGucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	paymentNo INT FOREIGN KEY references Payment ON DELETE CASCADE ON UPDATE CASCADE,
	cid INT FOREIGN KEY references Course ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid, paymentNo, cid)
	);

CREATE TABLE NonGucianStudentTakeCourse (
	sid INT FOREIGN KEY references NonGucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	cid INT FOREIGN KEY references  Course ON DELETE CASCADE ON UPDATE CASCADE,
	grade DECIMAL(10,2),
	PRIMARY KEY(sid, cid)
	);

CREATE TABLE GUCianStudentRegisterThesis (
	sid INT FOREIGN KEY references GucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	supid INT FOREIGN KEY references Supervisor ON DELETE NO ACTION ON UPDATE NO ACTION,
	serial_no INT FOREIGN KEY references Thesis ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid, supid, serial_no)
	);

CREATE TABLE NonGUCianStudentRegisterThesis (
	sid INT FOREIGN KEY references NonGucianStudent ON DELETE CASCADE ON UPDATE CASCADE,
	supid INT FOREIGN KEY references Supervisor ON DELETE NO ACTION ON UPDATE NO ACTION,
	serial_no INT FOREIGN KEY references Thesis ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid, supid, serial_no)
	);

CREATE TABLE ExaminerEvaluateDefense (
	date DATETIME,
	serialNo INT,
	examinerId INT FOREIGN KEY references Examiner ON DELETE CASCADE ON UPDATE CASCADE,
	comment VARCHAR(300),
	PRIMARY KEY(date, serialNo, examinerId),
	FOREIGN KEY (serialNo, date) references Defense ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE ThesisHasPublication (
	serialNo INT FOREIGN KEY references Thesis ON DELETE CASCADE ON UPDATE CASCADE,
	pubid INT FOREIGN KEY references Publication ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (serialNo, pubid)
	);
