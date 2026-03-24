--                                   Data Analysis

-- Finding the Top 10 Most Expensive Products
SELECT name, category, mrp
FROM customers
WHERE mrp > 0
ORDER BY mrp DESC
LIMIT 10;

-- Products with the highest discount
SELECT name, category, discountPercent
FROM customers
ORDER BY discountPercent DESC
LIMIT 10;

-- Price after Discount of the most expensive Products
SELECT name, category, mrp, discountPercent,
ROUND(mrp * (1-discountPercent/100),2) AS price_after_discount
FROM customers
ORDER BY mrp DESC
LIMIT 10;

-- Finding out which Categories Dominate Inventory
SELECT category,
SUM(availableQuantity) AS total_quantity
FROM customers
GROUP BY category
ORDER BY total_quantity DESC;

-- Finding the Categories that have the most Out of Stock Products
SELECT category,
COUNT(*) AS out_of_stock_products
FROM customers
WHERE outOfStock
GROUP BY category
ORDER BY out_of_stock_products DESC
LIMIT 10;

-- Finding out the Stock Distribution
SELECT category,
COUNT(*) AS total_products,
COUNT(*) FILTER (WHERE availableQuantity = 0) AS out_of_stock,
ROUND(AVG(availableQuantity),2) AS avg_stock
FROM customers
GROUP BY category
ORDER BY avg_stock ASC;

-- Finding out whether the Categories have High or Low Average Discount Rate
SELECT
category, ROUND(AVG(discountPercent),2) AS avg_discountPercent,
CASE 
WHEN AVG(discountPercent) > 8 THEN 'high_discount'
ELSE 'low_discount'
END AS discount_rate
FROM customers
GROUP BY category;

-- Top 10 product with the highest MRP and their Discount Rate
SELECT
name, mrp, discountPercent,
CASE 
WHEN discountPercent > 8 THEN 'high_discount'
ELSE 'low_discount'
END AS discount_rate
FROM customers
ORDER BY mrp DESC
LIMIT 10;

-- Finding out the Categories and their Revenue Potential (Estimated Revenue)
-- Revenue = discountedSellingPrice * quantity
SELECT
category,
SUM(discountedSellingPrice*quantity) AS revenue
FROM customers
GROUP BY category
ORDER BY revenue DESC;

-- Product Categories with their available Stock Status
SELECT category, 
total_available_quantity,
CASE
WHEN total_available_quantity < 500 THEN 'low_quantity'
WHEN total_available_quantity BETWEEN 500 AND 1000 THEN 'medium_quantity'
ELSE 'sufficient'
END AS stock_status
FROM (
    SELECT category,
    SUM(availableQuantity) AS total_available_quantity
FROM customers
GROUP BY category
) t
ORDER BY total_available_quantity DESC;

-- Finding out the Price Metric of the Average MRP of the Categories
WITH base_table AS(
    SELECT category,
    ROUND(AVG(mrp),0) AS avg_price
    FROM customers
    GROUP BY category
)
SELECT category, avg_price,
CASE
WHEN avg_price > 160 THEN 'high_price'
WHEN avg_price BETWEEN 100 AND 159 THEN 'medium_price'
ELSE 'low_price'
END AS price_metric
FROM base_table
ORDER BY avg_price DESC;

-- Finding out the Best Discount Available From All Categories 
SELECT
category,
SUM(mrp) AS total_mrp,
SUM(discountedSellingPrice) AS total_selling_price,
SUM(mrp) - SUM(discountedSellingPrice) AS total_discount,
ROUND((SUM(mrp) - SUM(discountedSellingPrice)) * 100.0 / SUM(mrp),2) AS discount_percent
FROM customers
GROUP BY category
ORDER BY discount_percent DESC;

-- Finding out how much Revenue is lost due to Discounts
SELECT
category,
SUM((mrp - discountedSellingPrice) * quantity) AS total_revenue_loss
FROM customers
GROUP BY category;

-- Finding out which Category has the Highest Stock But Lowest Sales
WITH category_stats AS(
    SELECT
    category,
    SUM(availableQuantity) AS total_stock,
    SUM(quantity) AS total_sales
    FROM customers
    GROUP BY category
)
SELECT * 
FROM category_stats
ORDER BY total_stock DESC , total_sales ASC;

-- Finding out which Products have High Discounts But Low Sales
SELECT
name,
discountPercent,
SUM(quantity) AS units_sold
FROM customers
GROUP BY name, discountPercent
ORDER BY discountPercent DESC, units_sold ASC
LIMIT 10;