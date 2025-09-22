-- SQL查询：连接用户表和订单表
-- 假设用户表为 users，订单表为 orders
-- 两个表通过 user_id 字段关联

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