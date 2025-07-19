-- Montgomery County (MoCo) Tuition Assistance Analysis 

-- CHAPTER 1: Applying for the Tuition Assistance System 

-- Descrpition: Calculate and Identify those whose applicants did
-- were rejected in the tuition system due to probable causes in 
-- their application.

########################## ENTRY NOTES #########################

-- Use the following database
USE moco_tuition_assistance;

-- Write and identify each step of what you are going to code
-- on the analysis.

-- Use logicial reasoning to justify your claim.

###############################################################




############### TOPIC 1: Total Count of Acceptance and Rejected Applicants #############

-- QUESTION: How many applicants were accepted in the tuition assistance program from 
-- their employers and their degree status?

-- HINT: Count how many of those were accepted in their tuition assistance program
-- by their personnel, degree, and cost.

-- NOTE: Accepted in tuition paid is > '$0.00'. 
--       Rejected in tuition paid is = '$0.00'.

-- Part A). Total Count by Each Personnel Whose Acceptance Resulted in Tuition Being Paid
-- Accepted in tuition paid is > '$0.00'. 

-- 1). Total Applicants Accepted in General by Employee's Department.
USE moco_tuition_assistance;
SELECT t.Department_Name AS "Applicant's Employer Classification",
	   COUNT(t.Department_Name) AS "Total Applicants Accepted"
FROM 
   (SELECT 
		e.emp_id,
        d.dept_id,
		d.Department_Name,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost > '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY Department_Name
ORDER BY Department_Name ASC;

-- Explain: This shows that the majority of applicants by each department that 
-- they worked with have been accepted for the tuition assistance program, 
-- given that they met the requirements.


-- Since the audit wants us to investigate deeper based on their 
-- educational background as in the interest of the program, we can then 
-- specifically identify based on their current degree that they are pursuing aligned to 
-- their current employer.

-- 2). Total Applicants Accepted By Their Current Degree Status.
-- More specifically with their degrees.....
SELECT t.Department_Name AS "Applicant's Employer Classification",
	   t.Degree AS "Applicant's Intended Pursuit",
	   COUNT(t.Department_Name) AS "Total Applicants Accepted"
FROM 
   (SELECT 
		e.emp_id,
        d.dept_id,
        a.degree,
		d.Department_Name,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost > '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY Department_Name, Degree
ORDER BY Department_Name ASC;

-- Explain: This shows the total count of these accepted applicants by
-- each department were analyzed based on their degree status as a means 
-- of understanding the overall program logistics as well how it correlates
-- to the applicants' determination and progress, and the current budget
-- status by the county's tax dollars.


-- 3). Total Applicants Accepted By Their Current Major
USE moco_tuition_assistance;
SELECT t.major AS "Major Types",
	   COUNT(t.major) AS "Total Applicants"
FROM 
	(SELECT 
		e.emp_id,
        d.dept_id,
        a.degree,
		d.Department_Name,
        a.Major,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost > '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY major
ORDER BY major ASC;

-- EXPLAINATION: 


-- 4). Total Applicants Accepted By Courses Signed Up
USE moco_tuition_assistance;
SELECT Department_Name AS "Applicant's Name",
	   Course_Title AS "Course Name"
FROM Employee_Info e
	JOIN Applicant_Info a
		USING(emp_id)
	JOIN Department_Info d
		USING(dept_id)
	JOIN Course_Info c
		USING(course_id)
GROUP BY Department_Name, Course_Title, Cost
HAVING Cost > '0';

-- EXPLAINATION: 


-----------------------------------------------------------------------------------


-- Part B). Total Count by Each Personnel Whose Rejections Resulted in Tuition NOT Being Paid
-- Rejection in tuition paid is = '$0.00'.

-- QUESTION: How many applicants were rejected in the tuition assistance program from 
-- their employers and their degree status?
 

-- 1). Total Applicants Rejected in General by Employee's Department.
USE moco_tuition_assistance;
SELECT t.Department_Name AS "Applicant's Name",
	   COUNT(t.Department_Name) AS "Total Applicants Rejected"
FROM 
   (SELECT 
		e.emp_id,
        d.dept_id,
		d.Department_Name,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost = '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY Department_Name
ORDER BY Department_Name ASC;


-- 2). Total Applicants Rejected By Their Current Degree Status.
SELECT t.Department_Name AS "Applicant's Name",
	   t.Degree AS "Applicant's Intended Pursuit",
	   COUNT(t.Department_Name) AS "Total Applicants REjected"
FROM 
   (SELECT 
		e.emp_id,
        d.dept_id,
        a.degree,
		d.Department_Name,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost = '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY Department_Name, Degree
ORDER BY Department_Name ASC;

-- Explain: Based on this, this raises a question as to see why these applicants 
-- below were not accepted in their benefit application. This may result from the
-- incompletion of their application phrase to the audit progress that result them 
-- being rejected because of failing requirements. This therefore flagged my interest
-- in digging deeper in the process that lead to their rejection.

-- Possible grounds may included, but not limited to low GPAs when they applied for the 
-- program that they attended previously in which the programm coordinator need a grade
-- report to meet requirements listed.

-- However, since there are 30 rows listed both the applicant and the employee database, we 
-- need to gather more info by adding more rows that would help holistically on what lead to
-- this phrase.


-- 3). Total Applicants Rejected By Their Current Major
USE moco_tuition_assistance;
SELECT t.major AS "Major Types",
	   COUNT(t.major) AS "Total Applicants"
FROM 
	(SELECT 
		e.emp_id,
        d.dept_id,
        a.degree,
		d.Department_Name,
        a.Major,
		a.Cost
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	WHERE a.Cost = '0'
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY major
ORDER BY major ASC;

-- EXPLAINATION: 









###########################################################################################





########################## TOPIC #2: Applicant Rejection Info  #########################

-- QUESTION: Find how many applicants were rejected in their 
-- tuition assistance system with the identification that has the 
-- marked cost as '0.00'. 

USE moco_tuition_assistance;
SELECT Department_Name AS "Applicant's Name",
	   Degree AS "Applicant's Intended Pursuit",
       Cost AS "Total Paid for this Semester"
FROM Employee_Info e
	JOIN Applicant_Info a
		USING(emp_id)
	JOIN Department_Info d
		USING(dept_id)
GROUP BY Department_Name, Degree, Cost
HAVING Cost = '0';


############ Question 3: List of Applicant's Reasoning on their Rejection #############

-- Second Question: Finding applicants that were rejected in their
-- tuition assistance based on their course info 

-- This does require more info on this part.

USE moco_tuition_assistance;
SELECT Department_Name AS "Applicant's Name",
	   Course_Title AS "Course Name"
FROM Employee_Info e
	JOIN Applicant_Info a
		USING(emp_id)
	JOIN Department_Info d
		USING(dept_id)
	JOIN Course_Info c
		USING(course_id)
GROUP BY Department_Name, Course_Title, Cost
HAVING Cost = '0'; -- where this applicant got rejected on their application.


-- HOMEWORK: Investigate further on what happened in this case based on your findings!!!!!

-- Reasons for the code

-- According to the text of the Montgomery County's Database, it says that 
-- "this dataset [only] includes a list of classes approved and paid through
-- the County tuition assistance program", which explains the data audit for this 
-- project. 

-- While we do not yet know why this happened based on few evidence as provided in 
-- this database, we can, however, give predicive thoughts as to what and how 
-- these courses listed below are not eligible for tuition assistance.
-- The following below may be an educated reason as to show with this cause.

 -- 1). Applicant lacked prior learning experience due to prerequistes that 
 -- were insuitable as to how this applicant can demonstrate his/her ability
 -- to perform their work without interferring their offical work duties (aka 
 -- time management). The applicant needs to be reasonable in a way that is 
 -- reliastic as to how this course is relevant to their career goals in this
 -- insitution before proceduring this benefit.
 
 -- NOTE: This is supported on the findings based on the 2005 IRS Tuition 
 -- Assistane Program Report in this evidence on this data analysis both on the
 -- federal level and on this county open data.
 
 
 -- 2). Applicant did not demonstrate how this course benefits their goals 
 -- in their current work performance. The applicant lacked reasoning on grounds
 -- that weree not being sufficent based on their reasoning
 -- that this applicant can show that their course 
 -- would accomplish not only their goals, but also in their personnel 
 -- values and the institution they work with. The applicant needs to give
 -- a solid reasoning that would help justify based on the back that they 
 -- wanted to take this course in a desireable manner, not based on lack of 
 -- understanding (which again is tied to to first thought).



##############################################################################