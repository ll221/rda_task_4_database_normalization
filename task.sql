-- Create database
CREATE DATABASE ShopDB;
USE ShopDB;

-- Table 1: Countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

-- Table 2: Warehouses (винесено окремо — 3НФ)
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50)
);

-- Table 3: ProductInventory (посилається на Countries та Warehouses)
CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CountryID INT,
    WarehouseID INT,
    WarehouseAmount INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION
);

-- Populate: Countries
INSERT INTO Countries (ID, Name) VALUES (1, 'Country1');
INSERT INTO Countries (ID, Name) VALUES (2, 'Country2');

-- Populate: Warehouses
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress)
    VALUES (1, 'Warehouse-1', 'City-1, Street-1');
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress)
    VALUES (2, 'Warehouse-2', 'City-2, Street-2');

-- Populate: ProductInventory
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID, CountryID)
    VALUES (1, 'AwesomeProduct', 2, 1, 1);
INSERT INTO ProductInventory (ID, ProductName, WarehouseAmount, WarehouseID, CountryID)
    VALUES (2, 'AwesomeProduct', 5, 2, 2);