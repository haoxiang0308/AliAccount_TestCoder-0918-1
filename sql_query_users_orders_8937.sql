-- SQL查询：连接用户和订单表
-- 这个查询将用户表和订单表通过用户ID进行连接

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM 
    users u
LEFT JOIN 
    orders o ON u.id = o.user_id
ORDER BY 
    u.id, o.order_date DESC;