SET search_path = 'coop_db';
CREATE TABLE users
(
  email VARCHAR(320) NOT NULL,
  password VARCHAR(60) NOT NULL,
  username VARCHAR(64) NOT NULL,
  user_id NUMERIC NOT NULL,
  PRIMARY KEY (user_id),
  UNIQUE (email),
  UNIQUE (username)
);

CREATE TABLE moderators
(
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  moderator_id INT NOT NULL,
  user_id NUMERIC NOT NULL,
  PRIMARY KEY (moderator_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE students
(
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  student_id INT NOT NULL,
  user_id NUMERIC NOT NULL,
  PRIMARY KEY (student_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE company
(
  name VARCHAR(100) NOT NULL,
  sector TEXT NOT NULL,
  rating FLOAT NOT NULL,
  website VARCHAR(255) NOT NULL,
  icon_path VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);

CREATE TABLE jobs
(
  job_id INT NOT NULL,
  job_description TEXT NOT NULL,
  level_directed_to INT NOT NULL,
  ranking INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (job_id),
  FOREIGN KEY (name) REFERENCES company(name)
);

CREATE TABLE resumes
(
  resume_id INT NOT NULL,
  resume BYTEA NOT NULL,
  version_id INT NOT NULL,
  student_id INT NOT NULL,
  PRIMARY KEY (resume_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  UNIQUE (version_id)
);

CREATE TABLE upvotes
(
  resume_id INT NOT NULL,
  moderator_id INT NOT NULL,
  FOREIGN KEY (resume_id) REFERENCES resumes(resume_id),
  FOREIGN KEY (moderator_id) REFERENCES moderators(moderator_id)
);

CREATE TABLE resume_reviews
(
  comments TEXT NOT NULL,
  review_id INT NOT NULL,
  resume_id INT NOT NULL,
  moderator_id INT NOT NULL,
  PRIMARY KEY (review_id),
  FOREIGN KEY (resume_id) REFERENCES resumes(resume_id),
  FOREIGN KEY (moderator_id) REFERENCES moderators(moderator_id)
);

CREATE TABLE courses
(
  course_id INT NOT NULL,
  course_name VARCHAR(255) NOT NULL,
  course_description TEXT NOT NULL,
  course_code VARCHAR(10) NOT NULL,
  PRIMARY KEY (course_id)
);

CREATE TABLE university
(
  university_id INT NOT NULL,
  university_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (university_id),
  UNIQUE (university_name)
);

CREATE TABLE interviews
(
  interview_id INT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  provincial_state VARCHAR(255) NOT NULL,
  post_code VARCHAR(7) NOT NULL,
  country VARCHAR(52) NOT NULL,
  job_id INT NOT NULL,
  student_id INT NOT NULL,
  PRIMARY KEY (interview_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE jobs_applied
(
  student_id INT NOT NULL,
  job_id INT NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE tags
(
  tag_name VARCHAR(255) NOT NULL,
  tag_id INT NOT NULL,
  job_id INT NOT NULL,
  PRIMARY KEY (tag_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE Comments
(
  comment_id INT NOT NULL,
  for_job INT NOT NULL,
  for_company INT NOT NULL,
  job_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  student_id INT NOT NULL,
  FOREIGN KEY (job_id) REFERENCES jobs(job_id),
  FOREIGN KEY (name) REFERENCES company(name),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE program
(
  program_id INT NOT NULL,
  program_name VARCHAR(255) NOT NULL,
  required_number_of_credits INT NOT NULL,
  university_id INT NOT NULL,
  PRIMARY KEY (program_id),
  FOREIGN KEY (university_id) REFERENCES university(university_id)
);

CREATE TABLE program_enrolled
(
  start_date DATE NOT NULL,
  graduation DATE NOT NULL,
  coop_required INT NOT NULL,
  coop_offered INT NOT NULL,
  credits_required INT NOT NULL,
  level VARCHAR(2) NOT NULL,
  student_id INT NOT NULL,
  program_id INT NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE grades
(
  prof VARCHAR(255) NOT NULL,
  letter VARCHAR(2) NOT NULL,
  numerical_grade FLOAT NOT NULL,
  university_id INT NOT NULL,
  Student_id INT NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (university_id) REFERENCES university(university_id),
  FOREIGN KEY (Student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

