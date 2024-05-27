-- objednavky dle mesicu sjednocene pro vsechny roky
SELECT TO_CHAR(order_date, 'Month') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY TO_DATE(TO_CHAR(order_date, 'Month'), 'Month');