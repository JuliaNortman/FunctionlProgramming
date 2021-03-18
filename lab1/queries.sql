CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);

CREATE TABLE teacher (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);

CREATE TABLE section (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	teacher_id INTEGER,
	days VARCHAR(50),
	FOREIGN KEY (teacher_id) REFERENCES teacher(id) ON DELETE CASCADE
);

CREATE TABLE participants (
	section_id INTEGER,
	student_id INTEGER,
	FOREIGN KEY (section_id) REFERENCES section(id) ON DELETE CASCADE,
	FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

INSERT INTO student (name)
VALUES ('Alice'),
	   ('Bob'),
	   ('John'),
	   ('Kate'),
	   ('Mark'),
	   ('Sam');
	   
	   
INSERT INTO teacher (name)
VALUES ('Mr. Brown'),
	   ('Mrs. Klark'),
	   ('Mr. Green'),
	   ('Mr. Smith'),
	   ('Mrs. Cooper');
	   
INSERT INTO section (name, teacher_id, days)
VALUES ('Football', 3, 'Mon, Tue'),
	   ('Chess', 2, 'Wed, Sat, Sun'),
	   ('Table tennis', 1, 'Mon-Fri'),
	   ('Swimming', 5, 'Mon, Wed, Fri'),
	   ('Basketball', 4, 'Mon, Thu');
	   
INSERT INTO participants
VALUES (1, 1),
	   (1, 3),
	   (2, 5),
	   (2, 4),
	   (3, 1),
	   (4, 2),
	   (4, 4),
	   (5, 3),
	   (5, 4),
	   (5, 5);