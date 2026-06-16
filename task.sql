-- Drop and recreate database
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Table 1: Countries
CREATE TABLE Countries (
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Table 2: Warehouses (містить CountryID — склад належить країні)
CREATE TABLE Warehouses (
    ID INT NOT NULL PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

-- Table 3: ProductInventory (посилається на Warehouses, без CountryID)
CREATE TABLE ProductInventory (
    ID INT NOT NULL PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    WarehouseAmount INT NOT NULL,
    WarehouseID INT NOT NULL,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate: Countries
INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

-- Populate: Warehouses
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1', 1);
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Populate: ProductInventory
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID)
    VALUES (1, 'AwesomeProduct', 2, 1);
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID)
    VALUES (2, 'AwesomeProduct', 5, 2);