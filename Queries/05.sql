-- 5) Find all clients that consume S1 or S2 services.

USE ServiceCompanies

DECLARE @s1 INT
DECLARE @s2 INT

SET @s1 = 2 -- storage
SET @s2 = 4 -- food

SELECT cust.Name AS CustomerName 
FROM Customers cust
	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
WHERE 
	custS.ServiceID IN (@s1, @s2)
GROUP BY cust.CustomerID, cust.Name

