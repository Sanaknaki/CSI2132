
## Step1. [2 marks]

Please submit a PDF file that includes the following:

1. group name, team members (names, ID,  and lab number of each member (e.g., B01) )

   **Kritika Wadhera**, 8234314,B02

   **Abdulwahaab Ahmed**, 8260269,B02
   
    **Ali Sanaknaki**,  7745880, B02
    
    **Karim Chukfeh**, 6694525, B02

2. Provide the selected project title (title of project 1 or 2). This will be your final choice for the rest of the semester, so read both projects carefully. 

    We have decided to do project 2, the Co-op database system.
3. Describe the selected project more clearly. 

    The selected project is a website that allows co-op students to find placements for Engineering jobs. With the jobs, there will be the ability for users to post reviews for the company or specific jobs.  There would be reports which are available for users to see regarding most frequent job categories, best 5 companies and best job posting. These reports are based off users evaluations. The users can review jobs and companies such as GlassDoor, it also allows the users to review the different aspects that comes with each job, including the interview process to the actual job, they can even include personal experience and are able to write the salary they received as a reference for others. Users are able to upload their personal resume for moderators to review. All the jobs within this system will specify which level of students they require and then when the job is posted,a notification would be sent to all users of that level informing them that a new job has been posted.
4. What are the possible entities, attributes and relations? If you may include specifications or generalization in your design.  
    - **Possible entities:**    User
    Student(subclass of User,overlapping)
    Moderator(subclass of User,overlapping)
    Company
    Jobs
    Program
    Resume
    Upvote
    Program_enrolled
    ResumeReview
    Grades
    Courses 
    University
    Program
    Jobs_applied
    Interview
    - **Possible attributes:**
    User(user_i.d(PK)email,username,password)
    Moderator(moderator_i.d(PK),first_name,last_name,User_id (FK))
    Student(student_i.d(PK),first_name,last_name,User_id (FK)) 
    Company(name(primary key), info, number_of_employees,rating)
    Jobs(info,level_directed_to,name(FK), ranking,job_i.d(PK))
    Program_enrolled(program_id(FK),student_id(FK),start_date,graduation,level,coop_required,credits_required)
    Program(program_i.d(PK),program_name,required_number_of_credits,university_i.d(FK))
    Resume(resume_id(primary key),version_id,resume,student_i.d(FK))
    ResumeReview(review_i.d(PK),resume_id (FK),moderator_i.d(FK),comments)
    Courses(Course_id(primary key), name,description)
    University(university_id(primary key), name)
    Grades(course_id(FK),prof,university_i.d(FK),student_id(FK),letter(derived),numerical_grade)
    Upvote(m_i.d,review_i.s,rating,date)(all foreign keys)
    Jobs_applied(student_id(FK),Job_i.d(FK))
    Interview(interview_i.d(PK).start_time,end_time,location,student_i.d(FK),job_i.d(FK))
    - **Possible relations:**
    Interview(Jobs,start_time,date_time)
    ResumeReviewRequest(resume_id,version_id)
    Apply(user_id, job_id)
    Upvote(moderator_i.d,resume_id)(both FK)

5. Specify any assumptions that you may add for designing the database and for its use. This is just outlining your thoughts and initial design.  

    This system will be used for different universities.

6. Provide the initial list of possible SQL DML that a user can use to manipulate the data in your system (work for the bonus from now!). 

    ```sql
    -- ======================
    -- INSERT STATEMENTS
    -- ======================

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
    INSERT INTO jobs_applied (student_id, job_id)
    VALUES (:student_id, :job_id)

    -- ======================
    -- DELETE STATEMENTS
    -- ======================

    -- Delete a student
    DELETE FROM student
     WHERE student_id = :student

    -- Delete a user
    DELETE FROM user
     WHERE user_id = :user_id

    -- Delete a Moderator
    DELETE FROM Moderator
     WHERE Moderator_id = :Moderator_id
    -- Delete program
    DELETE FROM program
     WHERE program_id = :program_id

    -- Delete university
    DELETE FROM university
     WHERE university_id = :university_id

    -- Delete program enrolled
    DELETE FROM program_enrolled
     WHERE student_id = :student_id
       AND level = :level

    -- Delete upvote
    DELETE FROM upvote
     WHERE Moderator_id = :Moderator_id
       AND User_id = :User_id

    -- Delete resume
    DELETE FROM resume
     WHERE resume_id = :resume_id

    -- Delete resumeReview
    DELETE FROM resumeReview
     WHERE review_id = :review_id

    -- Delete interview
    DELETE FROM interview
     WHERE interview_id = :interview_id

    -- Delete jobs
    DELETE FROM jobs
     WHERE job_id = :job_id

    -- Delete company
    DELETE FROM company
     WHERE company_name = :company_name

    -- Delete grades
    DELETE FROM grades
     WHERE student_id = :student_id
       AND course_id = :course_id
    -- Delete courses
    DELETE FROM courses
     WHERE course_id = :course_id

    -- jobs_applied
    DELETE FROM jobs_applied
     WHERE student_id = :student_id
       AND job_id = :job_id

    -- ======================
    -- UPDATE STATEMENTS
    -- ======================
    -- update username
    UPDATE user
       SET username = :new_username
     WHERE username = :old_username
    -- update password
    UPDATE user
       SET password = :password
     WHERE username = :username
    -- update email
    UPDATE user
       SET email = :email
     WHERE username = :username
    -- update interview start
    UPDATE interview
       SET start = :start
     WHERE interview_id = :interview_id
    -- update interview end
    UPDATE interview
       SET end = :end
     WHERE interview_id = :interview_id
    -- update interview location
    UPDATE interview
       SET location = :location
     WHERE interview_id = :interview_id

    -- ======================
    -- SELECT STATEMENTS
    -- ======================
    -- select student_info
    SELECT *
      FROM student AS S
      JOIN program_enrolled AS PE
        ON S.student_id = PE.student_id
      JOIN program AS P
        ON P.program_id = PE.program_id
     WHERE S.student_id = :student_id

    -- select students grade
    SELECT G.numerical_grade, G.letter, C.course_name
      FROM student AS S
      JOIN grades AS G
        ON G.student_id = S.student_id
      JOIN courses AS C
        ON C.course_id AS G.course_id
     WHERE S.student_id = :student_id

    -- select job applied
    SELECT J.*
      FROM jobs_applied AS A
      JOIN jobs AS J
        ON J.job_id = A.job_id
      JOIN student AS S
        ON S.student_id = A.student_id
     WHERE S.student_id = :student_id

    -- select interviews
    SELECT I.start_time, I.end_time, I.location
      FROM interview AS I
      JOIN jobs AS J
        ON J.job_id = I.job_id
      JOIN student AS S
        ON S.student_id = I.student_id
      JOIN company AS C
        ON C.company_name = I.company_name
    -- select jobs
    SELECT J.job_description, C.company_name
      FROM jobs AS J
      JOIN company AS C
        ON company_name = company_name

    -- select companies
    SELECT company_name
      FROM company
    ```

7. Specify any possible triggers or assertions (can be implemented using triggers in PsotgreSQL, but you need to specify them). You need to summarize the triggers and assertions already given and add more to them. The system should provide functionalities for both regular users and admin user of the system. TA is not your database administrator (work for the bonus from now!). 

    CREATE TRIGGER upvote_increase
    AFTER UPDATE ON Upvote
    Update INTO Old.rating=Old.rating+1
    To add to the upVotes.
    
    When users add comments, need to ensure that they are not empty. The same goes for when a user is creating an account, they must provide all the information required. EG.
    CREATE ASSERTION not_null_constraint
    CHECK (i.d FROM User !=null ) 
    The other assertions would be roughly the same, therefore they is no need to repeat them.


8. You may consult websites, references or even contact users, so that you come up with more detailed description and assumptions. You need to include your references. 

 The websites we consulted were the Co-op navigator, GlassDoor,Work Study navigator and Indeed.
