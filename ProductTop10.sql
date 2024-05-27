-- top 10 nejrpodavanejsich produktu
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM orders
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;