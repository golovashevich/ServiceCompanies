-- 3) For the giving customer find all services and companies that provide them.

USE ServiceCompanies

DECLARE @customerID int
SET @customerID = 1 -- Andrew

SELECT serv.Name as ServiceName, comp.Name as CompanyName
FROM Companies comp
	JOIN [Services] serv ON serv.CompanyID = comp.CompanyID
	JOIN CustomerServices custS ON custS.ServiceID = serv.ServiceID
WHERE 
	custS.CustomerID = @customerID
