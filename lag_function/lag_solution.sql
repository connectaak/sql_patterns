SELECT
  signup_date,
  user_type,
  signups,
  LAG(signups) OVER (PARTITION BY user_type ORDER BY signup_date) AS prev_signups,
  LEAD(signups) OVER (PARTITION BY user_type ORDER BY signup_date) AS next_signups,
  FIRST_VALUE(signups) OVER (PARTITION BY user_type ORDER BY signup_date) AS first_signup,
  LAST_VALUE(signups) OVER (
    PARTITION BY user_type ORDER BY signup_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_signup,
  SUM(signups) OVER (PARTITION BY user_type ORDER BY signup_date) AS running_total
FROM app_signups;
