-- 2) Find all companies that provide services to the specified customer.

USE ServiceCompanies

DECLARE @customerID int
SET @customerID = 1 -- Andrew

SELECT comp.Name as CompanyName
FROM Companies comp
	JOIN [Services] serv ON serv.CompanyID = comp.CompanyID
	JOIN CustomerServices custS ON custS.ServiceID = serv.ServiceID
WHERE 
	custS.CustomerID = @customerID
GROUP BY comp.CompanyID, comp.Name

