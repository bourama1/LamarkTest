-- top 10 uzivatelu
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;