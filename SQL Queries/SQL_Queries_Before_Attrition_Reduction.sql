-- 1. Total Employee Count
SELECT COUNT(*) AS TotalEmployees
FROM HR_Analytics;

-- 2. Attrition Rate
SELECT 
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercentage
FROM HR_Analytics;

-- 3. Total Attrition Count
SELECT 
  SUM(CAST(Attrition AS INT)) AS TotalAttritions
FROM HR_Analytics;

-- 4. Average Age
SELECT 
  AVG(Age) AS AverageAge
FROM HR_Analytics;

-- 5. Average Monthly Salary
SELECT 
  AVG(MonthlyIncome) AS AverageMonthlySalary
FROM HR_Analytics;

-- 6. Average Years at Company
SELECT 
  AVG(YearsAtCompany) AS AverageYearsAtCompany
FROM HR_Analytics;

-- 7. Attrition by Department
SELECT 
  Department,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Department
ORDER BY AttritionRate DESC;

-- 8. Attrition by Job Role
SELECT 
  JobRole,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- 10. Attrition by Salary Slab
SELECT 
  SalarySlab,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY SalarySlab
ORDER BY AttritionRate DESC;

-- 11. Attrition by Education
SELECT 
  Education,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Education
ORDER BY Education;

-- 15. Average Job Satisfaction by Department
SELECT 
  Department,
  AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM HR_Analytics
GROUP BY Department
ORDER BY AvgJobSatisfaction ASC;

-- 16. Work-Life Balance vs Attrition
SELECT 
  WorkLifeBalance,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY WorkLifeBalance;

-- 17. Attrition by Gender
SELECT 
  Gender,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS TotalAttritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY Gender
ORDER BY AttritionRate DESC;

-- 18. Attrition by Age Group
SELECT 
  AgeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

-- 19. Overtime vs Attrition
SELECT 
  OverTime,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY OverTime;

-- 20. Marital Status vs Attrition
SELECT 
  MaritalStatus,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY MaritalStatus;

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

  -- 22. Performance Rating vs Attrition
SELECT 
  PerformanceRating,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY PerformanceRating;

-- 23. Education Field vs Attrition
SELECT 
  EducationField,
  COUNT(*) AS TotalEmployees,
  SUM(CAST(Attrition AS INT)) AS Attritions,
  CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Analytics
GROUP BY EducationField;
