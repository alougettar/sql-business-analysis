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

-- ===============================
-- Added by Snehal Kothawade
-- Advanced SaaS Business KPIs
-- ===============================

-- 5. Monthly Recurring Revenue (MRR)
SELECT 
    DATE_TRUNC('month', p.payment_date)
    AS month, SUM(p.amount) AS mrr 
    FROM payments p 
    JOIN subscriptions s ON p.user_id = s.user_id 
    WHERE s.end_date IS NULL 
    GROUP BY month 
    ORDER BY month;

-- 6. Revenue by Subscription Plan
SELECT
    s.plan,
    SUM(p.amount) AS total_revenue
FROM subscriptions s
JOIN payments p ON s.user_id = p.user_id
GROUP BY s.plan
ORDER BY total_revenue DESC;

-- 7. Monthly Churn Trend
SELECT DATE_TRUNC('month', end_date) AS churn_month, 
    COUNT(DISTINCT user_id) AS churned_users
    FROM subscriptions 
    WHERE end_date IS NOT NULL 
    GROUP BY churn_month 
    ORDER BY churn_month;

-- 8. Average Revenue Per User (ARPU)
SELECT
    SUM(p.amount) / COUNT(DISTINCT s.user_id) AS arpu
FROM subscriptions s
JOIN payments p ON s.user_id = p.user_id
WHERE s.end_date IS NULL;
