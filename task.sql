-- Drop and recreate database
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Table 1: Countries
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Table 2: Warehouses (містить CountryID — звідки товар)
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
);

-- Table 3: ProductInventory (посилається на Warehouses, без CountryID)
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    WarehouseID INT,
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