-- 4) Find clients that do not consume any service.

USE ServiceCompanies

SELECT cust.Name 
FROM Customers cust 
WHERE 
	cust.CustomerID NOT IN (SELECT CustomerID FROM CustomerServices)
