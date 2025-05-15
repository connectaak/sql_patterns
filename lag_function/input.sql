l-- Step 1: Create the table
CREATE TABLE app_signups (
  signup_date DATE,
  user_type VARCHAR(20),
  signups INT
);

-- Step 2: Insert sample data
INSERT INTO app_signups (signup_date, user_type, signups) VALUES
('2025-05-01', 'free', 100),
('2025-05-02', 'free', 120),
('2025-05-03', 'free', 115),
('2025-05-01', 'premium', 25),
('2025-05-02', 'premium', 30),
('2025-05-03', 'premium', 28);
