-- Montgomery County (MoCo) Tuition Assistance Analysis 

-- CHAPTER 4: Course Taken and Progress Audit

-- Descrpition:  

########################## ENTRY NOTES #########################

-- Use the following database
USE moco_tuition_assistance;

-- Write and identify each step of what you are going to code
-- on the analysis.

-- Use logicial reasoning to justify your claim.

###############################################################




############### TOPIC 1: List of institutions who signed up for courses in price. #############

SELECT t.Institution_Name AS 'Name of Institution',
	   t.Course_Title AS 'Name of Course',
       CONCAT('$', ROUND(t.Cost), ".00") AS 'Cost Per Course'
FROM 
	(SELECT course_id,
			sch_info_id,
            emp_id,
            dept_id,
            Institution_Name,
            Course_Title,
            Cost
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Course_Info
			USING(course_id)
		JOIN School_Direct_Info
			USING(sch_info_id)
	GROUP BY course_id, sch_info_id, emp_id, dept_id)t
GROUP BY Institution_Name, Course_Title, Cost
-- Omit the Cost that has '0' - that was reject from applicant
HAVING Cost > '0'
ORDER BY Institution_Name ASC;

-- EXPLAINATION: This data shows all employees who signed up a specific course that is common based on the price rated per 
-- course name and the institution that they are currently attending. We omit the ones whose course in an institution is listed
-- as 0 as those who were rejected. The purpose is to formulate an audit to describe more based on how the applicant signed up for 
-- these courses as well the frequent courses in the applicant data to see whether these is a correlation on the course itself
-- and on the job duties to match their interests. Cost varies by the course in each institution.

-- AUDIT Analysis. On the institution name 'Strayer University' with 'Algebra with Applications' as a course, these were the same courses but 
-- with different cost range. This means there may be an error in terms of the payment process.


###############################################################



############### TOPIC 2: List of institutions who signed up for courses in price by Degree Levels #############

-- Be specific in terms the course name that is assoicated with a degree type. Many courses can vary by different
-- levels in which we need to assess the applicant's merits and talents with the skills they already hone to determine
-- their right level.

SELECT t.Institution_Name AS 'Name of Institution',
	   t.Degree AS 'Degree Type',
	   t.Course_Title AS 'Name of Course',
       t.Cost AS 'Cost Per Course'
FROM 
	(SELECT course_id,
			sch_info_id,
            emp_id,
            dept_id,
            Institution_Name,
            Degree,
            Course_Title,
            Cost
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Course_Info
			USING(course_id)
		JOIN School_Direct_Info
			USING(sch_info_id)
	GROUP BY course_id, sch_info_id, emp_id, dept_id)t
GROUP BY Institution_Name, Degree, Course_Title, Cost
-- Omit the Cost that has '0' - that was reject from applicant
HAVING Cost > '0'
ORDER BY Institution_Name ASC;

-- EXPLAINATION: As further analysis with the degree, we can see the impact it has on identify applicant degree and 
-- the course that they were taken. When it comes to cost, however, the tuition is only paid depending on the resident
-- type but when calculating, the rate assumes to be 3 credits for each course, however, it has only calcualted only 
-- one credit at that given rate. The applicant who got accepted had to pay the remaining amount as a result. 


###############################################################



############### TOPIC 3: List how many applicants have taken for each specified course #############

SELECT t.Institution_Name AS 'Name of Institution',
	   t.Degree AS 'Degree Type',
	   t.Course_Title AS 'Name of Course',
	   COUNT(t.Department_Name) AS 'Total Applicants'
FROM 
	(SELECT course_id,
			sch_info_id,
            emp_id,
            dept_id,
            Institution_Name,
            Department_Name,
            Degree,
            Course_Title,
            Cost
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Department_Info
			USING(dept_id)
		JOIN Course_Info
			USING(course_id)
		JOIN School_Direct_Info
			USING(sch_info_id)
	GROUP BY course_id, sch_info_id, emp_id, dept_id)t
GROUP BY Institution_Name, Degree, Course_Title, Department_Name
ORDER BY Institution_Name ASC;

-- EXPLAINATION:

###############################################################






############### TOPIC 3: Give the total amount of tuition given for the course for all applicants signed up #############

SELECT t.Institution_Name AS 'Name of Institution',
	   t.Degree AS 'Degree Type',
	   t.Course_Title AS 'Name of Course',
       CONCAT('$', ROUND(SUM(t.Cost)), '.00') AS 'Total Cost Per Course'
FROM 
	(SELECT course_id,
			sch_info_id,
            emp_id,
            dept_id,
            Institution_Name,
            Degree,
            Course_Title,
            Cost
	FROM Applicant_Info
		JOIN Employee_Info
			USING(emp_id)
		JOIN Course_Info
			USING(course_id)
		JOIN School_Direct_Info
			USING(sch_info_id)
	GROUP BY course_id, sch_info_id, emp_id, dept_id)t
GROUP BY Institution_Name, Degree, Course_Title, Cost
-- Omit the Cost that has '0' - that was reject from applicant
HAVING Cost > '0'
ORDER BY Institution_Name ASC;


###############################################################






###############################################################




############### TOPIC 4: Balance Audit  #############

-- A).

-- SEE similar topic: Institution Course Balance Audit (formely Course Taken and Progress Audit)

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


-- B). Balance Difference for All Applicants Process
WITH Balance_Difference AS (
	SELECT Department_Name AS 'Applicant Name',
		   Degree AS 'Degree Status',
		   Major AS 'Current Major',
		   Cost AS 'Amount Tuition Paid',
		   CONCAT('$', ROUND(SUM(t.Cost)), '.00') AS 'Total Amount Paid',
		   CONCAT('$', ROUND(SUM(t.Cost) - Cost), '.00') AS "Amount Difference",
		   COUNT(t.Cost) AS 'Receipt of Applicants already Paid'
	FROM 
	-- Useful when doing this subquery for calculation!
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
	ORDER BY Department_Name ASC)

SELECT *
FROM Balance_Difference;


-- C).Checking Total Applicants Already Paid.
WITH Balance_Audit AS (
	SELECT Department_Name AS 'Applicant Name',
		   Degree AS 'Degree Status',
		   Major AS 'Current Major',
		   Cost AS 'Amount Tuition Paid',
		   Cost AS 'Total Amount Paid',
		   CONCAT('$', ROUND(Cost - Cost), '.00') AS "Amount Difference"
	FROM Employee_Info e
		JOIN Applicant_Info a
			USING(emp_id)
		JOIN Department_Info d
			USING(dept_id)
	-- showing the accepted applicants in which tuition is paid
	WHERE Cost > '0.00'
		-- keep in mind the emp_id in 'Employee' key is different
		-- because of the total tuition price that they paid on different rates recorded!
	GROUP BY Department_Name, Degree, Major, Cost
    HAVING Department_Name = 'Health & Human Services'
	ORDER BY Department_Name ASC)

SELECT COUNT(*) AS 'Total Count'
FROM Balance_Audit;






###############################################################





############### TOPIC 4:  #############




###############################################################





############### TOPIC 4:  #############




###############################################################