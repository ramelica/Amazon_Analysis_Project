CREATE DATABASE amazon_sales;
USE amazon_sales;

-- Customers Table
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(150),
    Country VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Region VARCHAR(50),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

-- Order Details Table
CREATE TABLE order_details (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    Revenue DECIMAL(10,2),
    ProfitMargin DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);
-- Check total records in each table
SELECT 'customers' AS table_name, COUNT(*) AS `rows` FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_details', COUNT(*) FROM order_details;

-- Peek at some data
SELECT * FROM customers LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_details LIMIT 5;



-- Overall KPIs
SELECT 
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(ProfitMargin), 2) AS Total_Profit,
    COUNT(DISTINCT OrderID) AS Total_Orders,
    ROUND(SUM(Revenue)/COUNT(DISTINCT OrderID), 2) AS Avg_Order_Value
FROM order_details;


-- Yearly and Monthly Revenue
SELECT 
    EXTRACT(YEAR FROM o.OrderDate) AS Year,
    EXTRACT(MONTH FROM o.OrderDate) AS Month,
    ROUND(SUM(od.Revenue), 2) AS Monthly_Revenue,
    ROUND(SUM(od.ProfitMargin), 2) AS Monthly_Profit
FROM order_details od
JOIN orders o ON od.OrderID = o.OrderID
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top 10 Products by Revenue
SELECT 
    p.ProductName,
    ROUND(SUM(od.Revenue), 2) AS Total_Revenue
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Category wise revenue profit margin
SELECT 
    p.Category,
    ROUND(SUM(od.Revenue), 2) AS Category_Revenue,
    ROUND(SUM(od.ProfitMargin), 2) AS Category_Profit
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Category_Revenue DESC;

-- Top 10 Customers by Spent
SELECT 
    c.Name AS Customer,
    ROUND(SUM(od.Revenue), 2) AS Total_Spent
FROM order_details od
JOIN orders o ON od.OrderID = o.OrderID
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY Total_Spent DESC
LIMIT 10;

-- Regional Sales
SELECT 
    o.Region,
    ROUND(SUM(od.Revenue), 2) AS Regional_Revenue,
    ROUND(SUM(od.ProfitMargin), 2) AS Regional_Profit
FROM orders o
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY o.Region
ORDER BY Regional_Revenue DESC;


-- Payment method analysis 
SELECT 
    o.PaymentMethod,
    ROUND(SUM(od.Revenue), 2) AS Payment_Revenue
FROM orders o
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY o.PaymentMethod
ORDER BY Payment_Revenue DESC;
 
 
--  Ranking Top Products Using Window Function

WITH ProductRevenue AS (
    SELECT 
        p.ProductName,
        SUM(od.Revenue) AS Total_Revenue
    FROM order_details od
    JOIN products p ON od.ProductID = p.ProductID
    GROUP BY p.ProductName
)
SELECT 
    ProductName,
    Total_Revenue,
    RANK() OVER (ORDER BY Total_Revenue DESC) AS Rank_By_Revenue
FROM ProductRevenue
LIMIT 10;

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(od.Revenue), 2) AS Monthly_Revenue
FROM orders o
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;
