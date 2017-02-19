
## Step1. [2 marks] [Due: Wednesday February 15th @ 11:49 pm] 

Please submit a PDF file that includes the following:

1. group name, team members (names, ID,  and lab number of each member (e.g., B01) )
  - **Kritika Wadhera**, 8234314,B02
  - **Abdulwahaab Ahmed**, 8260269,B02
  - **Ali Sanaknaki**,  7745880, B02
  - **Karim Chukfeh**, 6694525, B02

2. Provide the selected project title (title of project 1 or 2). This will be your final choice for the rest of the semester, so read both projects carefully. 

  We have decided to do project 2, the Co-op database system.

3. Describe the selected project more clearly. 
  
  The selected project is a website that allows co-op students to find placements for Engineering jobs. With the jobs, there will be the ability for users to post reviews for the company or specific jobs.  There would be reports which are available for users to see regarding most frequent job categories, best 5 companies and best job posting. These reports are based off users evaluations. The users can review jobs and companies such as GlassDoor, it also allows the users to review the different aspects that comes with each job, including the interview process to the actual job, they can even include personal experience and are able to write the salary they received as a reference for others. Users are able to upload their personal resume for moderators to review. All the jobs within this system will specify which level of students they require and then when the job is posted,a notification would be sent to all users of that level informing them that a new job has been posted.

4. What are the possible entities, attributes and relations? If you may include specifications or generalization in your design.  

  - Possible entities:User,Student(subclass of User,overlapping),Moderator(subclass of User,overlapping), Company, Jobs, Program,Resume,Upvote,Program_enrolled, ResumeReview, Grades,Courses,University
  
  - Possible attributes:User(i.d(primary key),name,email, program,level,password,rating), Moderator(same as User, number_of_resumes_reviewed) ,Student(same as User, student_i.d,program_i.d) Company(name(primary key), info, number_of_employees,rating ),Jobs(info,level_directed_to,company, ranking,Pk(Job_i.d)),Program_enrolled(program_id,start_date,graduation,co-op_required,credits_required),Resume(resume_i.d(primary key),version_i.d), ResumeReview(resume_i.d,version_i.d),Courses(Course_id(primary key), prof,university_i.d),University(university_i.d(primary key), location),Grades(course_i.d,student_i.d,letter(derived),numerical_grade).
  
  - Possible relations:Interview(Jobs,start_time,date_time),ResumeReviewRequest(resume_i.d,version_i.d),Upvote(user_i.d,review_i.d)

5. Specify any assumptions that you may add for designing the database and for its use. This is just outlining your thoughts and initial design.  

  This system will be used for different universities.

6. Provide the initial list of possible SQL DML that a user can use to manipulate the data in your system (work for the bonus from now!). 

7. Specify any possible triggers or assertions (can be implemented using triggers in PsotgreSQL, but you need to specify them). You need to summarize the triggers and assertions already given and add more to them. The system should provide functionalities for both regular users and admin user of the system. TA is not your database administrator (work for the bonus from now!). 

8. You may consult websites, references or even contact users, so that you come up with more detailed description and assumptions. You need to include your references. 

We used the Co-op navigator, GlassDoor and Work Study navigator as references.
