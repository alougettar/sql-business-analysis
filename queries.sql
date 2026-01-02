-- 1. Monthly Active Users
SELECT
    DATE_TRUNC('month', signup_date) AS month,
    COUNT(DISTINCT user_id) AS active_users
FROM users
GROUP BY month
ORDER BY month;

-- 2. Total Revenue per Customer
SELECT
    user_id,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY user_id
ORDER BY total_revenue DESC;

-- 3. Customer Churn
SELECT
    COUNT(DISTINCT user_id) AS churned_users
FROM subscriptions
WHERE end_date IS NOT NULL;

-- 4. Active Subscriptions by Plan
SELECT
    plan,
    COUNT(*) AS active_subscriptions
FROM subscriptions
WHERE end_date IS NULL
GROUP BY plan;
