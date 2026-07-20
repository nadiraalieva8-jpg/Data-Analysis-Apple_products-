#Nodira Alieva - portfolio
#Apple Products SQL Analysis
USE apple_data;
SHOW TABLES;
SELECT *FROM apple_products_pricing; #Show all data
DESCRIBE apple_products_pricing; #structure of table
SELECT Model_Name, Current_Price_USD FROM apple_products_pricing; #Show only product name and current price
SELECT AVG(Current_Price_USD) FROM apple_products_pricing; # SELECT AVG price
SELECT * FROM apple_products_pricing ORDER BY Current_Price_USD DESC LIMIT 1; #Find the most expensive product
SELECT * FROM apple_products_pricing ORDER BY Current_Price_USD ASC LIMIT 1; #Find the cheapest product
SELECT COUNT(*) FROM apple_products_pricing; #Count all products
SELECT * FROM apple_products_pricing WHERE Current_Price_USD > 1000; #Products costing more than $1000
SELECT * FROM apple_products_pricing WHERE Rating > 4.5; #Products with rating above 4.5
SELECT *FROM apple_products_pricing WHERE Stock_Status = 'In Stock'; #Products currently in stock
SELECT Product_Category, COUNT(*) AS number_of_products FROM apple_products_pricing GROUP BY Product_Category; #Number of products by category
SELECT Product_Category, AVG(Current_Price_USD) AS average_price FROM apple_products_pricing GROUP BY Product_Category; #Average price by category
SELECT Product_Category, AVG(Rating) AS average_rating FROM apple_products_pricing GROUP BY Product_Category; #Average rating by category
SELECT Model_Name, Current_Price_USD FROM apple_products_pricing ORDER BY Current_Price_USD DESC LIMIT 10; #Top 10 most expensive products
SELECT Model_Name, Rating FROM apple_products_pricing ORDER BY Rating DESC LIMIT 10; #Top 10 highest-rated products
SELECT Product_Category, AVG(Current_Price_USD) FROM apple_products_pricing GROUP BY Product_Category HAVING AVG(Current_Price_USD) > 800; #Categories with average price above $800
