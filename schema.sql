-- Users table
CREATE TABLE users (
    user_id INT,
    signup_date DATE,
    country TEXT
);

-- Subscriptions table
CREATE TABLE subscriptions (
    subscription_id INT,
    user_id INT,
    start_date DATE,
    end_date DATE,
    plan TEXT
);

-- Payments table
CREATE TABLE payments (
    payment_id INT,
    user_id INT,
    payment_date DATE,
    amount DECIMAL
);

