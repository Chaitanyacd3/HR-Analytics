-- 1)Average Attrition rate for all Departments:

SELECT Department, 
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 AS AvgAttritionRate
FROM hr_1
GROUP BY Department;

-- -------------------------------------------

-- 2) Average Hourly rate of Male Research Scientist:

SELECT AVG(CASE WHEN Gender = 'Male' AND JobRole = 'Research Scientist' THEN HourlyRate ELSE NULL END) AS AvgHourlyRate
FROM hr_1;

-- ----------------------------------------------------------

-- 3)Average working years for each Department

SELECT hr_1.Department, AVG(hr_2.TotalWorkingYears) AS AvgWorkingYears
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.`Employee ID`
GROUP BY hr_1.Department;

-- ---------------------------------------------------------

-- 4)Attrition rate Vs Monthly income stats:

SELECT AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AvgAttritionRate,
       AVG(hr_2.MonthlyIncome) AS AvgMonthlyIncome
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.`Employee ID`;

-- -----------------------------------------------------------

-- 5)Job Role Vs Work life balance:

SELECT hr_1.JobRole, AVG(hr_2.WorkLifeBalance) AS AvgWorkLifeBalance
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.`Employee ID`
GROUP BY hr_1.JobRole;

-- -----------------------------------------------------------

-- 6)Attrition rate Vs Year since last promotion relation

SELECT hr_2.YearsSinceLastPromotion,
       AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END)*100 AS AvgAttritionRate
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.`Employee ID`
GROUP BY hr_2.YearsSinceLastPromotion;

-- -----------------------------------------------------------

-- 7. how does the gender distribution vary across dept.and job titles

select department ,jobrole,gender,count(*) AS count
from hr_1
group by department , jobrole ,gender
order by department,jobrole,gender;







