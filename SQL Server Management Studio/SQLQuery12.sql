USE RobolocoDB;
-- Drop BuyerOrders table if it exists
DROP TABLE IF EXISTS BuyerOrders;

-- Create the BuyerOrders table
CREATE TABLE BuyerOrders
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    BuyerID INT,  -- Foreign Key from Users table (ID as BuyerID)
    ItemID INT,   -- Foreign Key from Items table
    Quantity INT,
    TotalPrice DECIMAL(18,2),
    OrderDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (BuyerID) REFERENCES Users(ID),
    FOREIGN KEY (ItemID) REFERENCES Items(ID)
);
