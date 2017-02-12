-- 1) Find all customers of the specified company.

USE ServiceCompanies

DECLARE @companyID int
SET @companyID = 1 -- Foogle

SELECT cust.Name as CustomerName
FROM Customers cust
	JOIN CustomerServices custS ON cust.CustomerID = custS.CustomerID
	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
	JOIN Companies comp ON comp.CompanyID = serv.CompanyID
WHERE 
	comp.CompanyID = @companyID	  
GROUP BY cust.CustomerID, cust.Name
