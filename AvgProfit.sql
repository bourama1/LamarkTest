-- prumerny profit z objednavky
SELECT
	AVG((P.PRICE - P.COST) * O.QUANTITY) AS AVERAGE_PROFIT_PER_ORDER
FROM
	ORDERS O
	JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;