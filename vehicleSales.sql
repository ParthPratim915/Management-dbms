-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS service_records;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS models;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

-- Create Manufacturers Table
CREATE TABLE manufacturers (
    manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

-- Insert Manufacturers Data
INSERT INTO manufacturers (name, country) VALUES
('Toyota','Japan'),('Ford','USA'),('Volkswagen','Germany'),('Honda','Japan'),
('Chevrolet','USA'),('Hyundai','South Korea'),('BMW','Germany'),('Nissan','Japan'),
('Kia','South Korea'),('Mercedes-Benz','Germany');

-- Create Models Table
CREATE TABLE models (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    manufacturer_id INT,
    model_name VARCHAR(100),
    year INT,
    type VARCHAR(30),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

-- Insert Models Data
INSERT INTO models (manufacturer_id, model_name, year, type) VALUES
(1, 'Corolla', 2023, 'Sedan'),(2, 'F-150', 2024, 'Truck'),(3, 'Golf', 2022, 'Hatchback'),(4, 'Civic', 2023, 'Sedan'),
(5, 'Impala', 2022, 'Sedan'),(6, 'Elantra', 2023, 'Sedan'),(7, 'X5', 2024, 'SUV'),(8, 'Altima', 2023, 'Sedan'),
(9, 'Seltos', 2024, 'SUV'),(10, 'C-Class', 2024, 'Sedan');

-- Create Vehicles Table
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    model_id INT,
    VIN VARCHAR(20) UNIQUE,
    color VARCHAR(30),
    price DECIMAL(12,2),
    status ENUM('Available','Sold','Reserved'),
    FOREIGN KEY (model_id) REFERENCES models(model_id)
);

-- Insert Vehicles Data
INSERT INTO vehicles (model_id, VIN, color, price, status) VALUES
(1,'JT1234567','White',22000,'Available'),(2,'FD9876543','Blue',34000,'Available'),(3,'VW4561237','Red',20500,'Reserved'),
(4,'HN7539512','Silver',23000,'Sold'),(5,'CH3692581','Black',21000,'Available'),(6,'HY1237894','Grey',19500,'Sold'),
(7,'BM3710265','White',62000,'Available'),(8,'NS7520134','Maroon',24000,'Available'),(9,'KI4532107','Blue',27000,'Reserved'),
(10,'MB1243569','Black',66000,'Sold');

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Insert Customers Data
INSERT INTO customers (name, email, phone, address) VALUES
('Alex Grant', 'alex@email.com', '555-1231', '101 Main St'),
('Beth Shaw', 'beth@email.com', '555-1232', '102 Elm St'),
('Carl Finn', 'carl@email.com', '555-1233', '103 Oak St'),
('Dana Reed', 'dana@email.com', '555-1234', '104 Pine St'),
('Eva Daniels', 'eva@email.com', '555-1235', '105 Cedar St'),
('Frank Moss', 'frank@email.com', '555-1236', '106 Maple St'),
('Gina Lee', 'gina@email.com', '555-1237', '107 Birch St'),
('Hank Drew', 'hank@email.com', '555-1238', '108 Walnut St'),
('Ivy Ross', 'ivy@email.com', '555-1239', '109 Spruce St'),
('James Poe', 'james@email.com', '555-1240', '110 Willow St');

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    position VARCHAR(50)
);

-- Insert Employees Data
INSERT INTO employees (name, email, phone, position) VALUES
('Emily Carter','emily@email.com','555-2011','Manager'),
('Mike Stone','mike@email.com','555-2012','Sales Rep'),
('Susan Hale','susan@email.com','555-2013','Sales Rep'),
('Robert Ford','robert@email.com','555-2014','Mechanic'),
('Karen Miles','karen@email.com','555-2015','Sales Rep'),
('Tom Black','tom@email.com','555-2016','Finance'),
('Linda Brown','linda@email.com','555-2017','Receptionist'),
('David Sung','david@email.com','555-2018','Service Advisor'),
('Nina Rich','nina@email.com','555-2019','Sales Rep'),
('Jeff Ray','jeff@email.com','555-2020','Mechanic');

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    customer_id INT,
    employee_id INT,
    sale_date DATETIME,
    sale_price DECIMAL(12,2),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Sales Data
INSERT INTO sales (vehicle_id, customer_id, employee_id, sale_date, sale_price) VALUES
(4,1,1,'2025-08-01 10:00:00',23000),(6,2,2,'2025-08-02 11:00:00',19500),
(10,3,3,'2025-08-03 12:00:00',66000),(3,4,1,'2025-08-04 09:30:00',20500),
(7,5,4,'2025-08-05 13:15:00',62000),(9,6,5,'2025-08-06 15:20:00',27000),
(5,7,2,'2025-08-07 16:45:00',21000),(8,8,3,'2025-08-08 17:10:00',24000),
(2,9,5,'2025-08-09 18:00:00',34000),(1,10,1,'2025-08-10 11:30:00',22000);

-- Create Service Records Table
CREATE TABLE service_records (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    service_date DATE,
    description TEXT,
    employee_id INT,
    cost DECIMAL(10,2),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Service Records Data
INSERT INTO service_records (vehicle_id, service_date, description, employee_id, cost) VALUES
(1,'2025-06-01','Oil Change',4,60.00),(2,'2025-06-05','Brake Pads',10,185.00),
(3,'2025-07-01','Tire Rotation',4,40.00),(4,'2025-07-05','Battery Replacement',10,120.00),
(5,'2025-07-10','Engine Tune-up',4,200.00),(6,'2025-07-15','Air Filter',10,35.00),
(7,'2025-07-20','Transmission Service',4,300.00),(8,'2025-07-25','AC Repair',10,220.00),
(9,'2025-07-30','Alignment',4,90.00),(10,'2025-08-01','Coolant Flush',10,70.00);

-- Create Parts Table
CREATE TABLE parts (
    part_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    manufacturer_id INT,
    price DECIMAL(10,2),
    in_stock INT,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

-- Insert Parts Data
INSERT INTO parts (name, manufacturer_id, price, in_stock) VALUES
('Oil Filter',1,14.99,60),('Brake Pads',2,35.99,40),('Battery',3,120.00,15),
('Air Filter',4,12.50,50),('Spark Plug',5,8.00,100),('Tire',6,89.99,25),
('Headlight',7,150.00,10),('AC Compressor',8,340.00,8),('Alternator',9,220.00,12),
('Radiator',10,180.00,20);

-- Call AddVehicle: Add a new vehicle
CALL AddVehicle(1, 'AB123456789', 'Silver', 23000.00, 'Available');

-- Call RecordSale: Record a sale and update vehicle status
CALL RecordSale(1, 1, 2, '2025-08-18 10:00:00', 22000.00);

-- Call ShowAvailableVehiclesByManufacturer: List available vehicles for a manufacturer
CALL ShowAvailableVehiclesByManufacturer(1);