--                                             Creating the Table

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(255) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER

);