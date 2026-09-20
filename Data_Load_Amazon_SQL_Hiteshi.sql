
USE amazon_ecommerce;

CREATE TABLE Orders_cleaned ( 
OrderDate VARCHAR(20), 
OrderID INT, 
DeliveryDate VARCHAR(20), 
CustomerID INT, 
Location VARCHAR(50), 
Zone VARCHAR(20), 
DeliveryType VARCHAR(30), 
ProductCategory VARCHAR(50), 
SubCategory VARCHAR(50), 
Product VARCHAR(200), 
UnitPrice VARCHAR(30), 
ShippingFee VARCHAR(30), 
OrderQuantity INT, 
SalePrice VARCHAR(30), 
Status VARCHAR(20), 
Rating INT, 
ReturnReason VARCHAR(100), 
DeliveryDays INT, 
CustomerCategory VARCHAR(20), 
CustomerAge FLOAT );

BULK INSERT Orders_cleaned
FROM 'C:\Users\hites\Desktop\NS\PowerBI project\B- Ecommerce\Orders_cleaned.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);

select top 5 * from Orders_cleaned;

-- ---------------------------------------------------------------------------------

CREATE TABLE Customers_cleaned (
    CustomerID INT PRIMARY KEY,
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    AgeGroup VARCHAR(20)
);

BULK INSERT Customers_cleaned
FROM 'C:\Users\hites\Desktop\NS\PowerBI project\B- Ecommerce\Customers_cleaned.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);

SELECT TOP 5 * FROM Customers_cleaned;
select top 5 * from Orders_cleaned;

