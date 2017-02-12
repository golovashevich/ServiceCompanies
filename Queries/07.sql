-- 7) Find all clients that consume only S1 and S2 services.

USE ServiceCompanies

DECLARE @s1 INT
DECLARE @s2 INT

SET @s1 = 2 -- storage
SET @s2 = 4 -- food

SELECT cust.Name 
FROM Customers cust
	JOIN CustomerServices custS1 ON custS1.CustomerID = cust.CustomerID
	JOIN CustomerServices custS2 ON custS2.CustomerID = cust.CustomerID
WHERE 
	custS1.ServiceID = @s1 
	AND custS2.ServiceID = @s2
	AND cust.CustomerID NOT IN (SELECT cust.CustomerID
			FROM Customers cust
				JOIN CustomerServices custS3 ON custS3.CustomerID = cust.CustomerID
			WHERE 
				custS3.ServiceID NOT IN (@s1, @s2) 
				AND cust.CustomerID IN (SELECT CustomerID FROM CustomerServices)
			)
GROUP BY cust.CustomerID, cust.Name
