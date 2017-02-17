## Step1. [2 marks] [Due: Wednesday February 15th @ 11:49 pm] 

Please submit a PDF file that includes the following:

1. group name, team members (names, ID,  and lab number of each member (e.g., B01) )
  - **Kritika Wadhera**, 8234314,B02
  - **Abdulwahaab Ahmed**, 8260269,B02
  - **Ali Sanaknaki**,  , B02
  - **Karim Chukfeh**, 6694525, B02

2. Provide the selected project title (title of project 1 or 2). This will be your final choice for the rest of the semester, so read both projects carefully. 

  We have decided to do project 2, the Co-op database system.

3. Describe the selected project more clearly. 
The selected project is a website that allows co-op students to find placements for Engineering jobs. With the jobs, there will be the ability for users to post reviews for the company or specific jobs. The users can also review 
The	project	aims	to	develop	a	simple	website	catered	to	co-op	students	looking	to	find	co-op	placements	in	Engineering.	It	will	allow	users	to	post	reviews	and	other	information	regarding	specific	positions,	or	in	general,	at	any	given	company	(think	Glassdoor).	As	with	Glassdoor,	users	can	review	different	aspects	of	each	position,	from	interview	experience,	to	on-the-job	experience,	to	salary.	Users	can	also	upvote	specific	reviews	they	found	useful.	To	help	users	improve	their	resume,	users	can	upload	their	resume	for	moderators	to	review.	We	will	keep	a	versioned	history	of	a	user’s	resume	uploads,	simplifying	the	review	process	by	associating	comments	with	a	particular	version,	and	allowing	users	to	track	the	evolution	of	their	resumes.	The	jobs	provided	in	this	system	should	target	the	student	levels,	as	students	in	lower	level	in	the	program	cannot	compete	with	students	in	higher-level	and	who	has	a	previous	co-op	experience.		A	notification	can	be	sent	to	users	(according	to	their	level)	for	a	new	job	posting.	Also	the	users	can	see	
reports	like	best	job	posting,	most	frequent	job	category,	and	best	5	companies	with	respect	to	student	evaluation	..	etc.

4. What are the possible entities, attributes and relations? If you may include specifications or generalization in your design.  
  - Possible entities:User,Moderator(could be a subclass of User), Company, Jobs, Program,Resume,Upvote
  - Possible attributes:User(name,email, program , level,password,rating), Moderator(same as User, with something else which makes it distinct), Company(name, info, number_of_employees,rating ),Jobs(info,level_directed_to,company, ranking,Pk(Job_i.d)),Progrram
  - Possible relations:Interview(Foreign key(Jobs),start_time,date_time)

5. Specify any assumptions that you may add for designing the database and for its use. This is just outlining your thoughts and initial design.  

6. Provide the initial list of possible SQL DML that a user can use to manipulate the data in your system (work for the bonus from now!). 

7. Specify any possible triggers or assertions (can be implemented using triggers in PsotgreSQL, but you need to specify them). You need to summarize the triggers and assertions already given and add more to them. The system should provide functionalities for both regular users and admin user of the system. TA is not your database administrator (work for the bonus from now!). 

8. You may consult websites, references or even contact users, so that you come up with more detailed description and assumptions. You need to include your references. 
