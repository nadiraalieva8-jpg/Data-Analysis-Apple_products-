#Nodira Alieva - portfolio
#Apple Products SQL Analysis
USE apple_data;

SHOW TABLES;

SELECT *FROM apple_products_pricing; #Show all data


DESCRIBE apple_products_pricing; 


SELECT Model_Name, Current_Price_USD FROM apple_products_pricing; #Show only product name and current price

SELECT AVG(Current_Price_USD) FROM apple_products_pricing; # SELECT AVG price

SELECT * FROM apple_products_pricing ORDER BY Current_Price_USD DESC LIMIT 1; #the most expensive product

SELECT * FROM apple_products_pricing ORDER BY Current_Price_USD ASC LIMIT 1; #the cheapest product

SELECT COUNT(*) FROM apple_products_pricing; #Count all products

SELECT * FROM apple_products_pricing WHERE Current_Price_USD > 1000; #Products costing more than $1000

SELECT * FROM apple_products_pricing WHERE Rating > 4.5; #Products with rating above 4.5

SELECT *FROM apple_products_pricing WHERE Stock_Status = 'In Stock'; #Products currently in stock

SELECT Product_Category, 
COUNT(*) AS number_of_products FROM apple_products_pricing GROUP BY Product_Category; #Number of products by category

SELECT Product_Category, 
AVG(Current_Price_USD) AS average_price FROM apple_products_pricing GROUP BY Product_Category; #Average price by category

SELECT Product_Category, 
AVG(Rating) AS average_rating FROM apple_products_pricing GROUP BY Product_Category; #Average rating by category

SELECT Model_Name, Current_Price_USD FROM apple_products_pricing 
ORDER BY Current_Price_USD DESC LIMIT 10; #Top 10 most expensive products

SELECT Model_Name, Rating FROM apple_products_pricing 
ORDER BY Rating DESC LIMIT 10; #Top 10 highest-rated products

SELECT Product_Category, 
AVG(Current_Price_USD) FROM apple_products_pricing GROUP BY Product_Category 
HAVING AVG(Current_Price_USD) > 800; #Categories with average price above $800

#BETWEEN - Products priced between $500 and $1000 
SELECT Model_Name ,Current_Price_USD FROM apple_products_pricing WHERE Current_Price_USD BETWEEN 500 AND 1000;

#In-stock products with rating above 4.5
SELECT Model_Name, Current_Price_USD, Rating FROM apple_products_pricing WHERE Rating > 4.5 AND Stock_Status = 'In Stock';

#Average discount percentage 
SELECT AVG(Discount_Pct) AS Average_Discount FROM apple_products_pricing;

#Product with the highest discount
SELECT Model_Name, Discount_Pct FROM apple_products_pricing ORDER BY Discount_Pct DESC LIMIT 1;

#CASE - Classify products by price
SELECT  Model_Name, Current_Price_USD,
CASE 
	WHEN Current_Price_USD >= 1000 THEN 'Premium' 
	WHEN Current_Price_USD >= 600 THEN 'Mid-range'

ELSE 'Budget' 
END AS Price_Category FROM apple_products_pricing;

#Round
SELECT Product_Category, 
ROUND(AVG(Current_Price_USD),2) AS Average_Price 
FROM apple_products_pricing GROUP BY Product_Category;

#Show unique product categories 
SELECT DISTINCT Product_Category FROM apple_products_pricing;

#Products which start with "iPhone"
SELECT Model_Name FROM apple_products_pricing WHERE Model_Name LIKE 'iPhone%';

#Products containing "Pro"
SELECT Model_Name FROM apple_products_pricing WHERE Model_Name LIKE '%Pro%';

#IN
SELECT * FROM apple_products_pricing WHERE Product_Category IN ('iPhone','MacBook');

#SUM -Total value of all current prices.
SELECT SUM(Current_Price_USD) AS Total_Value FROM apple_products_pricing;

#Products more expensive than average
SELECT
Model_Name,Current_Price_USD
FROM apple_products_pricing
WHERE Current_Price_USD >
(SELECT AVG(Current_Price_USD)
FROM apple_products_pricing);

#Highest rated products
SELECT Model_Name, Rating
FROM apple_products_pricing
WHERE Rating =
(SELECT MAX(Rating)
FROM apple_products_pricing);

#Multiple Conditions
SELECT Model_Name, Current_Price_USD,Rating
FROM apple_products_pricing
WHERE Rating > 4.5
AND Current_Price_USD > 1000;

#Multiple Sorting
SELECT Model_Name, Rating, Current_Price_USD
FROM apple_products_pricing
ORDER BY Rating DESC, Current_Price_USD DESC;

#ROW_NUMBER()
SELECT Model_Name,Current_Price_USD,
ROW_NUMBER()
OVER(ORDER BY Current_Price_USD DESC) AS Price_Rank
FROM apple_products_pricing;

#RANK()
SELECT Model_Name, Rating,
RANK()
OVER(ORDER BY Rating DESC) AS Rating_Rank
FROM apple_products_pricing;

#DENSE_RANK()
SELECT Model_Name, Rating,
DENSE_RANK()
OVER(ORDER BY Rating DESC) AS Rating_Rank
FROM apple_products_pricing;

#Join products with suppliers
SELECT
    p.Model_Name,
    p.Product_Category,
    p.Current_Price_USD,
    s.Supplier,
    s.Country
FROM apple_products_pricing AS p
JOIN product_suppliers AS s
ON p.Product_Category = s.Product_Category;







