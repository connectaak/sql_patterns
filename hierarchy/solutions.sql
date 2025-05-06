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


