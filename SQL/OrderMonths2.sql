-- objednavky dle mesicu sjednocene pro vsechny roky
SELECT
	TO_CHAR(ORDER_DATE, 'Month') AS MONTH,
	COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM
	ORDERS
GROUP BY
	TO_CHAR(ORDER_DATE, 'Month')
ORDER BY
	TO_DATE(TO_CHAR(ORDER_DATE, 'Month'), 'Month');