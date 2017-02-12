-- 8) Find all clients that do not consume S1 service.

USE ServiceCompanies

DECLARE @s1 INT
SET @s1 = 2 -- storage

SELECT cust.Name
FROM Customers cust
WHERE 
	cust.CustomerID NOT IN (
			SELECT custS.CustomerID 
			FROM 
				CustomerServices custS 
			WHERE
				custS.ServiceID = @s1
		)
