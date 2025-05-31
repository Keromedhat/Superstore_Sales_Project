-- Yearly Sales Trends
SELECT YEAR(`order date`) AS Year, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY YEAR(`order date`)
ORDER BY Year;


-- Monthly Sales Trends
SELECT YEAR(`order date`) AS Year, MONTH(`order date`) AS Month, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY YEAR(`order date`), MONTH(`order date`)
ORDER BY Year, Month;

-- Seasonal Sales Trends (assuming seasons are defined as quarters)
SELECT YEAR(`order date`) AS Year, QUARTER(`order date`) AS Season, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY YEAR(`order date`), QUARTER(`order date`)
ORDER BY Year, Season;


-- Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Sales by State
SELECT State, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY State
ORDER BY Total_Sales DESC;


SELECT `ship mode`, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY `ship mode`
ORDER BY Total_Sales DESC;

SELECT Segment, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Top Product Categories
SELECT Category, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top Product Sub-Categories
SELECT `sub-category`, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY `sub-category`
ORDER BY Total_Sales DESC;


SELECT `product name`, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY `product name`
ORDER BY Total_Sales DESC
LIMIT 10; -- Top 10 products


-- Underperforming Product Categories
SELECT Category, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY Category
ORDER BY Total_Sales ASC
LIMIT 10; -- Bottom 10 categories

-- Underperforming Products
SELECT `product name`, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY `product name`
ORDER BY Total_Sales ASC
LIMIT 10; -- Bottom 10 products


-- Customers by Region
SELECT Region, COUNT(DISTINCT `customer id`) AS Customer_Count
FROM Superstore_Cleaned
GROUP BY Region
ORDER BY Customer_Count DESC;

-- Customers by State
SELECT State, COUNT(DISTINCT `customer id`) AS Customer_Count
FROM Superstore_Cleaned
GROUP BY State
ORDER BY Customer_Count DESC;

SELECT Segment, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT `customer id`, `customer name`, COUNT(`order id`) AS Order_Count, SUM(Sales) AS Total_Sales
FROM Superstore_Cleaned
GROUP BY `customer id`, `customer name`
ORDER BY Order_Count DESC, Total_Sales DESC;

SELECT Shipping_Time, COUNT(`order id`) AS Order_Count
FROM (
    SELECT `order id`, DATEDIFF(`ship date`, `order date`) AS Shipping_Time
    FROM Superstore_Cleaned
) AS ShippingAnalysis
GROUP BY Shipping_Time
ORDER BY Order_Count DESC;

SELECT `ship mode`, COUNT(`order id`) AS Order_Count
FROM Superstore_Cleaned
GROUP BY `ship mode`
ORDER BY Order_Count DESC;


