-- Smazání existujících dat z tabulek a resetování identity sloupců
TRUNCATE TABLE ORDERS,
PRODUCTS,
USERS RESTART IDENTITY CASCADE;

-- Generování dat pro tabulku 'products'
DO $$
BEGIN
    FOR i IN 1..300 LOOP
        INSERT INTO products (product_name, price, cost) 
        VALUES (
            'Product ' || chr(65 + ((i - 1) % 26)) || ((i - 1) / 26 + 1)::TEXT, 
            ROUND((10 + random() * 90)::numeric, 2), 
            ROUND((5 + random() * 45)::numeric, 2)
        );
    END LOOP;
    RAISE NOTICE 'Inserted 300 products.';
END $$;

-- Generování dat pro tabulku 'users'
DO $$
BEGIN
    FOR i IN 1..300 LOOP
        INSERT INTO users (user_name) 
        VALUES ('User ' || i::TEXT);
    END LOOP;
    RAISE NOTICE 'Inserted 300 users.';
END $$;

-- Generování dat pro tabulku 'orders'
DO $$
DECLARE
    max_user_id INT;
    max_product_id INT;
BEGIN
    SELECT MAX(user_id) INTO max_user_id FROM users;
    SELECT MAX(product_id) INTO max_product_id FROM products;

    FOR i IN 1..300 LOOP
        INSERT INTO orders (user_id, product_id, quantity, order_date) 
        VALUES (
            (1 + random() * (max_user_id - 1))::INT, 
            (1 + random() * (max_product_id - 1))::INT, 
            (1 + random() * 10)::INT, 
            NOW()::DATE - (random() * 365)::INT
        );
    END LOOP;
    RAISE NOTICE 'Inserted 300 orders.';
END $$;