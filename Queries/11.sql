-- 11) Find all clients who consume services provided only by one arbitrary company.

USE ServiceCompanies

SELECT cust.Name
FROM Customers cust
	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
GROUP BY cust.Name
HAVING COUNT(DISTINCT(serv.CompanyID)) = 1
