-- Step 1: Total Attrition Rate (Overall Benchmark)
SELECT 
    CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OverallAttritionRate
FROM HR_Analytics;

/* Output:
OverallAttritionRate
16.12  */

-- Step 2: Attrition Rate by Department
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

-- Step 3: Identify High-Risk Departments
WITH OverallRate AS (
    SELECT 
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OverallAttritionRate
    FROM HR_Analytics
),
DepartmentRates AS (
    SELECT 
        Department,
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
    FROM HR_Analytics
    GROUP BY Department
)
SELECT 
    dr.Department, 
    dr.AttritionRate, 
    orate.OverallAttritionRate
FROM DepartmentRates dr
JOIN OverallRate orate ON 1=1
WHERE dr.AttritionRate > orate.OverallAttritionRate;

/* Output:
Department	AttritionRate	OverallAttritionRate
Human Resources	19.05	16.12
Sales	20.63	16.12  */

-- Step 4: Simulate 18% Reduction in High-Risk Departments
WITH OverallRate AS (
    SELECT 
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OverallAttritionRate
    FROM HR_Analytics
),
DepartmentRates AS (
    SELECT 
        Department,
        COUNT(*) AS TotalEmployees,
        SUM(CAST(Attrition AS INT)) AS TotalAttritions,
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OriginalAttritionRate
    FROM HR_Analytics
    GROUP BY Department
),
SimulatedImprovement AS (
    SELECT 
        d.Department,
        d.OriginalAttritionRate,
        o.OverallAttritionRate,
        CASE 
            WHEN d.OriginalAttritionRate > o.OverallAttritionRate THEN ROUND(d.OriginalAttritionRate * 0.82, 2)
            ELSE d.OriginalAttritionRate
        END AS ImprovedAttritionRate
    FROM DepartmentRates d
    CROSS JOIN OverallRate o
)
SELECT 
    Department,
    OriginalAttritionRate,
    ImprovedAttritionRate,
    ROUND(OriginalAttritionRate - ImprovedAttritionRate, 2) AS ReductionAmount
FROM SimulatedImprovement;

/* Output:
Department	OriginalAttritionRate	ImprovedAttritionRate	ReductionAmount
Human Resources	19.05	15.6200	3.4300
Sales	20.63	16.9200	3.7100
Research & Development	13.84	13.8400	0.0000  */

-- Step 5: Before vs After � Total Company Attrition Rate
-- 1: Overall company attrition rate
WITH OverallRate AS (
    SELECT 
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OverallAttritionRate
    FROM HR_Analytics
),

-- 2: Department-wise attrition
DepartmentStats AS (
    SELECT 
        Department,
        COUNT(*) AS TotalEmployees,
        SUM(CAST(Attrition AS INT)) AS TotalAttritions,
        CAST(SUM(CAST(Attrition AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS OriginalAttritionRate
    FROM HR_Analytics
    GROUP BY Department
),

-- 3: Simulate 18% reduction in high-risk departments
SimulatedAttrition AS (
    SELECT 
        ds.Department,
        ds.TotalEmployees,
        ds.TotalAttritions,
        CASE 
            WHEN ds.OriginalAttritionRate > orate.OverallAttritionRate THEN 
                ROUND(ds.TotalEmployees * (ds.OriginalAttritionRate * 0.82) / 100.0, 0)
            ELSE ds.TotalAttritions
        END AS ImprovedAttritions
    FROM DepartmentStats ds
    CROSS JOIN OverallRate orate
),

-- 4: Totals for before and after
CompanyTotals AS (
    SELECT 
        SUM(TotalEmployees) AS CompanyTotalEmployees,
        SUM(TotalAttritions) AS CompanyOriginalAttritions,
        SUM(ImprovedAttritions) AS CompanyImprovedAttritions
    FROM SimulatedAttrition
)

-- Final Output: Before and After Attrition Rates
SELECT 
    CAST(CompanyOriginalAttritions * 100.0 / CompanyTotalEmployees AS DECIMAL(5,2)) AS AttritionRate_Before,
    CAST(CompanyImprovedAttritions * 100.0 / CompanyTotalEmployees AS DECIMAL(5,2)) AS AttritionRate_After,
    CAST((CompanyOriginalAttritions - CompanyImprovedAttritions) * 100.0 / CompanyTotalEmployees AS DECIMAL(5,2)) AS Improvement
FROM CompanyTotals;

/* Output:
AttritionRate_Before	AttritionRate_After	Improvement
16.12	14.83	1.29  */