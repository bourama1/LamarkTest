-- celkovy zisk
SELECT SUM((p.price - p.cost) * o.quantity) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id;