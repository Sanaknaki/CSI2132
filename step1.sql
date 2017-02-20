-- Select 
SELECT 
INSERT
DELETE
UPDATE


-- Student applied to a job
INSERT INTO jobs_applied (student_id, Job_id)
VALUES ( :student_id, :job_id)

-- Add a student
INSERT INTO Students (first_name, last_name, user_id)
VALUES (:fname, :lname, :user_id)

-- Add a user
INSERT INTO User (email, username, password)
VALUES (:email, :username, :password)

-- Add a Moderator
INSERT INTO Moderator (first_name, last_name, user_id)
VALUES (:fname, :lname, :user_id)

-- Add program
INSERT INTO Program (program_name, required_number_of_credits, university_id)
VALUES (:pname, :rcredits, :uni_id)

-- add university
INSERT INTO University (first_name, last_name, user_id)
VALUES (:fname, :lname, :user_id)

-- add program enrolled
INSERT INTO program_enrolled (start_date, graduation, level, coop_required, coop_offered, credits_required, student_id, program_id)
VALUES (:start_date, :graduation, :level, :coop_required, :coop_offered, :credits_required, :student_id, :program_id)

-- add upvote
INSERT INTO upvote (Moderator_id, resume_id)
VALUES (:Moderator_id, :resume_id)

-- add resume
INSERT INTO resume (resume, version_id, student_id)
VALUES (:resume, :v_id, :s_id)

-- add resumeReview
INSERT INTO resumeReview (resume_id, Moderator_id, comments)
VALUES (:resume_id, :Moderator_id, :comments)

-- add interview
INSERT INTO interview (start_time, end_time, location, student_id, job_id)
VALUES (:start_time, :end_time, :location, :student_id, :job_id)

-- add jobs
INSERT INTO jobs (job_description, level_directed_to, ranking, company_name)
VALUES (:job_description, :level_directed_to, :ranking, :company_name)

-- add company
INSERT INTO company (company_name, info, number_of_employees, rating)
VALUES (:company_name, :info, :number_of_employees, :rating)

-- add grades
INSERT INTO grades (prof, university_id, student_id, letter, numerical_grade, course_id)
VALUES (:prof, :university_id, :student_id, :letter, :numerical_grade, :course_id)

-- add courses
INSERT INTO courses (course_name, course_description)
VALUES (:course_name, :course_description)

-- jobs_applied
INSERT INTO Moderator (first_name, last_name, user_id)
VALUES (:fname, :lname, :user_id)

