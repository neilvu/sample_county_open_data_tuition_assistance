-- Montgomery County (MoCo) Tuition Assistance Analysis 

-- CHAPTER 3: Monitoring Costs on the County's Budget on this program

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

################## TOPIC A: Degrees, Degree w. Major, and Tuition by Insitution ###############

-- A). Identify the total tuition cost for each of the degree list for all applicants
USE moco_tuition_assistance;
SELECT Degree as 'Type of Degree',
	   COUNT(Degree) as 'Total Applicants',
	   CONCAT('$', ROUND(SUM(Cost)), '.00') as 'Total Amount' 
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN Department_Info
		USING(dept_id)
GROUP BY Degree
ORDER BY Degree ASC;

-- EXPLAINATION: In this case, job market is rising and so does applicants who signed up for the program to keep
-- their career progress to build their skills as their appratus to prepare for their changes ahead. Most who 
-- signed up were Masters and Bachelors, since they both have the highest amount of funds spent for this program.

-- This shows the applicant's progress of their education to see if they can 
-- achieve his/her goals and whether funding can be further established to prepare for their
-- career workforce in the MoCo Government, which is what this funding is for as essential for
-- government workforce.


-- B). Identify the total tuition cost for each of the institution list for all applicants (for all degrees programs)
USE moco_tuition_assistance;
SELECT Institution_Name as 'Institution Name',
	   COUNT(Institution_Name) as 'Total Applicants',
	   CONCAT('$', ROUND(SUM(Cost)), '.00') as 'Total Amount' 
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN Department_Info
		USING(dept_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
ORDER BY Institution_Name ASC;

-- EXPLAINATION: We want to see how much payment that we are paying for these institution, so it is important to note 
-- that we want to ensure that we have enough funds in the county's budget to allocate for these resources for 
-- accepted applicants.

-- In addition, since UMGC has the highest amount of students, it also have the highest fund spent because of the 
-- insttution's benefits for the students as they are more flexible in their courses as well with low cost tuition 
-- and with the many education benefits avaiable just like a typical college/university.
-- University of Maryland Global Campus (UMGC/UMUC).



-- C). Cateogrize it by each institution (PUBLIC, PRIVATE, COMPANY) to see total budget FOR ALL INSTITUTIONS
-- NOTE: Use with the 'Choosing_of_School_Attendance_Classification' to set how much funds are available.
-- List of institutions who are typed as public, private or company
CREATE OR REPLACE VIEW institution_classification AS
SELECT Institution_Name AS "Name of School",
	   COUNT(Institution_Name) AS 'Total Applicants Attended',
       CONCAT('$', ROUND(SUM(Cost)), '.00') as 'Total Amount',
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
	JOIN Department_Info
		USING(dept_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
-- Search it here by public, private or company
-- To see it all, omit this line only
#HAVING Classification = 'PUBLIC'
ORDER BY Institution_Name ASC, Classification ASC;

SELECT *
FROM institution_classification;


-- EXPLAINATION: This shows the classification of who are listed as public and private as well with 
-- companies to see where the courses and degrees are aligned to their institutions.

-- Analyzing based on Institution Types
SELECT Classification,
	   COUNT(Classification) AS 'Total Institutions'
FROM institution_classification
GROUP BY Classification;

-- EXPLAINATION: This helps to track the budget allowance when it comes to analyzing the tutition amount
-- paid and whether the county still have enough funds to continue with this program since
-- it explains that they are limited when it comes to determining and accepting applicants 
-- based on the slides posted.

-- INTERPRETATION FROM "Analyzing based on Institution Types"

-- In addition to the institution types, it helps to get a picture of how applicants connect to their goals
-- and their education lifestyle. For instance, if a police officer wants to improve his/her weapons or K-9
-- tactics, he/she would enroll in a COMPANY course since they would better teach their current skills. 
-- This gives a correlation as to sense of how skills and institutions classification do mix with their
-- education skills and capabilities.


#######################################################################################################



##################### TOPIC B). School Accerleration ######################

-- See in Seperate File: Accerlation

-- In addition to the institutions, the U.S. Department of Education requires
-- that these private and public institutions (colleges/university) must be 
-- accerlerated in order to provide funds from the federal and state government.
-- With the exception from companies who are exempt in this requirements, we
-- want to classify each institution on whether they are accerlated or not.

-- If accerlated - enter funding for the applicants.
-- IF NOT accerlated - notify applicants that they have lost funding to meet the 
-- requirements (with the exception of companies marked as 'LLC', 'INC', or 'Law Firm').

CREATE OR REPLACE VIEW accerlation_classification AS
SELECT Institution_Name AS "Name of School",
-- Accerlation Requirements
CASE 
	-- 1). EXCEPTIONS 
    WHEN Institution_Name LIKE '%LLC' OR '%INC' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%, INC' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%, INC.' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%, LLC.'  THEN 'EXEMPT'
    WHEN Institution_Name LIKE 'School%' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%Institute' OR '%Institute%' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%Institute %' THEN 'EXEMPT'
    WHEN Institution_Name LIKE 'LANGUAGE' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%Outlook' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%Excellence%' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%ASSOCIATION OF%' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%Council' THEN 'EXEMPT'
    WHEN Institution_Name LIKE 'Remote%' THEN 'EXEMPT'
	WHEN Institution_Name LIKE '%LANGUAGE%' THEN 'EXEMPT'
	WHEN Institution_Name LIKE '%EDUCATION%' THEN 'EXEMPT'
    WHEN Institution_Name LIKE '%EDUCATIOIN%' THEN 'EXEMPT'
    WHEN Institution_Name = 'The Chicago School of Professional Psychology' THEN 'EXEMPT'
    WHEN Institution_Name = 'Central Christian College of the Bible' THEN 'EXEMPT'
    WHEN Institution_Name = 'SIGNET NORTH AMERICA' THEN 'EXEMPT'
    -- OTHER SCHOOLS NEEDS FURTHER INVESTIGATION
    WHEN Institution_Name LIKE 'ACAD%' THEN 'FURTHER INVESTIGATION'
	-- 2). MEETS ACCERLATION
    -- a). University
	WHEN Institution_Name LIKE 'University%' OR 'UNIVERSITY%' THEN 'ACCERLATED'
    WHEN Institution_Name LIKE '%UNIVERSITY' OR '%University' THEN 'ACCERLATED'
    WHEN Institution_Name LIKE '%University%' THEN 'ACCERLATED'
    -- b). Colleges
    WHEN Institution_Name LIKE '%College' OR '%COLLEGE' THEN 'ACCERLATED'
    WHEN Institution_Name LIKE '%COLLEGE%' OR '%College%' THEN 'ACCERLATED'
    -- 3). IF NOT ACCERLATED
    ELSE 'NOT ACCERLATED'
END AS Accerlation
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN Department_Info
		USING(dept_id)
	JOIN School_Direct_Info
		USING(sch_info_id)
GROUP BY Institution_Name
ORDER BY Institution_Name ASC, Accerlation ASC;

SELECT *
FROM accerlation_classification;

-- COUNT HOW MANY INSTIUTIONS CLASSIFED AS 'ACCERLATED', 'NOT ACCERLATED', 'EXEMPT' AND 'FURTHER INVERSTIGATION'
SELECT Accerlation AS 'Accerlation Type',
	   COUNT(Accerlation) AS 'Number of Institutions'
FROM accerlation_classification
GROUP BY Accerlation
ORDER BY COUNT(Accerlation) DESC;

-- EXPLAINATION: To provide proper funding, we need to ensure that the institutions are meeting the standards
-- for applicants that will serve their needs and career goals in the county government and the mission. To do so,
-- we would need to analyze baxed on their accerlation standards as set by the U.S. Department of Education 
-- to ensure that they are keep on track with the education regulations. This will help us get a better 
-- understanding about the institutions themselves and whether we can continue funding with them if they
-- meet with our mission and goals.

#####################################################################






####################### TOPIC C: Tuition Processing ###################


-- Part I: How many applicants by their major and the department that
-- they curently worked in had already been paid or being processed?


SELECT t.Department_Name AS 'Applicant Name',
	   t.Degree AS 'Degree Status',
       t.Major AS 'Current Major',
       COUNT(t.Department_Name) AS 'Total Applicants',
       t.Cost AS 'Amount Tuition Paid',
       CONCAT('$', ROUND(SUM(t.Cost)), '.00') AS 'Total Amount Paid',
       COUNT(t.Cost) AS 'Receipt of Applicants already Paid'
FROM 
	(SELECT e.emp_id,
			e.dept_id,
            d.Department_Name,
            a.Degree,
            a.Major,
            a.Cost
	 FROM employee_info e
		JOIN applicant_info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
-- showing the accepted applicants in which tuition is paid
	 WHERE Cost > '0.00'
     -- keep in mind the emp_id in 'Employee' key is different
     -- because of the total tuition price that they paid on different rates recorded!
	 GROUP BY emp_id, dept_id, Degree, Major)t
GROUP BY Department_Name, Degree, Major, Cost
ORDER BY Department_Name ASC;
     

-- EXPLAINATION: With a broader scope of the picture in terms of their major and course that
-- they are accepted in the program, the ones that that were paid as described earlier
-- on the tutiton acceptance/rejected rate can be found by seeing the cost recorded on the
-- county's program receipts. Since each rate was calculated based on a single value that were 
-- then calculated with the same number (instead of calculating every part of the values, which 
-- would require such math formula), it would be wise to count how many receipents were already
-- accepted as well the calculation being paid for each of indivudual registration rather than calculating
-- based on mathematical means to find the total receipts due to blocks of the programming scope.

-- We therefore give a list of recipents who had already been paid to see how many applicants were
-- accepted in the program.


-- IRREGULARLY ISSUE: On the column with with the applicant's name "Police" and the Degree Status that 
-- says "Other" with the current major "Information Technology", there were two individuals that 
-- have the identicial receipt cost but with a cent apart. This tells that there may be 
-- irregularies in terms of how this is becing recorded and whether if any errors been received 
-- because of this issue when it comes to cost auditing.


-- This reflects back on the first topic regarding this discussion...
-- those who were rejected
USE moco_tuition_assistance;
SELECT Department_Name AS "Applicant's Name",
	   Degree AS "Applicant's Intended Pursuit",
       Major,
       CONCAT('$', ROUND(SUM(Cost)), '.00')  AS "Total Paid for this Semester"
FROM Employee_Info e
	JOIN Applicant_Info a
		USING(emp_id)
	JOIN Department_Info d
		USING(dept_id)
GROUP BY Department_Name, Degree, Major, Cost
HAVING Cost = '0'
ORDER BY Department_Name ASC, Degree ASC;

-- and those who were accepted
USE moco_tuition_assistance;
SELECT Department_Name AS "Applicant's Name",
	   Degree AS "Applicant's Intended Pursuit",
       Major,
       COUNT(Cost) AS "Total Paid for this Semester"
FROM Employee_Info e
	JOIN Applicant_Info a
		USING(emp_id)
	JOIN Department_Info d
		USING(dept_id)
GROUP BY Department_Name, Degree, Major, Cost
HAVING Cost > '0'
ORDER BY Department_Name ASC, Degree ASC;





####################### TOPIC D: Tuition Compliance (IRS Tax) ######################

-- a). How many applicants have met the tax-exempt requirements?
-- b). How many applicants do not meet the tax-exempt requirements?
-- In which they would have to pay for the tax.

-- Per IRS Requirements, tax-exempt status can be used in tuition assistance if below the $5,250 cap threshold.
-- HINT: Use SUM() for the applicants but filter the < 5250.00 (in cost 
-- attribute) as the symbol.

-- Source: https://www.usmd.edu/tuition-remission/faq/ (USMD)
-- https://www.irs.gov/newsroom/employer-offered-educational-assistance-programs-can-help-pay-for-college (IRS)

USE moco_tuition_assistance;
CREATE OR REPLACE VIEW tax_requirements AS 
SELECT Department_Name AS 'Applicant Name',
	   Degree AS 'Degree Status',
       Major AS 'Current Major',
       Cost AS 'Tuition',
CASE
	-- setting the tax-exempt requirements
    WHEN Cost = 0 THEN 'N/A'
	WHEN Cost <= 5250 THEN 'EXEMPT'
    WHEN Cost > 5250 THEN 'TAX-DEDUCTIBLE'
ELSE 'N/A' -- if no info is given
END AS tax_req 
FROM Applicant_Info
	JOIN Employee_Info
		USING(emp_id)
	JOIN Department_Info
		USING(dept_id)
GROUP BY Department_Name, Degree, Major, Cost, tax_req
ORDER BY Department_Name ASC, Degree ASC, Major ASC, tax_req ASC;

-- Test with the following results
SELECT *
FROM tax_requirements;

-- Analyze how many tax-exempt and non-exempt on the given database
SELECT tax_req AS 'Tax Type',
	   COUNT(tax_req) AS 'Total'
FROM tax_requirements
GROUP BY tax_req;


-- EXPLAINATION: This shows the audit in terms of applicants that were paid by their tutition benefits
-- in which we want to give a closer look in terms of the tax requirements as set by the IRS to see
-- if the amount paid meets the tax requirements. If the tutition paid for this applicant is less 
-- than or same as the required amount, that amount does not need to be paid, however, ifthe applicant
-- is greater than that amount, the benefits would have to be paid back. This demonstrates the 
-- transparency need to meet the policy standards when it comes to federal tax guidelines.

