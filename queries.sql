-- 1. Monthly Active Users
SELECT
    DATE_TRUNC('month', signup_date) AS month,
    COUNT(DISTINCT user_id) AS active_users
FROM users
GROUP BY month
ORDER BY month;

