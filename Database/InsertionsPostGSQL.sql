USE PostGSQL;

SET DATEFORMAT dmy;

INSERT INTO PostGradUser(email, password) --1
VALUES('mohammed.ahmed@gmail.com', 'mohammed@12');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 1
VALUES(1, 'Mohammed', 'Ahmed', 'Masters', 'Computer Engineering', 'Rehab', 1.1);
INSERT INTO PostGradUser(email, password) --2
VALUES('mariam.mohammed@gmail.com', 'mariam#23');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 2
VALUES(2, 'Mariam', 'Mohammed', 'Masters', 'Computer Engineering', 'Tagamoo', 1.4);
INSERT INTO PostGradUser(email, password) --3
VALUES('haytham.ali@gmail.com', 'haytham$12');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 9
VALUES(3, 'Haytham', 'Ali', 'Phd', 'Prod. Engineering', 'Heliopolis', 1.9);
INSERT INTO PostGradUser(email, password) --4
VALUES('omar.ashraf@gmail.com', 'omar.67');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 3
VALUES(4, 'Omar', 'Ashraf', 'Masters', 'Pharmacy', 'Zayed', 0.8);
INSERT INTO PostGradUser(email, password) --5
VALUES('hoda.ahmed@gmail.com', 'hoda&12');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 10
VALUES(5, 'Hoda', 'Ahmed', 'Phd', 'Computer Engineering', 'Narges', 0.95);
INSERT INTO PostGradUser(email, password) --6
VALUES('michel.raouf@gmail.com', 'michel.12');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 11
VALUES(6, 'Michel', 'Raouf', 'Phd', 'Computer Engineering', 'Rehab', 1);
INSERT INTO PostGradUser(email, password) --7
VALUES('mina.magdy@gmail.com', 'mina%123');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 4
VALUES(7, 'Mina', 'Magdy', 'Masters', 'Prod. Engineering', 'Haram', 1.4);
INSERT INTO PostGradUser(email, password) --8
VALUES('mohammed.salem@gmail.com', 'mohammed+11');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 5
VALUES(8, 'Moahmmed', 'Salem', 'Masters', 'Arch. Engineering', 'Rehab', 1.5);
INSERT INTO PostGradUser(email, password) --9
VALUES('marwan.mohammed@gmail.com', 'marwan#55');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 12
VALUES(9, 'Marwan', 'Mohammed', 'Phd', 'Managment', '6th October', 0.8);
INSERT INTO PostGradUser(email, password) --10
VALUES('salma.alaa@gmail.com', 'salma332');
INSERT INTO GucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 13
VALUES(10, 'Salma', 'Alaa', 'Phd', 'Law', 'Ramsis', 2);

INSERT INTO PostGradUser(email, password) --11
VALUES('fady.michael@gmail.com', 'fady=11');
INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 6
VALUES(11, 'Fady', 'Michael', 'Masters', 'Law', 'Almaza', 1.7);
INSERT INTO PostGradUser(email, password) --12
VALUES('khaled.mohammed@gmail.com', 'khaled331');
INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 14
VALUES(12, 'Khaled', 'Mohammed', 'Phd', 'Arch.Engineering', 'Zayed', 1.2);
INSERT INTO PostGradUser(email, password) --13
VALUES('miriam.alex@gmail.com' ,'miriam#122');
INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 7
VALUES(13, 'Miriam', 'Alex', 'Masters', 'Applied Arts', 'Tagamoo', 1.6);
INSERT INTO PostGradUser(email, password) --14
VALUES('bassel.islam@gmail.com' ,'bassel;;11');
INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 15
VALUES(14, 'Bassel', 'Islam', 'Phd', 'Pharmacy', 'Banafseg', 2.1);
INSERT INTO PostGradUser(email, password) --15
VALUES('marina.mina@gmail.com', 'marina@@123');
INSERT INTO NonGucianStudent(id, firstName, lastName, type, faculty, address, GPA) --Thesis: 8
VALUES(15, 'Marina', 'Mina', 'Masters', 'Managment', 'Zatoon', 0.8);

INSERT INTO PostGradUser(email, password) --16
VALUES('bassem.ahmed@gmail.com', 'bassem.88');
INSERT INTO Examiner(id, name, fieldOfWork, isNational) --Attending for: 1, 2, 3, 5, 6, 7, 8, 9, 12, 13, 15
VALUES(16, 'Bassem Ahmed', 'Science/Enginnering', 1);
INSERT INTO PostGradUser(email, password) --17
VALUES('alexander.paul@gmail.com', 'alex#55');
INSERT INTO Examiner(id, name, fieldOfWork, isNational) --Attending for: 4, 10, 11, 14
VALUES(17, 'Alexander Paul', 'Pharmacy/Law', 0);

INSERT INTO PostGradUser(email, password) --18
VALUES('salem.omar@gmail.com', 'salem!!22');
INSERT INTO Supervisor(id, name, faculty) --Supervising Students ids: 1, 2, 3, 5, 6, 7, 8, 12
VALUES(18, 'Salem Omar', 'Engineering');
INSERT INTO PostGradUser(email, password) --19
VALUES('wassim.ayman@gmail.com', 'wassim2321');
INSERT INTO Supervisor(id, name, faculty)  --Supervising Students ids: 10, 11
VALUES(19, 'Wassim Ayman', 'Law');
INSERT INTO PostGradUser(email, password) --20
VALUES('radwa.mostafa', 'radwa$11');
INSERT INTO Supervisor(id, name, faculty) --Supervising Students ids: 4, 14
VALUES(20, 'Radwa Mostafa', 'Pharmacy');
INSERT INTO PostGradUser(email, password) --21
VALUES('mostafa.hamed', 'mostafa@123');
INSERT INTO Supervisor(id, name, faculty) --Supervising Students ids: 9, 15, 13
VALUES(21, 'Mostafa Hamed', 'Managment');

INSERT INTO PostGradUser(email, password) --22
VALUES('eyad.hassan@gmail.com', 'eyad22');
INSERT INTO Admin(id)
VALUES(22);

INSERT INTO Course(fees,creditHours, code)
VALUES(4000, 4, 'ECON605'); --1
INSERT INTO Course(fees,creditHours, code)
VALUES(3000, 3, 'ARCH502'); --2
INSERT INTO Course(fees,creditHours, code) 
VALUES(7000, 7, 'PHBL621'); --3
INSERT INTO Course(fees,creditHours, code) 
VALUES(4000, 4, 'CRLA'); --4

INSERT INTO NonGucianStudentTakeCourse(sid, cid, grade)
VALUES(11, 4, 82);
INSERT INTO NonGucianStudentTakeCourse(sid, cid, grade)
VALUES(12, 2, 77);
INSERT INTO NonGucianStudentTakeCourse(sid, cid, grade)
VALUES(13, 2, 70);
INSERT INTO NonGucianStudentTakeCourse(sid, cid, grade)
VALUES(14, 3, 96);
INSERT INTO NonGucianStudentTakeCourse(sid, cid, grade)
VALUES(15, 1, 91);

INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(4000, 1, 0); --1
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(3000, 1, 0); --2
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(3000, 1, 0); --3
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(7000, 1, 0); --4
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(4000, 1, 0); --5
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --6
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --7
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(80000, 2, 0); --8
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(80000, 2, 0); --9
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --10
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --11
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --12
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(80000, 2, 0); --13
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(150000, 4, 0); --14
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(150000, 4, 0); --15
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(150000, 4, 0); --16
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(150000, 4, 0); --17
INSERT INTO Payment(amount, no_Installments, fundPercentage)
VALUES(150000, 4, 0); --18
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(150000, 4, 0); --19
INSERT INTO Payment(amount, no_Installments, fundPercentage) 
VALUES(150000, 4, 0); --20

INSERT INTO Installment(date, paymentId, amount, done)
VALUES('1/1/2020', 1, 4000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('15/5/2011', 2, 3000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('30/12/2021', 3, 3000, 0);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('28/4/2010', 4, 7000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('28/12/2010', 5, 4000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('12/3/2015', 6, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('12/3/2016', 6, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('20/9/2018', 7, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('20/9/2019', 7, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('5/12/2011', 8, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('5/12/2012', 8, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('26/6/2021', 9, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('26/6/2022', 9, 40000, 0);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('3/5/2017', 10, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('3/5/2018', 10, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('4/1/2020', 11, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('4/1/2021', 11, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('28/11/2021', 12, 40000, 0);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('28/11/2022', 12, 40000, 0);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('1/7/2011', 13, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('1/7/2012', 13, 40000, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('4/4/2016', 14, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('4/4/2017', 14, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('4/4/2018', 14, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('4/4/2019', 14, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('21/2/2010', 15, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('21/2/2011', 15, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('21/2/2012', 15, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('21/2/2013', 15, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('23/10/2018', 16, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('23/10/2019', 16, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('23/10/2020', 16, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('23/10/2021', 16, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('10/8/2019', 17, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('10/8/2020', 17, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('10/8/2021', 17, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('10/8/2022', 17, 37500, 0);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('4/2/2010', 18, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('4/2/2011', 18, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('4/2/2012', 18, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('4/2/2013', 18, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('13/5/2011', 19, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('13/5/2012', 19, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('13/5/2013', 19, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('13/5/2014', 19, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('20/5/2010', 20, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('20/5/2011', 20, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done) 
VALUES('20/5/2012', 20, 37500, 1);
INSERT INTO Installment(date, paymentId, amount, done)
VALUES('20/5/2013', 20, 37500, 1);

INSERT INTO NonGucianStudentPayForCourse(sid, paymentNo, cid)
VALUES(11, 1, 4);
INSERT INTO NonGucianStudentPayForCourse(sid, paymentNo, cid)
VALUES(12, 2, 2);
INSERT INTO NonGucianStudentPayForCourse(sid, paymentNo, cid)
VALUES(13, 3, 2);
INSERT INTO NonGucianStudentPayForCourse(sid, paymentNo, cid)
VALUES(14, 4, 3);
INSERT INTO NonGucianStudentPayForCourse(sid, paymentNo, cid)
VALUES(15, 5, 1);

INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --1 
VALUES('Computer Science', 'Masters', 'Algorithms and architectures (machine learning)', '12/3/2015', '10/2/2017', '15/1/2017', 6, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --2
VALUES('Computer Science', 'Masters', 'Computer security (privacy and openness)', '20/9/2018', '25/10/2020', '1/9/2020', 7, 1);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --3
VALUES('Pharmacy', 'Masters', 'Preparedness for Acute Medical Emergencies', '5/12/2011', '15/3/2014', '1/3/2014', 8, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, payment_id, noExtension) --4
VALUES('Production', 'Masters', 'Efficient logistics operations within supply chain', '26/6/2021', '20/4/2023', 9, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --5
VALUES('Architecture', 'Masters', 'Convergence of Human Interaction and Form', '3/5/2017', '2/1/2020', '22/12/2019', 10, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --6
VALUES('Law', 'Masters', 'How do ethics and medical law coexist', '4/1/2020', '5/3/2022', '21/2/2022', 11, 2);
INSERT INTO Thesis(field, type, title, startDate, endDate, payment_id, noExtension) --7
VALUES('Applied Arts', 'Masters', 'Wire Rope on Product Design', '28/11/2021', '18/10/2023', 12, 1);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --8
VALUES('Managment', 'Masters', 'Delegation: methods that work', '1/7/2011', '1/1/2014', '25/12/2013', 13, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --9
VALUES('Industry', 'Phd', 'Detect Driver Distraction', '4/4/2016', '1/2/2021', '27/12/2020', 14, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --10
VALUES('Computer Science', 'Phd', 'Understanding natural language', '21/2/2010', '30/1/2015', '6/1/2015', 15, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, payment_id, noExtension) --11
VALUES('Computer Science', 'Phd', 'Crowd Algorithms', '23/10/2018', '1/9/2023', 16, 1);
INSERT INTO Thesis(field, type, title, startDate, endDate, payment_id, noExtension) --12
VALUES('Managment', 'Phd', 'Entrepreneurship and SME Development', '10/8/2019', '9/9/2024', 17, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --13 
VALUES('Law', 'Phd', 'The action for injunction in EU consumer law', '4/2/2010', '7/1/2015', '29/12/2014', 18, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --14
VALUES('Architecture', 'Phd', 'Land use and transport', '13/5/2011', '18/8/2016', '1/8/2016', 19, 0);
INSERT INTO Thesis(field, type, title, startDate, endDate, defenseDate, payment_id, noExtension) --15
VALUES('Pharmacy', 'Phd', 'Lipid-based implants for sustained protein release', '20/5/2010', '3/1/2014', '26/12/2013', 20, 0);
INSERT INTO Thesis(field, type, title, noExtension) --16
VALUES('Law', 'Masters', 'Ambient intelligence and the right to privacy', 0);
INSERT INTO Thesis(field, type, title, noExtension) --17
VALUES('Managment', 'Phd', 'Impact Of Heuristics On Brand Choice',  0);

INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(1, 18, 1);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(2, 18, 2);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(3, 18, 9);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(4, 20, 3);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(5, 18, 10);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(6, 18, 11);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(7, 18, 4);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(8, 18, 5);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(9, 21, 12);
INSERT INTO GUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(10, 19, 13);

INSERT INTO NonGUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(11, 19, 6);
INSERT INTO NonGUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(12, 18, 14);
INSERT INTO NonGUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(13, 21, 7);
INSERT INTO NonGUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(14, 20, 15);
INSERT INTO NonGUCianStudentRegisterThesis(sid, supid, serial_no)
VALUES(15, 21, 8);

INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --1 
VALUES(1, '12/3/2016', 2, 40, 1, 18, 'Almost half way through');
INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --2 
VALUES(2, '20/9/2019', 1, 40, 2, 18, 'Almost half way through');
INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --3 
VALUES(3, '4/4/2017', 3, 20, 9, 18, 'First part done, needs more more work');
INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --4 
VALUES(3, '4/4/2018', 1, 40, 9, 18, 'Almost half way through');
INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --5 
VALUES(4, '5/12/2012', 2, 40, 3, 20, 'Almost half way through');
INSERT INTO GUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --6 
VALUES(5, '21/2/2011', 3, 20, 10, 18, 'First part done, needs more more work');

INSERT INTO NonGUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --7   
VALUES(11, '4/1/2021', 1, 40, 6, 19, 'Almost half way through');
INSERT INTO NonGUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --8
VALUES(12, '13/5/2012', 2, 20, 14, 18, 'First part done, needs more more work');
INSERT INTO NonGUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --9
VALUES(13,'28/11/2022', 1, 40, 7, 21, 'Almost half way through');
INSERT INTO NonGUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --10
VALUES(14,'20/5/2011', 1, 20, 15, 20, 'First part done, needs more more work');
INSERT INTO NonGUCianProgressReport(sid, date, eval, state, thesisSerialNumber, supid, description) --11
VALUES(15,'1/7/2012', 3, 40, 8, 21, 'Almost half way through');

INSERT INTO Defense(serialNumber, date, location)
VALUES(1,'15/1/2017','H1');
INSERT INTO Defense(serialNumber, date, location) 
VALUES(2,'1/9/2020','H2');
INSERT INTO Defense(serialNumber, date, location) 
VALUES(3,'1/3/2014','H1');
INSERT INTO Defense(serialNumber, date, location) 
VALUES(5,'22/12/2019','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(6,'21/2/2022','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(8,'25/12/2013','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(9,'27/12/2020','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(10,'6/1/2015','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(13,'29/12/2014','H1');
INSERT INTO Defense(serialNumber, date, location)
VALUES(14,'1/8/2016','H4');
INSERT INTO Defense(serialNumber, date, location)
VALUES(15,'26/12/2013','H2');

INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('15/1/2017', 1, 16, 'more than perfect');
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('1/9/2020', 2, 16, 'not good enough');
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('1/3/2014', 3, 16, 'more than perfect'); 
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('22/12/2019', 5, 16, 'needs more work'); 
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId)
VALUES('21/2/2022', 6, 16); 
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('25/12/2013', 8, 16, 'not good enough'); 
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('27/12/2020', 9, 16, 'needs more work'); 
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('6/1/2015', 10, 17, 'more than perfect');
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('29/12/2014', 13, 16, 'not good enough');
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('1/8/2016', 14, 17, 'needs more work');
INSERT INTO ExaminerEvaluateDefense(date, serialNo, examinerId, comment)
VALUES('26/12/2013', 15, 16, 'weak defense');

INSERT INTO Publication(title, date, place, accepted, host) --1
VALUES('Nueral networks', '15/5/2017', 'H3', 1, 'Machine learning');
INSERT INTO Publication(title, date, place, accepted, host) --2
VALUES('Ransomware and malware', '2/2/2021', 'H3', 1, 'Internet Security');
INSERT INTO Publication(title, date, place, accepted, host) --3
VALUES('Hospitals and medical emergencies','12/6/2014', 'H4', 0, 'Medicine in Egypt');
INSERT INTO Publication(title, date, place, accepted, host) --4
VALUES('Driving and mobile phones', '2/3/2021', 'H3', 1, 'Transportation');
INSERT INTO Publication(title, date, place, accepted, host) --5
VALUES('Natural language processing','17/3/2016', 'H4', 0, 'Theory of theoritical computation');

INSERT INTO ThesisHasPublication(serialNo, pubid)
VALUES(1, 1);
INSERT INTO ThesisHasPublication(serialNo, pubid)
VALUES(2, 2);
INSERT INTO ThesisHasPublication(serialNo, pubid)
VALUES(3, 3);
INSERT INTO ThesisHasPublication(serialNo, pubid)
VALUES(9, 4);
INSERT INTO ThesisHasPublication(serialNo, pubid)
VALUES(10, 5);