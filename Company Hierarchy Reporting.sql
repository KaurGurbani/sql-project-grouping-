--Tables:Company(company_code, founder), Lead_Manager(company_code, lead_manager_code),Senior_Manager(lead_manager_code, senior_manager_code), Manager(senior_manager_code, manager_code), Employee(manager_code, employee_code)
--Goal:For each company, print:
--company_code, founder,Total number of:Lead Managers, Senior Managers, Managers, Employees
--Order by company_code (as string, not numerically).

SELECT 
  c.company_code,
  c.founder,
  COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_count,
  COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_count,
  COUNT(DISTINCT m.manager_code) AS manager_count,
  COUNT(DISTINCT e.employee_code) AS employee_count
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
LEFT JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
