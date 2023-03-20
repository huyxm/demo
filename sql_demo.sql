-- Create Products table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(50),
  Price DECIMAL(10,2),
  Category VARCHAR(20),
  Description TEXT,
  QuantityInStock INT
);

-- Create Customers table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Phone VARCHAR(20)
);

-- Create Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATETIME,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
  OrderItemID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  QuantityOrdered INT,
  Price DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Inventory table
CREATE TABLE Inventory (
  ProductID INT PRIMARY KEY,
  QuantityInStock INT,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Products table
INSERT INTO Products (ProductID, Name, Price, Category, Description, QuantityInStock) VALUES
  (1, 'The Great Gatsby', 9.99, 'Books', 'A classic novel by F. Scott Fitzgerald', 100),
  (2, 'iPhone 13', 799.99, 'Electronics', 'The latest smartphone from Apple', 50),
  (3, 'Blue T-Shirt', 19.99, 'Clothing', 'A comfortable and stylish t-shirt', 200),
  (4, 'Harry Potter and the Sorcerer''s Stone', 12.99, 'Books', 'The first book in the Harry Potter series', 75),
  (5, 'Samsung 4K TV', 999.99, 'Electronics', 'A high-quality 4K TV from Samsung', 25),
  (6, 'Black Hoodie', 29.99, 'Clothing', 'A cozy and warm hoodie for cold weather', 150);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
  (1, 'John Smith', 'johnsmith@gmail.com', '555-1234'),
  (2, 'Jane Doe', 'janedoe@gmail.com', '555-5678'),
  (3, 'Bob Johnson', 'bobjohnson@gmail.com', '555-9012');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
  (1, 1, '2023-03-18 10:00:00'),
  (2, 2, '2023-03-17 14:00:00'),
  (3, 1, '2023-03-15 12:00:00');

-- Insert sample data into Order_Items table
INSERT INTO Order_Items (OrderItemID, OrderID, ProductID, QuantityOrdered, Price) VALUES
  (1, 1, 1, 2, 9.99),
  (2, 1, 3, 1, 19.99),
  (3, 2, 2, 1, 799.99),
  (4, 2, 4, 3, 12.99),
  (5, 3, 6, 2, 29.99);
