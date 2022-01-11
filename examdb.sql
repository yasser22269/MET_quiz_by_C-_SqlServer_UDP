CREATE DATABASE examdb;

USE examdb;

--create student taple
CREATE TABLE Student (
    id int IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL,
    grade_id int NOT NULL,
    username varchar(100) NOT NULL,
    password varchar(100) NOT NULL
);

--insert students
INSERT INTO Student(name, grade_id, username , password)VALUES('moustafa', 4, 'mo', '1234');
INSERT INTO Student(name, grade_id, username , password)VALUES('yasser', 4, 'ya', '1234');
INSERT INTO Student(name, grade_id, username , password)VALUES('hady amal', 4, 'hady', '1234');


--create Subject taple
CREATE TABLE Subject (
    id int IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL,
    grade_id int NOT NULL,
    doctor_name varchar(100) NOT NULL
);

--insert subjects
INSERT INTO Subject(name, grade_id, doctor_name)VALUES('Network Programming', 4, 'Lobna M.Abou El-Maged');
INSERT INTO Subject(name, grade_id, doctor_name)VALUES('Software Engineering', 4, 'Mohamed Abd Elfattah');
INSERT INTO Subject(name, grade_id, doctor_name)VALUES('AI', 4, 'Dr-Mohammed Kazim');
INSERT INTO Subject(name, grade_id, doctor_name)VALUES('Computer Vision', 4, 'Mahmoud Abo EL-Fotouh');


--create Exam taple
CREATE TABLE Exam (
    id int IDENTITY PRIMARY KEY,
    subject_id int NOT NULL FOREIGN KEY REFERENCES Subject(id),
    start_date datetime NOT NULL,
);

--insert exam
INSERT INTO Exam(subject_id, start_date)VALUES(1, '01/09/2021 3:00 PM');
INSERT INTO Exam(subject_id, start_date)VALUES(2, '01/09/2021 4:20 PM');


--create Questions taple
CREATE TABLE Questions (
    id int IDENTITY PRIMARY KEY,
    q_body VARCHAR(MAX) NOT NULL,
    ob_a VARCHAR(255) NOT NULL,
    ob_b VARCHAR(255) NOT NULL,
    ob_c VARCHAR(255) NOT NULL,
    ob_d VARCHAR(255) NOT NULL,
    answer VARCHAR(255) NOT NULL,
    exam_id int NOT NULL FOREIGN KEY REFERENCES Exam(id)
);

--insert Questions
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in socket communication, once TcpListener gets a call, it will execute function','connect()','load()','open()','accept()','accept()',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the commend ...... tells the server to abort current message and clear all of its buffers','rest','vrfy','mail','quit','rest',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in the server side, after server creats a socket, it starts ....','listening','bending','accepting','receiving and sending','accepting',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the property that prevents access by other processes to all or part of a file is','quit','disconnect','close','lock','lock',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in the IPEndPoint class, the enumeration of addressing types that is used by a socket is known as','IPHostEntry','AddressFamily','IPAddress','AddressFamily','AddressFamily',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in socket communication, once TcpListener gets a call, it will execute function','connect()','load()','open()','accept()','accept()',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the commend ...... tells the server to abort current message and clear all of its buffers','rest','vrfy','mail','quit','rest',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in the server side, after server creats a socket, it starts ....','listening','bending','accepting','receiving and sending','accepting',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the property that prevents access by other processes to all or part of a file is','quit','disconnect','close','lock','lock',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in the IPEndPoint class, the enumeration of addressing types that is used by a socket is known as','IPHostEntry','AddressFamily','IPAddress','AddressFamily','AddressFamily',1);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in helper class if insertData() method returns false, the result of query insert is ....','-1','1','0','2','-1',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the helper class extends ..... class','contentValue','sqliteDatabaseHelper','sqlite','retrofite','sqliteDatabaseHelper',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('...... is called when activity is first created','onCreate()','onPause()','onStart()','onDestory()','onCreate()',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('Extreme programming depends on .....','procedural programming','logic programming','pair programming','object oriented programming','pair programming',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('during the sprint agile team meet .....','never meet','every day','every month','every week','every day',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('in helper class if insertData() method returns false, the result of query insert is ....','-1','1','0','2','-1',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('the helper class extends ..... class','contentValue','sqliteDatabaseHelper','sqlite','retrofite','sqliteDatabaseHelper',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('...... is called when activity is first created','onCreate()','onPause()','onStart()','onDestory()','onCreate()',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('Extreme programming depends on .....','procedural programming','logic programming','pair programming','object oriented programming','pair programming',2);
INSERT INTO Questions(q_body, ob_a, ob_b, ob_c, ob_d, answer, exam_id)VALUES('during the sprint agile team meet .....','never meet','every day','every month','every week','every day',2);


--create StudentResult taple
CREATE TABLE StudentResult (
    id int IDENTITY PRIMARY KEY,
    student_id int NOT NULL FOREIGN KEY REFERENCES Student(id),
    exem_id int NOT NULL FOREIGN KEY REFERENCES Exam(id),
    score float NOT NULL
);

