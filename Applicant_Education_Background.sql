-- Montgomery County (MoCo) Tuition Assistance Analysis 

-- CHAPTER 2: Education Background in the MoCo Tuition Assistance Program

-- Descrpition: To understand the holistic details of the applicant's
-- background and intentions of pursuing a career or interest in the
-- county's own incentive program.

########################## ENTRY NOTES #########################

-- Use the following database
USE moco_tuition_assistance;

-- Write and identify each step of what you are going to code
-- on the analysis.

-- Use logicial reasoning to justify your claim.

-- Follow the guidelines from the notes that were written 

###############################################################


############### TOPIC 1: Total Enrollement by Each Degree Level (General) #############

-- PART I: What is the total enrollment by each degree level (AA, Bachelors', Masters'
-- Doctorate, Non-Degrees)?

SELECT Degree AS 'Degree Level',
	   COUNT(Degree) AS 'Total Degrees on All Applicants'
FROM Applicant_Info
GROUP BY Degree
ORDER BY Degree ASC;

-- Dig deeper on the specifics below...

-- PART II: What is the total enrollment by each degree level (AA, Bachelors', Masters'
-- Doctorate, Non-Degrees) By Each Employer (Departments)?

SELECT t.Department_Name AS "Applicant's Name",
	   t.Degree AS "Applicant's Intended Pursuit",
	   COUNT(t.Department_Name) AS "Total Applicants by Degree Level"
FROM 
   (SELECT 
		e.emp_id,
        d.dept_id,
        a.degree,
		d.Department_Name
    FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	GROUP BY e.emp_id, d.dept_id, d.Department_Name)t
GROUP BY Department_Name, Degree
ORDER BY Department_Name ASC;

-- Explaination: For each applicant by their employers, their applicant status 
-- are based on their current degree that they are pursing at the time that they
-- signed up in their program. This is the beginning of where their academic progress
-- begins in which we would determine if this have to do with their career interests in 
-- the employment that they are currently working on or for their own interests.



###########################################################################################


################## TOPIC 2: Applicant's Major and Career Pursuits ###################

-- Part I: How many applicants total who are in the specified major?

USE moco_tuition_assistance;

WITH total_applicants AS (
	SELECT major AS "Major Types",
		COUNT(major) AS "Total Applicants"
	FROM Applicant_Info
	GROUP BY major
	ORDER BY major ASC)

SELECT *
FROM total_applicants;

-- EXPLAINATION: This shows the list of applicants who represent the major in all
-- diverse areas, given with a broader scopes of the applicants' picture.

-- PART II: How many applicants by each major on their specific degree?
USE moco_tuition_assistance;

WITH total_applicants_by_major AS (
	SELECT major AS "Major Types",
		   degree AS "Degree Status",
		   COUNT(major) AS "Total Applicants"
	FROM Applicant_Info
	GROUP BY major, degree
	ORDER BY major ASC)

SELECT *
FROM total_applicants_by_major;

-- EXPLAINATION: This shows the list of applicants by their major that they are currently
-- planning to complete based on their current degree status.

-- Question to Ponder: Why are the majority of applicants who are currently working on the 
-- degrees have the word "Non-listed" or "Not Specifed" (as equivient to Undecided) and 
-- stil get in the tutition assistance program?


-- PART III: How many specifically by each degree and department that applicants are in their
-- same major?

-- HINT: You may need a subquery on this

SELECT t.Department_Name AS 'Applicant Name',
	   t.Degree AS 'Degree Status',
       t.Major AS 'Current Major',
       COUNT(t.Department_Name) AS 'Total Applicants'
FROM 
	(SELECT e.emp_id,
			e.dept_id,
            d.Department_Name,
            a.Degree,
            a.Major
	 FROM employee_info e
		JOIN applicant_info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	 GROUP BY emp_id, dept_id, Degree, Major)t
GROUP BY Department_Name, Degree, Major
ORDER BY Department_Name ASC;

-- HW of This week 
-- Review again to find your findings in this table and come up in your report...


-- Explaination: In this scenario, we looked to see if the applicant who represent 
-- to their current job status are relevant to their current major, which would help 
-- correlation whether the applicant would be successful in learning their own pursuits.
-- Furthermore, we investigated to see if there is a significant correlation between their
-- job status and the major they are currently studying to see if they are linked based on their
-- job relevancy or their own personal pursuits to further growth their own skills. 

-- In this case, some of the applicants who are represented in the key departments like  
-- Finance, Health and Human Services and State's Attorney have some connections in regards to 
-- their current major based on the job skills and concepts that are matched to their 
-- interests whereas others weren't. For instance, in the Health and Human Services,
-- there were some applicants who had 'pre-nursuing', 'health & human services', and
-- 'psychology' majors, in which all three had a similar connection to their current 
-- job, which was one of the main reasons why a tuition assistance program was need
-- to further pursue their own interests in connection to their job dutites.

-- This gives a start to a broader picture in terms of this question outlined.


###########################################################################################




############### Question 3: Percentage of Applicants based on Major and Degree #############

-- PURPOSE: To correlate how their major and degree can impact the workforce needs of 
-- the county government based on their employer.


-- A). Percentage of Applicants by Degree Status and the Workforce Amount in the County Government
USE moco_tuition_assistance;

WITH amount_all_county_employees_in_workforce AS
	(SELECT Department_Name AS "Employer Type",
			Degree AS "Degree Name",
			COUNT(Department_Name) AS "Total Employees",
			COUNT(Department_Name)/401 AS 'Percentage of Workforce' -- Total Employees in Sample.
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Department_Info
			USING(dept_id)	
	GROUP BY Department_Name, Degree
    -- Type in the specific employer type
    HAVING Department_Name = 'Police'
    ORDER BY COUNT(Department_Name) DESC)
    
SELECT *
FROM amount_all_county_employees_in_workforce;

-- EXPLAINATION: This shows the amount of employees in a specific department on the all
-- county employees that will address the needs for the county workforce. This will 
-- help indicate whether degrees on each employee would address the county's mission based on
-- critcial goals. 


-- B). Percentage of Applicants by Major Status and the Workforce Amount in the County Government

WITH major_critical_county_workforce AS (
	SELECT Department_Name AS "Employer Type",
			Major AS "Major Name",
			COUNT(Department_Name) AS "Total Employees",
			COUNT(Department_Name)/401 AS 'Percentage of Workforce' -- Total Employees in Sample.
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Department_Info
			USING(dept_id)	
	GROUP BY Department_Name, Major
    -- Type in the specific employer type
    HAVING Department_Name = 'Police'
    ORDER BY COUNT(Department_Name) DESC)

SELECT *
FROM major_critical_county_workforce;

-- EXPLAINATION: To support the needs for the workforce, the county needs applicants who are
-- suited to fit for their mission and roles. We chose the MCPD (Montgomery County Police)
-- as the highlight for the MoCo Tutition Assistance analysis because there were many applicants
-- who signed up for the program, in which the majority stated that they chose "Criminal Justice"
-- as their major that lead 0.0698 (6.98%) of the total workforce for the entire county. This means
-- those who selected CCJS were able to fulfil their majors as it directly links to their job 
-- mission.

###########################################################################################



############### TOPIC 5: Perentage of Applicant Degree in the County Workforce#############

-- RETURNING TO PART I: What is the total enrollment by each degree level (AA, Bachelors', Masters'
-- Doctorate, Non-Degrees)?

WITH percent_degree_app AS (
	SELECT Degree AS 'Degree Level',
		   COUNT(Degree) AS 'Total Degrees on All Applicants',
		   COUNT(Degree)/401 AS 'Percentage of Workforce' -- Sample Size
	FROM Applicant_Info
	GROUP BY Degree
	ORDER BY Degree ASC)
    
SELECT *
FROM percent_degree_app;




###########################################################################################



############### Question 5:  #############

-- QUESTION:





###########################################################################################