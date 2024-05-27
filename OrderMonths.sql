-- objednavky dle mesicu
SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;