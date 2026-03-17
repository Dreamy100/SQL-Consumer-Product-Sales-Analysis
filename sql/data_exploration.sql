--                                                 Data Exploration

-- Counting the Rows
SELECT COUNT(*) FROM customers;

-- Checking Column wise Missing Values / Null Values
SELECT
    COUNT(*) FILTER (WHERE name IS NULL) AS name_nulls,
    COUNT(*) FILTER (WHERE category IS NULL) AS category_nulls,
    COUNT(*) FILTER (WHERE mrp IS NULL) AS mrp_nulls,
    COUNT(*) FILTER (WHERE discountPercent IS NULL) AS discount_nulls,
    COUNT(*) FILTER (WHERE discountedSellingPrice IS NULL) AS dsp_nulls,
    COUNT(*) FILTER (WHERE weightInGms IS NULL) AS weight_nulls,
    COUNT(*) FILTER (WHERE availableQuantity IS NULL) AS stock_nulls,
    COUNT(*) FILTER (WHERE outOfStock IS NULL) AS outofstock_nulls,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_nulls
FROM customers;

-- Checking Distinct Categories
SELECT DISTINCT category
FROM customers
ORDER BY category;

-- Counting Products per Category
SELECT categories
COUNT(*) AS product_count
FROM customers
GROUP BY categories
ORDER BY product_categories AS DESC

-- Checking how products are priced
SELECT
MIN(mrp) AS min_price,
MAX(mrp) AS max_price,
ROUND(AVG(mrp),2) AS avg_price
FROM customers
WHERE mrp > 0;

-- Discount Analysis
SELECT
MIN(discountPercent) AS min_discountPercent,
MAX(discountPercent) AS max_discountPercent,
ROUND(AVG(discountPercent),2) AS avg_discountPercent
FROM customers
WHERE discountPercent > 0;

-- Checking if Discounted Price matches formula
-- Formula :- discounted price = mrp * (1 - discountPercent/100)
SELECT
name,
mrp,
discountPercent,
discountedSellingPrice,
ROUND(mrp*(1-discountPercent/100),2) AS expected_price
FROM customers
LIMIT 10;

-- Checking the Average Weight per Category
SELECT category,
AVG(weightInGms) AS avg_weight
FROM customers
GROUP BY category;

-- Finding out the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM customers
GROUP BY category
ORDER BY total_weight;

-- Grouping the Products into Weight Categories like Low, Medium, Bulk.
SELECT category,
COUNT(*) AS total_products,
COUNT(*) FILTER(WHERE weightInGms > 500) AS Bulk_products,
COUNT(*) FILTER(WHERE weightInGms BETWEEN 300 AND 500) AS Medium_products,
COUNT(*) FILTER(WHERE weightInGms < 300) AS Light_products
FROM customers
GROUP BY category;