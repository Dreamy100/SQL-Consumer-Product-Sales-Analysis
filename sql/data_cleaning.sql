--                                               Data Cleaning

-- Products with Price = 0
SELECT * FROM customers
WHERE mrp = 0 OR discountedSellingPrice = 0;
DELETE FROM customers
WHERE mrp = 0;

-- Convert Paise To Rupees
UPDATE customers
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;
SELECT mrp, discountedSellingPrice 
FROM customers;