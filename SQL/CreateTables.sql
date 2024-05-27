-- Smazání tabulek
DROP TABLE IF EXISTS ORDERS;

DROP TABLE IF EXISTS USERS;

DROP TABLE IF EXISTS PRODUCTS;

-- Vytvoření tabulky 'products'
CREATE TABLE PRODUCTS (
	PRODUCT_ID SERIAL PRIMARY KEY,
	PRODUCT_NAME VARCHAR(255) NOT NULL,
	PRICE DECIMAL(10, 2) NOT NULL CHECK (PRICE >= 0),
	COST DECIMAL(10, 2) NOT NULL CHECK (COST >= 0),
	UNIQUE (PRODUCT_NAME) -- Zajistí, že název produktu je unikátní
);

-- Vytvoření tabulky 'users'
CREATE TABLE USERS (
	USER_ID SERIAL PRIMARY KEY,
	USER_NAME VARCHAR(255) NOT NULL,
	UNIQUE (USER_NAME) -- Zajistí, že název uživatele je unikátní
);

-- Vytvoření tabulky 'orders'
CREATE TABLE ORDERS (
	ORDER_ID SERIAL PRIMARY KEY,
	USER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL,
	QUANTITY INT NOT NULL CHECK (QUANTITY > 0),
	ORDER_DATE DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID),
	CHECK (ORDER_DATE <= CURRENT_DATE) -- Zajistí, že datum objednávky není v budoucnosti
);

-- Doplněno omezení pro nekorektní hodnoty v definici tabulek