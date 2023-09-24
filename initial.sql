
use networksales;

-- BEGIN TABLE Products
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  id INT AUTO_INCREMENT,
  Product VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  Speed INT NOT NULL,
  Traffic INT NOT NULL,
  Service VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  Duration_month INT NOT NULL,
  CONSTRAINT pk_Products PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Inserting unique rows into Products Table
-- Insert batch #1
INSERT INTO Products (Product, Speed, Traffic, Service, Duration_month)
SELECT DISTINCT Product, Speed, Traffic, Service, Duration_month
FROM dataset;
-- END TABLE Products

-- BEGIN TABLE Customers
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
  id INT AUTO_INCREMENT,
  Customer VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  CONSTRAINT pk_Customers PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Inserting rows into Customers Table
-- Insert batch #1
INSERT INTO Customers (Customer)
SELECT DISTINCT Customer
FROM dataset;
-- END TABLE Customers

-- BEGIN TABLE Time
DROP TABLE IF EXISTS Time;
CREATE TABLE Time (
  id INT AUTO_INCREMENT,
  Date VARCHAR(20) DEFAULT NULL,
  CONSTRAINT pk_Time PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Inserting rows into Time Table
-- Insert batch #1
INSERT INTO Time (Date)
SELECT DISTINCT Date
FROM dataset;
-- END TABLE Time

-- BEGIN TABLE Province
DROP TABLE IF EXISTS Province;
CREATE TABLE Province (
  id INT AUTO_INCREMENT NOT NULL,
  Province VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  CONSTRAINT pk_Province PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Inserting rows into Province Table
-- Insert batch #1
INSERT INTO Province (Province)
SELECT DISTINCT Province
FROM dataset;
-- END TABLE Province

-- BEGIN TABLE City
DROP TABLE IF EXISTS City;
CREATE TABLE City (
  id INT AUTO_INCREMENT,
  City VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  Province_id INT NOT NULL ,
  CONSTRAINT pk_City PRIMARY KEY (id),
  FOREIGN KEY (Province_id) REFERENCES Province(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Inserting rows into City Table
-- Insert batch #1
INSERT INTO City (City, Province_id)
SELECT DISTINCT City, Province.id
FROM dataset
JOIN Province ON dataset.Province = Province.Province;
-- END TABLE City

-- BEGIN TABLE Sales
DROP TABLE IF EXISTS Sales;
CREATE TABLE `Sales` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `Product_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  `Time_id` INT NOT NULL,
  `Province_id` INT NOT NULL,
  `City_id` INT NOT NULL,
  CONSTRAINT pk_Sales PRIMARY KEY (`id`),
  FOREIGN KEY (`Product_id`) REFERENCES `Products` (`id`),
  FOREIGN KEY (`Customer_id`) REFERENCES `Customers` (`id`),
  FOREIGN KEY (`Time_id`) REFERENCES `Time` (`id`),
  FOREIGN KEY (`Province_id`) REFERENCES `Province` (`id`),
  FOREIGN KEY (`City_id`) REFERENCES `City` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Filling the Sales Table
INSERT INTO Sales (Product_id, Customer_id, Time_id, Province_id, City_id)
SELECT DISTINCT Products.id, Customers.id, Time.id, Province.id, City.id
FROM dataset
JOIN Products ON dataset.Product = Products.Product
               AND dataset.Speed = Products.Speed
               AND dataset.Traffic = Products.Traffic
               AND dataset.Service = Products.Service
               AND dataset.Duration_month = Products.Duration_month
JOIN Customers ON dataset.Customer = Customers.Customer
JOIN Time ON dataset.Date = Time.Date
JOIN Province ON dataset.Province = Province.Province
JOIN City ON dataset.City = City.City AND Province.id = City.Province_id;
-- END TABLE Sales

-- Drop TABLE dataset;