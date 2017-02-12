-- 12) Find all clients who consume services provided by only two different companies.

USE ServiceCompanies

SELECT cust.Name
FROM Customers cust
	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
GROUP BY cust.Name
HAVING COUNT(DISTINCT(serv.CompanyID)) = 2
