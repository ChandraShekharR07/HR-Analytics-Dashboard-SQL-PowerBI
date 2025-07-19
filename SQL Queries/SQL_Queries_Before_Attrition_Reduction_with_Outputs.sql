-- 1. Total Employee Count
SELECT COUNT(*) AS TotalEmployees
FROM HR_Analytics;

/* Output:
TotalEmployees
1470  */

-- 2. Attrition Rate
SELECT 
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercentage
FROM HR_Analytics;

/* Output:
AttritionRatePercentage
16.12  */

-- 3. Total Attrition Count
SELECT 
  SUM(CAST(Attrition AS INT)) AS TotalAttritions
FROM HR_Analytics;

/* Output:
TotalAttritions
237  */

-- 4. Average Age
SELECT 
  AVG(Age) AS AverageAge
FROM HR_Analytics;

/* Output:
AverageAge
36 */

-- 5. Average Monthly Salary
SELECT 
  AVG(MonthlyIncome) AS AverageMonthlySalary
FROM HR_Analytics;

/* Output:
AverageMonthlySalary
6502  */

-- 6. Average Years at Company
SELECT 
  AVG(YearsAtCompany) AS AverageYearsAtCompany
FROM HR_Analytics;

/* Output:
AverageYearsAtCompany
7  */

-- 7. Attrition by Department
SELECT 
  Department,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Department
ORDER BY AttritionRate DESC;

/* Output:
Department	TotalEmployees	TotalAttritions	AttritionRate
Sales	446	92	20.63
Human Resources	63	12	19.05
Research & Development	961	133	13.84  */

-- 8. Attrition by Job Role
SELECT 
  JobRole,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY JobRole
ORDER BY AttritionRate DESC;

/* Output:
JobRole	TotalEmployees	TotalAttritions	AttritionRate
Sales Representative	83	33	39.76
Laboratory Technician	259	62	23.94
Human Resources	52	12	23.08
Sales Executive	326	57	17.48
Research Scientist	292	47	16.10
Manufacturing Director	145	10	6.90
Healthcare Representative	131	9	6.87
Manager	102	5	4.90
Research Director	80	2	2.50  */

-- 10. Attrition by Salary Slab
SELECT 
  SalarySlab,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY SalarySlab
ORDER BY AttritionRate DESC;

/* Output:
SalarySlab	TotalEmployees	Attritions	AttritionRate
Upto 5k	749	163	21.76
10k-15k	148	20	13.51
5k-10k	440	49	11.14
15k+	133	5	3.76  */

---- 11. Attrition by Education
SELECT 
  Education,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Education
ORDER BY Education;

/* Output:
Education	TotalEmployees	Attritions	AttritionRate
1	170	31	18.24
2	282	44	15.60
3	572	99	17.31
4	398	58	14.57
5	48	5	10.42  */

-- 15. Average Job Satisfaction by Department
SELECT 
  Department,
  AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM HR_Analytics
GROUP BY Department
ORDER BY AvgJobSatisfaction ASC;

/* Output:
Department	AvgJobSatisfaction
Human Resources	2
Sales	2
Research & Development	2  */

-- 16. Work-Life Balance vs Attrition
SELECT 
  WorkLifeBalance,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY WorkLifeBalance;

/* Output:
WorkLifeBalance	TotalEmployees	Attritions	AttritionRate
3	893	127	14.22
1	80	25	31.25
4	153	27	17.65
2	344	58	16.86  */

-- 17. Attrition by Gender
SELECT 
  Gender,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Gender
ORDER BY AttritionRate DESC;

/* Output:
Gender	TotalEmployees	TotalAttritions	AttritionRate
Male	882	150	17.01
Female	588	87	14.80  */

-- 18. Attrition by Age Group
SELECT 
  AgeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

/* Output:
AgeGroup	TotalEmployees	Attritions	AttritionRate
18-25	123	44	35.77
26-35	606	116	19.14
55+	47	8	17.02
46-55	226	26	11.50
36-45	468	43	9.19  */

-- 19. Overtime vs Attrition
SELECT 
  OverTime,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY OverTime;

/* Output:
OverTime	TotalEmployees	Attritions	AttritionRate
Yes	416	127	30.53
No	1054	110	10.44  */

-- 20. Marital Status vs Attrition
SELECT 
  MaritalStatus,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY MaritalStatus;

/* Output:
MaritalStatus	TotalEmployees	Attritions	AttritionRate
Married	673	84	12.48
Divorced	327	33	10.09
Single	470	120	25.53  */

-- 21. Distance from Home vs Attrition (Binned)
SELECT 
  CASE 
    WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5 km'
    WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
    WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15 km'
    ELSE '15+ km'
  END AS DistanceRange,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY 
  CASE 
    WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5 km'
    WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
    WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15 km'
    ELSE '15+ km'
  END;

/* Ouput:
DistanceRange	TotalEmployees	Attritions	AttritionRate
11-15 km	115	25	21.74
6-10 km	394	57	14.47
15+ km	329	68	20.67
0-5 km	632	87	13.77  */

-- 22. Performance Rating vs Attrition
SELECT 
  PerformanceRating,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY PerformanceRating;

/* Output:
PerformanceRating	TotalEmployees	Attritions	AttritionRate
3	1244	200	16.08
4	226	37	16.37  */

-- 23. Education Field vs Attrition
SELECT 
  EducationField,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY EducationField;

/* Output:
EducationField	TotalEmployees	Attritions	AttritionRate
Technical Degree	132	32	24.24
Other	82	11	13.41
Human Resources	27	7	25.93
Medical	464	63	13.58
Marketing	159	35	22.01
Life Sciences	606	89	14.69  */
