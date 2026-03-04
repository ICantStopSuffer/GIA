CREATE TABLE Roles(
	role_id SERIAL PRIMARY KEY,
	role_name TEXT NOT NULL
);

CREATE TABLE Users(
	user_id SERIAL PRIMARY KEY,
	password TEXT NOT NULL,
	role_id INTEGER REFERENCES Roles(role_id)
);

CREATE TABLE Teachers(
	teacher_id SERIAL PRIMARY KEY,
	teacher_name TEXT NOT NULL,
	user_id INTEGER REFERENCES Users(user_id)
);

CREATE TABLE Lessons(
	lesson_id SERIAL PRIMARY KEY,
	teacher_id INTEGER REFERENCES Teachers(teacher_id),
	lesson_name TEXT NOT NULL
);

CREATE TABLE Auditories(
	auditory_id SERIAL PRIMARY KEY,
	auditory_number TEXT NOT NULL
);

CREATE TABLE Schedule(
	schedule_id SERIAL PRIMARY KEY,
	lesson_id INTEGER REFERENCES Lessons(lesson_id),
	teacher_id INTEGER REFERENCES Teachers(teacher_id),
	auditory_id INTEGER REFERENCES Auditories(auditory_id)
);

CREATE TABLE Directions(
	direction_id SERIAL PRIMARY KEY,
	direction_name TEXT NOT NULL
);

CREATE TABLE Groups(
	group_id SERIAL PRIMARY KEY,
	groupe_name TEXT NOT NULL,
	direction_id INTEGER REFERENCES Directions(direction_id),
	schedule_id INTEGER REFERENCES Schedule(schedule_id)
);

CREATE TABLE Students(
	student_id SERIAL PRIMARY KEY,
	student_full_name TEXT NOT NULL,
	group_id INTEGER REFERENCES Groups(group_id),
	user_id INTEGER REFERENCES Users(user_id)
);

CREATE TABLE Grades (
	grade_id SERIAL PRIMARY KEY,
	student_id INTEGER REFERENCES Students(student_id),
	lesson_id INTEGER REFERENCES Lessons(lesson_id)
)