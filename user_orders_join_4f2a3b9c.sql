-- SQL Query to join Users and Orders tables
-- This query joins the users and orders tables based on the user_id foreign key relationship

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
ORDER BY u.id, o.order_date DESC;

-- Alternative: Inner join to show only users who have placed orders
/*
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM users u
INNER JOIN orders o ON u.id = o.user_id
ORDER BY u.id, o.order_date DESC;
*/