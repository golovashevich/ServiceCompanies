-- 9) Find all clients that consume S1 service but do not consume S2 service.

USE ServiceCompanies

DECLARE @s1 INT
DECLARE @s2 INT

SET @s1 = 4 -- food
SET @s2 = 2 -- storage

SELECT cust.Name
FROM Customers cust
	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
WHERE 
	cust.CustomerID NOT IN (
			SELECT custS.CustomerID 
			FROM 
				CustomerServices custS 
			WHERE
				custS.ServiceID = @s2
		)
	AND
		custS.CustomerID = @s1
