CREATE TABLE Roles(
	role_id SERIAL PRIMARY KEY,
	role_name TEXT NOT NULL
);

CREATE TABLE Users(
	user_id SERIAL PRIMARY KEY,
	login text not null,
	password TEXT NOT NULL,
	role_id INTEGER REFERENCES Roles(role_id)
);

CREATE TABLE Teachers(
	teacher_id SERIAL PRIMARY KEY,
	teacher_name TEXT NOT NULL,
	user_id INTEGER REFERENCES Users(user_id)
);

CREATE TABLE Auditories(
	auditory_id SERIAL PRIMARY KEY,
	auditory_number TEXT NOT NULL
);

CREATE TABLE Lessons(
	lesson_id SERIAL PRIMARY KEY,
	teacher_id INTEGER REFERENCES Teachers(teacher_id),
	lesson_name TEXT NOT NULL
);

CREATE TABLE Directions(
	direction_id SERIAL PRIMARY KEY,
	direction_name TEXT NOT NULL
);

CREATE TABLE Groups(
	group_id SERIAL PRIMARY KEY,
	groupe_name TEXT NOT NULL, 
	direction_id INTEGER REFERENCES Directions(direction_id)
);

CREATE TABLE Schedule(
	schedule_id SERIAL PRIMARY KEY,
	lesson_id INTEGER REFERENCES Lessons(lesson_id),
	group_id INTEGER REFERENCES Groups(group_id),
	auditory_id INTEGER REFERENCES Auditories(auditory_id)
);

CREATE TABLE Students(
	student_id SERIAL PRIMARY KEY,
	student_name TEXT NOT NULL,
	group_id INTEGER REFERENCES Groups(group_id),
	user_id INTEGER REFERENCES Users(user_id)
);


CREATE TABLE Grades (
	grade_id SERIAL PRIMARY KEY,
	student_id INTEGER REFERENCES Students(student_id),
	lesson_id INTEGER REFERENCES Lessons(lesson_id),
	grade int not null
);

insert into Roles(role_name) values 
('role1'),
('role2'),
('role3'),
('role4'),
('role5');

insert into Users(login, password, role_id) values 
('user1', '123456a', 1),
('user2', '123456b', 2),
('user3', '123456c', 3),
('user4', '123456d', 4),
('user5', '123456e', 5);

insert into Teachers(teacher_name, user_id) values 
('teacher1', 1),
('teacher1', 2);

insert into Auditories(auditory_number) values
('101'),
('102'),
('201');

insert into Lessons(teacher_id, lesson_name) values
(1, 'lesson1'),
(1, 'lesson2'),
(1, 'lesson3'),
(2, 'lesson4'),
(2, 'lesson5'),
(2, 'lesson6');

insert into Directions(direction_name) values
('direction1'),
('direction2'),
('direction3');

insert into Groups(groupe_name, direction_id) values
('group1', 1),
('group2', 2),
('group3', 3);

insert into Schedule(lesson_id, group_id, auditory_id) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 1),
(5, 2, 2),
(6, 3, 3);

insert into Students(student_name, group_id, user_id) values
('student1', 1, 3),
('student2', 2, 4),
('student3', 3, 5);

insert into Grades(student_id, lesson_id, grade) values
(1, 1, 3),
(2, 2, 4),
(3, 3, 5),
(3, 3, 3),
(2, 2, 2),
(1, 1, 5);