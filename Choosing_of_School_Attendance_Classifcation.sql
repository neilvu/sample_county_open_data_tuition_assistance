-- Montgomery County (MoCo) Tuition Assistance Analysis 

-- CHAPTER 3: Choosing of School (By Applicant's Choice)

-- Descrpition: To understand where the applicant went in his/her school choice, we
-- want to analyze based on their decision to attend there because of cost, their
-- residency status and whether if this school is the right place for them 
-- based on their education background as discussed previously.

########################## ENTRY NOTES #########################

-- Use the following database
USE moco_tuition_assistance;

-- Write and identify each step of what you are going to code
-- on the analysis.

-- Use logicial reasoning to justify your claim.

-- Follow the guidelines from the notes that were written 

###############################################################




########################## TOPIC 1: School Attendance Overall by Applicants  #########################

-- QUESTION: How many applicants did they attend at their respective schools?

-- NOTE: Use overall of applicants based on their school attended, NOT by their roles
-- as it will differ based on where they were assigned to that category that are different.

USE moco_tuition_assistance;
SELECT Degree AS "Type of Degree",
	   Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS "Number of Applicants Attended"
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Degree, Institution_Name
ORDER BY Degree ASC;


-- EXPLAINATION: 


-- QUESTION: List of applicants who applied and currently attended to these schools/institutions.
-- NOTE: These include those who were accepted or rejected in their application.
USE moco_tuition_assistance;
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS "Number of Applicants Attended"
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
ORDER BY Institution_Name ASC;


-- EXPLAINATION: This shows the overall attendance of students by their institutions respectively.


-- QUESTION: Rank the top 5 institutions highest and lowest for all applicants applied 
-- (regardless of their degrees)

-- Top 5 Institution by HIGHEST Applicants
USE moco_tuition_assistance;
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS "Number of Applicants Attended"
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
HAVING COUNT(Institution_Name) > 20
ORDER BY COUNT(Institution_Name) DESC;


-- Mid Applicants By Their Institutions
-- (Between 10 to 20 applicants)
USE moco_tuition_assistance;
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS "Number of Applicants Attended"
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
HAVING COUNT(Institution_Name) < 20 AND COUNT(Institution_Name) > 9
ORDER BY COUNT(Institution_Name) DESC;


-- Lowest Applicants By Their Institutions 
-- (Fewer than 10 applicants)
USE moco_tuition_assistance;
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS "Number of Applicants Attended"
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
HAVING COUNT(Institution_Name) < 10
ORDER BY COUNT(Institution_Name) DESC;


-- EXPLAINATION: This shows the first top institutions that applicants normally attend by their
-- choice as well the middle and the bottom. This shows to see where applicants most likely 
-- attend school and if they are based on the following factors such as school reputations,
-- availablity of majors and student needs, and the commute from their assigned work in 
-- Montgomery County Government.



#############################################################################################



########################## TOPIC 2: School Classification (Public, Private, Company)  #########################

-- List of institutions who are typed as public, private or company
CREATE OR REPLACE VIEW school_classification AS
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS 'Total Applicants Attended',
CASE
    -- 1). Private Schools
    WHEN Institution_Name = 'UNIVERSITY OF PHOENIX' THEN 'PRIVATE'
    WHEN Institution_Name = 'STRAYER UNIVERSITY.' THEN 'PRIVATE'
    WHEN Institution_Name = 'Southern New Hampshire University (SNHU)' THEN 'PRIVATE'
	WHEN Institution_Name = 'Robert Morris University (RMU)' THEN 'PRIVATE'
	WHEN Institution_Name = 'CORNELL UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'JOHNS HOPKINS UNIVERSITY (JHU)' THEN 'PRIVATE'
    WHEN Institution_Name = 'Kaplan University' THEN 'PRIVATE'
    WHEN Institution_Name = 'Loyola College in Maryland' THEN 'PRIVATE'
	WHEN Institution_Name = 'CHAMBERLAIN COLLEGE OF NURSING' THEN 'PRIVATE'
    WHEN Institution_Name = 'Central Christian College of the Bible' THEN 'PRIVATE'
	WHEN Institution_Name = 'CAPITOL COLLEGE' THEN 'PRIVATE'
    WHEN Institution_Name = 'CAPELLA UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'BENEDICTINE UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'ASHWORTH COLLEGE' THEN 'PRIVATE'
    WHEN Institution_Name = 'ASHFORD UNIVERSITY' THEN 'PRIVATE'
    WHEN Institution_Name = 'ARGOSY UNIVERSITY' THEN 'PRIVATE'
    WHEN Institution_Name = 'American Public University System (APUS)' THEN 'PRIVATE'
    WHEN Institution_Name = 'AMERICAN MILITARY UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'American College of Physicians (ACP)' THEN 'PRIVATE'
    WHEN Institution_Name = 'PENN FOSTER COLLEGE' THEN 'PRIVATE'
	WHEN Institution_Name = 'GALLAUDET UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'COLUMBIA UNION COLLEGE' THEN 'PRIVATE'
	WHEN Institution_Name = 'BOSTON UNIVERSITY (BU Boston)' THEN 'PRIVATE'
    WHEN Institution_Name = 'Weber State University' THEN 'PRIVATE'
    WHEN Institution_Name = 'WALDEN UNIVERSITY' THEN 'PRIVATE'
    WHEN Institution_Name = 'Villanova University' THEN 'PRIVATE'
    WHEN Institution_Name = 'STRAYER UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'HOWARD UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'BELLEVUE UNIVERSITY' THEN 'PRIVATE'
    WHEN Institution_Name = 'Waldorf College' THEN 'PRIVATE'
    WHEN Institution_Name = 'GEORGE WASHINGTON UNIVERSITY (GWU)' THEN 'PRIVATE'
    WHEN Institution_Name = 'GEORGETOWN UNIVERSITY' THEN 'PRIVATE'
	WHEN Institution_Name = 'LIBERTY UNIVERSITY' THEN 'PRIVATE'
    -- 2). Public Schools
    WHEN Institution_Name = 'Arizona State University (ASU)' THEN 'PUBLIC'
    WHEN Institution_Name = 'BALTIMORE CITY COMMUNITY COLLEGE (BCCC)' THEN 'PUBLIC'
    WHEN Institution_Name = 'BOWIE STATE UNIVERSITY (BSU)' THEN 'PUBLIC'
    WHEN Institution_Name = 'COLUMBIA SOUTHERN UNIVERSITY' THEN 'PUBLIC'
    WHEN Institution_Name = 'COMMUNITY COLLEGE OF BALTIMORE COUNTY (CCBC)' THEN 'PUBLIC'
    WHEN Institution_Name = 'FREDERICK COMMUNITY COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'GEORGE MASON UNIVERSITY (GMU)' THEN 'PUBLIC'
    WHEN Institution_Name = 'HAGERSTOWN COMMUNITY COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'Harrisburg Area Community College - Harrisburg' THEN 'PUBLIC'
    WHEN Institution_Name = 'HOOD COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'HOWARD COMMUNITY COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'Montgomery College Rockville Campus (MC Rockville)' THEN 'PUBLIC'
    WHEN Institution_Name = 'MONTGOMERY COMMUNITY COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'MONTGOMERY COUNTY COLLEGE' THEN 'PUBLIC'
    WHEN Institution_Name = 'MONTGOMERY COUNTY COMMUNITY COLLEGE' THEN 'PUBLIC'
	WHEN Institution_Name = 'MORGAN STATE UNIVERSITY' THEN 'PUBLIC'
	WHEN Institution_Name = "Mount St Mary's University" THEN 'PUBLIC'
	WHEN Institution_Name = 'NORTHERN VIRGINIA COMMUNITY COLLEGE (NVCC)' THEN 'PUBLIC'
	WHEN Institution_Name = 'PENNSYLVANIA STATE UNIVERSITY' THEN 'PUBLIC'
    WHEN Institution_Name = "PRINCE GEORGE'S COMMUNITY COLLEGE (PGCC)" THEN 'PUBLIC'
	WHEN Institution_Name = 'Purdue University' THEN 'PUBLIC'
    WHEN Institution_Name = 'SALISBURY UNIVERSITY' THEN 'PUBLIC'
	WHEN Institution_Name = 'Shippensburg University of Pennsylvania' THEN 'PUBLIC'
    WHEN Institution_Name = 'UNIVERSITY OF BALTIMORE (UB)' THEN 'PUBLIC'
	WHEN Institution_Name = 'UNIVERSITY OF FLORIDA' THEN 'PUBLIC'
	WHEN Institution_Name = 'University of Maryland - Baltimore (UMB)' THEN 'PUBLIC'
	WHEN Institution_Name = 'University of Maryland - Baltimore County (UMBC)' THEN 'PUBLIC'
    WHEN Institution_Name = 'University of Maryland - College Park (UMD/UMCP)' THEN 'PUBLIC'
	WHEN Institution_Name = 'UNIVERSITY OF MARYLAND AT SHADY GROVE CENTER (USG/USMD)' THEN 'PUBLIC'
    WHEN Institution_Name = 'University of Maryland Global Campus (UMGC/UMUC)' THEN 'PUBLIC'
    WHEN Institution_Name = 'UNIVERSITY OF THE DISTRICT OF COLUMBIA (UDC)' THEN 'PUBLIC'
    WHEN Institution_Name = 'Wilmington University' THEN 'PUBLIC'
    -- 3). Company
    WHEN Institution_Name = 'Shemer Bar Review, LLC.' THEN 'COMPANY'
    WHEN Institution_Name = 'VEHICLE DYNAMICS INSTITUTE (VDI)' THEN 'COMPANY'
    WHEN Institution_Name = 'The SANS (SysAdmin, Audit, Network, Security) INSTITUTE' THEN 'COMPANY'
    WHEN Institution_Name = 'The Newberry Group, Inc' THEN 'COMPANY'
    WHEN Institution_Name = 'The Chicago School of Professional Psychology' THEN 'COMPANY'
    WHEN Institution_Name = 'THE CENTER FOR ALTERNATIVE DISPUTE RESOLUTION.' THEN 'COMPANY'
    WHEN Institution_Name = 'SIGNET NORTH AMERICA' THEN 'COMPANY'
    WHEN Institution_Name = 'School of PE' THEN 'COMPANY'
    WHEN Institution_Name = 'ROPES THAT RESCUE LTD.' THEN 'COMPANY'
    WHEN Institution_Name = 'Remote Medical International' THEN 'COMPANY'
    WHEN Institution_Name = 'PUBLIC AGENCY TRAINING COUNCIL' THEN 'COMPANY'
    WHEN Institution_Name = 'PAT MCCARTHY PRODUCTIONS, INC' THEN 'COMPANY'
    WHEN Institution_Name = 'OFFICE OF EDUCATION AND TRAINING FOR ADDICTION SERVICES' THEN 'COMPANY'
    WHEN Institution_Name = 'NIGP: The Institute for Public Procurement' THEN 'COMPANY'
    WHEN Institution_Name = 'NATIONAL ASSOCIATION OF HOUSING AND REDEVELOPMENT OFFICIALS' THEN 'COMPANY'
    WHEN Institution_Name = 'MD SHRM STATE COUNCIL.' THEN 'COMPANY'
    WHEN Institution_Name = 'MD SHRM State Council' THEN 'COMPANY'
    WHEN Institution_Name = 'MCKISSOCK, LP' THEN 'COMPANY'
    WHEN Institution_Name = 'Green Ops' THEN 'COMPANY'
    WHEN Institution_Name = 'GLOCK PROFESSIONAL, INC' THEN 'COMPANY'
    WHEN Institution_Name = 'GEORGIA K9 NTC, LLC' THEN 'COMPANY'
    WHEN Institution_Name = 'Human Resources Institute' THEN 'COMPANY'
    WHEN Institution_Name = 'INTERNATIONAL ASSOCIATION OF COMPUTER INVESTIGATIVE SPECIALIST' THEN 'COMPANY'
    WHEN Institution_Name = 'JOHN E. REID AND ASSOCIATES, INC.' THEN 'COMPANY'
    WHEN Institution_Name = 'Force Science Institute, LTD.' THEN 'COMPANY'
    WHEN Institution_Name = 'Environmental Systems Research Institute (ESRI)' THEN 'COMPANY'
    WHEN Institution_Name = 'COLT DEFENSE LLC' THEN 'COMPANY'
    WHEN Institution_Name = 'Center for Excellence in EMDR Therapy' THEN 'COMPANY'
	WHEN Institution_Name = 'Breastfeeding Outlook' THEN 'COMPANY'
    WHEN Institution_Name = 'BORRA CPA REVIEW' THEN 'COMPANY'
    WHEN Institution_Name = 'BERLITZ LANGUAGE CENTER' THEN 'COMPANY'
    WHEN Institution_Name = 'Appraisal Institute' THEN 'COMPANY'
    WHEN Institution_Name = 'American Institute of Certified Public Accountants' THEN 'COMPANY'
	WHEN Institution_Name = 'ACADEMI' THEN 'COMPANY'
	WHEN Institution_Name = 'PUBLIC AGENCY TRAINING COUNCIL' THEN 'COMPANY'
    WHEN Institution_Name = 'School of PE' THEN 'COMPANY'
    WHEN Institution_Name = 'PESI  ---CONTINUING EDUCATIOIN SEMINARS' THEN 'COMPANY'
    WHEN Institution_Name = 'THE CENTER FOR ALTERNATIVE DISPUTE RESOLUTION' THEN 'COMPANY'
ELSE 'N/A' -- if no classification is found on that specificed result value.
END AS Classification
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
-- Search it here by public, private or company
-- To see it all, omit this line only
#HAVING Classification = 'PUBLIC'
ORDER BY Institution_Name ASC;

SELECT *
FROM school_classification;


-- EXPLAINATION: This shows the classification of who are listed as public and private as well with 
-- companies to see where the courses and degrees are aligned to their institutions.


-- Analyzing based on Institution Types 
SELECT Classification,
	   COUNT(Classification) AS 'Total Institutions'
FROM school_classification
GROUP BY Classification;

-- EXPLAINATION: This shows the amount of institution classification of who are listed as public and private as well with 
-- companies to see where the courses and degrees are aligned to their institutions.




############### TOPIC 3: In State Vs. Out of State Cost Rating #############

-- QUESTION: Calculated how many ins-state or out-of-state applicants in each institution by
-- tutition based on their degree status.

-- HINT: if certificate or other than degree - use 'Course Default'.

-- In County
-- In State
-- Out of State
-- (if not specified -- general fees)


-- Try if...then...boolean clause

-- In State/County (if less than $700)
-- Out of State or County (if greater than $700)


-- A). List of all institution with residency classifcation with tuition costs.
CREATE OR REPLACE VIEW residency_classification AS
SELECT Degree, 
	   Institution_Name, 
	   Cost, 
CASE
	-- Institution Names that have 'LLC', 'INC' or a Private Institution other than 'University of [Name of City or State]
    -- Enter 'Course Default'. Otherwise, cost must be based on residency location if institution is based on residency
    -- Example: University of Maryland - College Park (UMD/UMCP) = Residency School 
	WHEN Institution_Name = 'UNIVERSITY OF PHOENIX' THEN 'Institution Default'
    WHEN Institution_Name = 'Shemer Bar Review, LLC.' THEN 'Institution Default'
    WHEN Institution_Name = 'VEHICLE DYNAMICS INSTITUTE (VDI)' THEN 'Institution Default'
    WHEN Institution_Name = 'The SANS (SysAdmin, Audit, Network, Security) INSTITUTE' THEN 'Institution Default'
    WHEN Institution_Name = 'The Newberry Group, Inc' THEN 'Institution Default'
    WHEN Institution_Name = 'The Chicago School of Professional Psychology' THEN 'Institution Default'
    WHEN Institution_Name = 'THE CENTER FOR ALTERNATIVE DISPUTE RESOLUTION.' THEN 'Institution Default'
    WHEN Institution_Name = 'STRAYER UNIVERSITY.' THEN 'Institution Default'
    WHEN Institution_Name = 'Southern New Hampshire University (SNHU)' THEN 'Institution Defaultt'
    WHEN Institution_Name = 'SIGNET NORTH AMERICA' THEN 'Institution Default'
    WHEN Institution_Name = 'School of PE' THEN 'Institution Default'
    WHEN Institution_Name = 'ROPES THAT RESCUE LTD.' THEN 'Institution Default'
    WHEN Institution_Name = 'Robert Morris University (RMU)' THEN 'Institution Default'
    WHEN Institution_Name = 'Remote Medical International' THEN 'Institution Default'
    WHEN Institution_Name = 'PUBLIC AGENCY TRAINING COUNCIL' THEN 'Institution Default'
    WHEN Institution_Name = 'PAT MCCARTHY PRODUCTIONS, INC' THEN 'Institution Default'
    WHEN Institution_Name = 'OFFICE OF EDUCATION AND TRAINING FOR ADDICTION SERVICES' THEN 'Institution Default'
    WHEN Institution_Name = 'NIGP: The Institute for Public Procurement' THEN 'Institution Default'
    WHEN Institution_Name = 'NATIONAL ASSOCIATION OF HOUSING AND REDEVELOPMENT OFFICIALS' THEN 'Institution Default'
    WHEN Institution_Name = 'MD SHRM STATE COUNCIL.' THEN 'Institution Default'
    WHEN Institution_Name = 'MD SHRM State Council' THEN 'Institution Default'
    WHEN Institution_Name = 'MCKISSOCK, LP' THEN 'Institution Defaultt'
    WHEN Institution_Name = 'Green Ops' THEN 'Institution Defaultt'
    WHEN Institution_Name = 'GLOCK PROFESSIONAL, INC' THEN 'Institution Default'
    WHEN Institution_Name = 'GEORGIA K9 NTC, LLC' THEN 'Institution Default'
    WHEN Institution_Name = 'JOHNS HOPKINS UNIVERSITY (JHU)' THEN 'Institution Default'
    WHEN Institution_Name = 'Kaplan University' THEN 'Institution Default'
    WHEN Institution_Name = 'Loyola College in Maryland' THEN 'Institution Default'
    WHEN Institution_Name = 'Human Resources Institute' THEN 'Institution Default'
    WHEN Institution_Name = 'INTERNATIONAL ASSOCIATION OF COMPUTER INVESTIGATIVE SPECIALIST' THEN 'Institution Default'
    WHEN Institution_Name = 'JOHN E. REID AND ASSOCIATES, INC.' THEN 'Institution Default'
    WHEN Institution_Name = 'Force Science Institute, LTD.' THEN 'Institution Default'
    WHEN Institution_Name = 'Environmental Systems Research Institute (ESRI)' THEN 'Institution Default'
    WHEN Institution_Name = 'CORNELL UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'COLT DEFENSE LLC' THEN 'Institution Default'
    WHEN Institution_Name = 'CHAMBERLAIN COLLEGE OF NURSING' THEN 'Institution Default'
    WHEN Institution_Name = 'Central Christian College of the Bible' THEN 'Institution Default'
    WHEN Institution_Name = 'Center for Excellence in EMDR Therapy' THEN 'Institution Default'
    WHEN Institution_Name = 'CAPITOL COLLEGE' THEN 'Institution Default'
    WHEN Institution_Name = 'CAPELLA UNIVERSITY' THEN 'Institution Default'
	WHEN Institution_Name = 'Breastfeeding Outlook' THEN 'Institution Default'
    WHEN Institution_Name = 'BORRA CPA REVIEW' THEN 'Institution Default'
    WHEN Institution_Name = 'BERLITZ LANGUAGE CENTER' THEN 'Institution Default'
    WHEN Institution_Name = 'BENEDICTINE UNIVERSITY' THEN 'Institution Default'
	WHEN Institution_Name = 'ASHWORTH COLLEGE' THEN 'Institution Default'
    WHEN Institution_Name = 'ASHFORD UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'ARGOSY UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'Appraisal Institute' THEN 'Institution Default'
	WHEN Institution_Name = 'American Public University System (APUS)' THEN 'Institution Default'
    WHEN Institution_Name = 'AMERICAN MILITARY UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'American Institute of Certified Public Accountants' THEN 'Institution Default'
    WHEN Institution_Name = 'American College of Physicians (ACP)' THEN 'Institution Default'
	WHEN Institution_Name = 'ACADEMI' THEN 'Institution Default'
    WHEN Institution_Name = 'Weber State University' THEN 'Institution Default'
    WHEN Institution_Name = 'WALDEN UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'Villanova University' THEN 'Institution Default'
	WHEN Institution_Name = 'PUBLIC AGENCY TRAINING COUNCIL' THEN 'Institution Default'
    WHEN Institution_Name = 'School of PE' THEN 'Institution Default'
    WHEN Institution_Name = 'PESI  ---CONTINUING EDUCATIOIN SEMINARS' THEN 'Institution Default'
	WHEN Institution_Name = 'PENN FOSTER COLLEGE' THEN 'Institution Default'
	WHEN Institution_Name = 'GALLAUDET UNIVERSITY' THEN 'Institution Default'
	WHEN Institution_Name = 'COLUMBIA UNION COLLEGE' THEN 'Institution Default'
	WHEN Institution_Name = 'BOSTON UNIVERSITY (BU Boston)' THEN 'Institution Default'
    WHEN Institution_Name = 'THE CENTER FOR ALTERNATIVE DISPUTE RESOLUTION' THEN 'Institution Default'
    WHEN Institution_Name = 'STRAYER UNIVERSITY' THEN 'Institution Default'
	WHEN Institution_Name = 'HOWARD UNIVERSITY' THEN 'Institution Default'
	WHEN Institution_Name = 'BELLEVUE UNIVERSITY' THEN 'Institution Default'
    WHEN Institution_Name = 'Waldorf College' THEN 'Institution Default'
    WHEN Institution_Name = 'GEORGE WASHINGTON UNIVERSITY (GWU)' THEN 'Institution Default'
    WHEN Institution_Name = 'GEORGETOWN UNIVERSITY' THEN 'Institution Default'
	-- If Degree is Certificate or Non-Degree, it should note as a Course Default because the applicant is only
    -- attending based on his/her education pursuit outside of his/her residency.  
	WHEN Degree = 'Certificate' THEN 'Course Default'
    WHEN Degree = 'Non-Degree' THEN 'Course Default'
    WHEN Degree = 'Other' THEN 'Course Default'
    -- Otherwise, rate the cost based on residency
    WHEN Cost = 0 THEN 'INVALID'
	WHEN Cost >= 700 THEN 'Out of State'
    WHEN Cost <= 700 THEN 'In County or State'
    ELSE 'Course Default' -- by the institution's discretion
    END AS Residency_Type
-- Need an accurate count using relationship tables!
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_info
	   USING(sch_info_id)
ORDER BY Degree ASC, Institution_Name ASC;

SELECT *
FROM residency_classification;
    
-- Then, analyze how many in-county or state and out-of-state for all applicants in this data.
SELECT Residency_Type AS 'Residency Type',
       COUNT(Residency_Type) AS 'Total Applicants'
FROM residency_classification
GROUP BY Residency_Type;

-- EXPLAINATION: This shows how many applicants are considered based on their residency status for each institution that
-- varies by their own policies and guidelines. We assess based on the overall rating where usually below a given amount
-- is considered in county or state whereas the higher amount constituties out of state, if an institution is considered
-- public by local and state revenue. If an institution is private or a company, we insert then as 'Institution Default',
-- because there is only one set of fixed price when calculating cost. If no information is provided because the applicant
-- failed on his/her process, we noted as 'INVALID.'   
    
    
    
    
    
    
-- B). To find a specific school or district which such residency rating, type the school's name
-- NOTE: Cost and Residency Varies by Each Institution - REFER TO THE INFO FOUND ON EACH INSTITUTION BILLING WEBPAGE!

CREATE OR REPLACE VIEW school_residency_class AS
SELECT Degree AS 'Degree', 
	   Institution_Name AS 'Name of Institution', 
       Cost AS 'Cost',
CASE
    -- If Degree is Certificate or Non-Degree, it should note as a Course Default because the applicant is only
    -- attending based on his/her education pursuit outside of his/her residency.  
	WHEN Degree = 'Certificate' THEN 'Course Default'
    WHEN Degree = 'Non-Degree' THEN 'Course Default'
    -- Otherwise, rate the cost based on residency
	WHEN Cost = 0 THEN 'INVALID'
	WHEN Cost >= 1000 THEN 'Out of State'
    WHEN Cost <= 1000 THEN 'In County or State'
    ELSE 'Course Default' -- by the institution's discretion
    END AS Residency_Type 
-- Need an accurate count using relationship tables!
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN School_Direct_info
	   USING(sch_info_id)
-- COPY AND PASTE THE NAME FROM THE PREVIOUS OUTPUT OF THE CODE
-- ENTER Institution Name
WHERE Institution_Name = 'University of Maryland - College Park (UMD/UMCP)'
-- Clean the Dataset by order
ORDER BY Degree ASC;


SELECT *
FROM school_residency_class;
    
-- Then, analyze how many in-county or state and out-of-state for all applicants in this data.
SELECT Residency_Type AS 'Residency Type',
       COUNT(Residency_Type) AS 'Total Applicants'
FROM school_residency_class
GROUP BY Residency_Type;


-- Explaination: This shows the residency that each employee are assigned based 
-- on their tuition costs that they have been accepted as their remibursement. While
-- all other information are limited, we can catergorize on the cost of tutition
-- if they are granted in county, state, or out of state to monitor their budget on the county
-- which can be found on the next part of this topic.

