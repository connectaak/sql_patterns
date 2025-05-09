🧮 Find Employees Without Any Reports
SELECT e.id, e.name
FROM employees e
LEFT JOIN employees r ON e.id = r.manager_id
WHERE r.id IS NULL;
✔️ This lists individual contributors or “leaf nodes.”


📎 Get Reporting Chain for a Specific Employee
WITH RECURSIVE reporting_path AS (
    SELECT id, name, manager_id
    FROM employees
    WHERE id = 6  -- Frank

    UNION ALL

    SELECT e.id, e.name, e.manager_id
    FROM employees e
    JOIN reporting_path rp ON e.id = rp.manager_id
)
SELECT * FROM reporting_path;


📊 Count of Total Reports per Manager
WITH RECURSIVE employee_hierarchy AS (
    SELECT id AS manager_id, id AS employee_id
    FROM employees

    UNION ALL

    SELECT eh.manager_id, e.id
    FROM employee_hierarchy eh
    JOIN employees e ON e.manager_id = eh.employee_id
)
SELECT manager_id, COUNT(*) - 1 AS total_reports
FROM employee_hierarchy
GROUP BY manager_id;
🧠 Subtract 1 to exclude the manager from their own count.


    
    
WITH RECURSIVE levels AS (
    SELECT id, name, manager_id, 1 AS level
    FROM employees2
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.name, e.manager_id, l.level + 1
    FROM employees2 e
    JOIN levels l ON e.manager_id = l.id
)
SELECT *
FROM levels
ORDER BY level, name;



/*** ❌ Direct Reports — Without Recursion SELECT manager_id, COUNT(*) AS direct_reports ***/
SELECT manager_id, COUNT(*) AS direct_reports
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

/*** 🧾 List All Managers (i.e., people who have at least one report) ***/
SELECT DISTINCT e.id, e.name
FROM employees e
JOIN employees r ON e.id = r.manager_id;

/***  Get the Name of Each Employee and Their Manager  ***/
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;


