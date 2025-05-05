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
