CREATE TABLE dept_volunteers (
    dept VARCHAR(50),
    volunteers INT,
    skills VARCHAR(255),
    available_month VARCHAR(7) -- Format: YYYY-MM
);

INSERT INTO dept_volunteers (dept, volunteers, skills, available_month)
VALUES 
    ('Finance', 2, 'Excel,Accounting', '2025-05'),
    ('Admin', 1, 'Coordination', '2025-05'),
    ('IT', 3, 'Networking,Security,SQL', '2025-06');
