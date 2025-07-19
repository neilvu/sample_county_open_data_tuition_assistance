-- MOCO Tutition Assistance Program

-- TOPIC: Accerlation Status 


##################### TOPIC B). School Accerleration and Type ######################

-- See in Previous File: Tutition_Assistance_Processing_Montinoring

-- In addition to the institutions, the U.S. Department of Education requires
-- that these private and public institutions (colleges/university) must be 
-- accerlerated in order to provide funds from the federal and state government.
-- With the exception from companies who are exempt in this requirements, we
-- want to classify each institution on whether they are accerlated or not.

-- If accerlated - enter funding for the applicants.
-- IF NOT accerlated - notify applicants that they have lost funding to meet the 
-- requirements (with the exception of companies marked as 'LLC', 'INC', or 'Law Firm').

CREATE OR REPLACE VIEW classification AS
SELECT Institution_Name AS "Name of School",
-- Institution Type
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
END AS Institution_Classifcation,
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
ORDER BY Institution_Name ASC;

SELECT *
FROM classification;

-- COUNT HOW MANY INSTIUTIONS CLASSIFED AS 'ACCERLATED', 'NOT ACCERLATED', 'EXEMPT' AND 'FURTHER INVERSTIGATION'
SELECT Accerlation AS 'Accerlation Type',
	   COUNT(Accerlation) AS 'Number of Institutions'
FROM classification
GROUP BY Accerlation
ORDER BY COUNT(Accerlation) DESC;

-- COUNT HOW MANY INSTIUTIONS CLASSIFED AS 'ACCERLATED', 'NOT ACCERLATED', 'EXEMPT' AND 'FURTHER INVERSTIGATION' FROM EACH Institution Classification
SELECT Accerlation AS 'Accerlation Type',
	   Institution_Classifcation AS 'Class Type',
	   COUNT(Institution_Classifcation) AS 'Number of Institutions'
FROM classification
GROUP BY Accerlation, Institution_Classifcation
ORDER BY Accerlation ASC;

-- EXPLAINATION: To provide proper funding, we need to ensure that the institutions are meeting the standards
-- for applicants that will serve their needs and career goals in the county government and the mission. To do so,
-- we would need to analyze baxed on their accerlation standards as set by the U.S. Department of Education 
-- to ensure that they are keep on track with the education regulations. This will help us get a better 
-- understanding about the institutions themselves and whether we can continue funding with them if they
-- meet with our mission and goals.

#####################################################################