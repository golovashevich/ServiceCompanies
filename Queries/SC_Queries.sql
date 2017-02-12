USE ServiceCompanies

-- pp. 1-9, 11-12 are workable. Uncomment appropriate SQL statement in order to see how it works

---- 1) Find all customers of the specified company.
--DECLARE @companyID int
--SET @companyID = 1 -- Foogle
--SELECT cust.Name as CustomerName
--FROM Customers cust
--	JOIN CustomerServices custS ON cust.CustomerID = custS.CustomerID
--	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
--	JOIN Companies comp ON comp.CompanyID = serv.CompanyID
--WHERE comp.CompanyID = @companyID	  
--GROUP BY cust.CustomerID, cust.Name

---- 2) Find all companies that provide services to the specified customer.
--DECLARE @customerID int
--SET @customerID = 1 -- Andrew
--SELECT comp.Name as CompanyName
--FROM Companies comp
--	JOIN [Services] serv ON serv.CompanyID = comp.CompanyID
--	JOIN CustomerServices custS ON custS.ServiceID = serv.ServiceID
--WHERE custS.CustomerID = @customerID
--GROUP BY comp.CompanyID, comp.Name

---- 3) For the giving customer find all services and companies that provide them.
--DECLARE @customerID int
--SET @customerID = 1 -- Andrew
--SELECT serv.Name as ServiceName, comp.Name as CompanyName
--FROM Companies comp
--	JOIN [Services] serv ON serv.CompanyID = comp.CompanyID
--	JOIN CustomerServices custS ON custS.ServiceID = serv.ServiceID
--WHERE custS.CustomerID = @customerID

---- 4) Find clients that do not consume any service.
--SELECT cust.Name 
--FROM Customers cust 
--WHERE cust.CustomerID NOT IN (SELECT CustomerID FROM CustomerServices)

---- 5) Find all clients that consume S1 or S2 services.
--DECLARE @s1 INT
--DECLARE @s2 INT

--SET @s1 = 2 -- storage
--SET @s2 = 4 -- food

--SELECT cust.Name AS CustomerName 
--FROM Customers cust
--	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
--WHERE 
--	custS.ServiceID IN (@s1, @s2)
--GROUP BY cust.CustomerID, cust.Name

---- 6) Find all clients that consume S1 and S2 services.
--DECLARE @s1 INT
--DECLARE @s2 INT

--SET @s1 = 2 -- storage
--SET @s2 = 4 -- food

--SELECT cust.Name 
--FROM Customers cust
--	JOIN CustomerServices custS1 ON custS1.CustomerID = cust.CustomerID
--	JOIN CustomerServices custS2 ON custS2.CustomerID = cust.CustomerID
--WHERE 
--	custS1.ServiceID = @s1 AND custS2.ServiceID = @s2
--GROUP BY cust.CustomerID, cust.Name

---- 7) Find all clients that consume only S1 and S2 services.
--DECLARE @s1 INT
--DECLARE @s2 INT

--SET @s1 = 2 -- storage
--SET @s2 = 4 -- food

--SELECT cust.Name 
--FROM Customers cust
--	JOIN CustomerServices custS1 ON custS1.CustomerID = cust.CustomerID
--	JOIN CustomerServices custS2 ON custS2.CustomerID = cust.CustomerID
--WHERE 
--	custS1.ServiceID = @s1 
--	AND custS2.ServiceID = @s2
--	AND cust.CustomerID NOT IN (SELECT cust.CustomerID
--			FROM Customers cust
--				JOIN CustomerServices custS3 ON custS3.CustomerID = cust.CustomerID
--			WHERE 
--				custS3.ServiceID NOT IN (@s1, @s2) 
--				AND cust.CustomerID IN (SELECT CustomerID FROM CustomerServices)
--			)
	
--GROUP BY cust.CustomerID, cust.Name

---- 8) Find all clients that do not consume S1 service.
--DECLARE @s1 INT
--SET @s1 = 2 -- storage

--SELECT cust.Name
--FROM Customers cust
--WHERE 
--	cust.CustomerID NOT IN (
--			SELECT custS.CustomerID 
--			FROM 
--				CustomerServices custS 
--			WHERE
--				custS.ServiceID = @s1
--		)

---- 9) Find all clients that consume S1 service but do not consume S2 service.
--DECLARE @s1 INT
--DECLARE @s2 INT

--SET @s1 = 4 -- food
--SET @s2 = 2 -- storage

--SELECT cust.Name
--FROM Customers cust
--	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
--WHERE 
--	cust.CustomerID NOT IN (
--			SELECT custS.CustomerID 
--			FROM 
--				CustomerServices custS 
--			WHERE
--				custS.ServiceID = @s2
--		)
--	AND
--		custS.CustomerID = @s1

-- 10) Find all clients of the specified company who consume the same services of the
-- company (but may use different services of other companies).

---- 11) Find all clients who consume services provided only by one arbitrary company.
--SELECT cust.Name
--FROM Customers cust
--	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
--	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
--GROUP BY cust.Name
--HAVING COUNT(DISTINCT(serv.CompanyID)) = 2

---- 12) Find all clients who consume services provided by only two different companies.
--SELECT cust.Name
--FROM Customers cust
--	JOIN CustomerServices custS ON custS.CustomerID = cust.CustomerID
--	JOIN [Services] serv ON serv.ServiceID = custS.ServiceID
--GROUP BY cust.Name
--HAVING COUNT(DISTINCT(serv.CompanyID)) = 2
