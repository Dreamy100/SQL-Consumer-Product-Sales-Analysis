--                                                Loading The Dataset 

\copy customers(Category,name,mrp,discountPercent,availableQuantity,discountedSellingPrice,weightInGms,outOfStock,quantity) FROM 'C:/Users/swapn/OneDrive/Desktop/SQL-Sales-Analysis/data/zepto_v2.csv' DELIMITER ',' CSV HEADER;