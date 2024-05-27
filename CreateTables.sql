-- Vytvoření tabulky 'products'
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL
);

-- Vytvoření tabulky 'users'
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL
);

-- Vytvoření tabulky 'orders'
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
