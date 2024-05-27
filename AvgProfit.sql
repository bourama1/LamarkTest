-- prumerny profit z objednavky
SELECT AVG((p.price - p.cost) * o.quantity) AS average_profit_per_order
FROM orders o
JOIN products p ON o.product_id = p.product_id;