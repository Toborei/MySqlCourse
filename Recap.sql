/*
Foundation Recap Exercise
 
Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/
 
SELECT
	*
FROM
	PatientStay ps ;
 
/*
1. List the patients -
a) in the Oxleas or PRUH hospitals and
b) admitted in February 2024
c) only the Surgery wards
 
2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.
3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
*/
 
-- Write the SQL statement here

SELECT
    PS.PatientId
,   PS.AdmittedDate
,   PS.DischargeDate
,   PS.Hospital
,   PS.Ward
,   DATEDIFF(DD,PS.AdmittedDate,PS.DischargeDate) + 1 AS [LengthOfStay(days)]
FROM
    PATIENTSTAY PS
WHERE
    PS.HOSPITAL IN ('OXLEAS' , 'PRUH')
AND
    PS.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
AND
    PS.Ward LIKE '%SURGERY%'
ORDER BY
    PS.AdmittedDate DESC
,   PS.PatientId DESC
                
 
 
/*
5. How many patients has each hospital admitted? 
6. How much is the total tarriff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/
 
-- Write the SQL statement here

SELECT
    PS.HOSPITAL
,   COUNT(*) AS [ADDMISSIONS]
,   SUM(PS.Tariff) AS [TOTALTARIFF]
FROM
    PatientStay PS 
GROUP BY
    PS.Hospital
HAVING
    COUNT(*) > 10
ORDER BY
    [ADDMISSIONS] DESC