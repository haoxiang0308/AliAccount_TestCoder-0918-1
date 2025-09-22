-- 高级SQL查询示例：连接用户表和订单表的不同方式

-- 1. INNER JOIN: 只返回在两个表中都存在的用户记录
SELECT 
    u.user_id,
    u.username,
    u.email,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    users u
INNER JOIN 
    orders o ON u.user_id = o.user_id
ORDER BY 
    u.user_id, o.order_date;

-- 2. LEFT JOIN: 返回所有用户，即使他们没有订单
SELECT 
    u.user_id,
    u.username,
    u.email,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    users u
LEFT JOIN 
    orders o ON u.user_id = o.user_id
ORDER BY 
    u.user_id, o.order_date;

-- 3. 带聚合的查询：显示每个用户的订单总数和总金额
SELECT 
    u.user_id,
    u.username,
    u.email,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM 
    users u
LEFT JOIN 
    orders o ON u.user_id = o.user_id
GROUP BY 
    u.user_id, u.username, u.email
ORDER BY 
    total_spent DESC;