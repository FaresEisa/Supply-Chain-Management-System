use RobolocoDB
-- Drop SellerStock table if it exists to avoid conflicts
DROP TABLE IF EXISTS SellerStock;

-- Create the SellerStock table
CREATE TABLE SellerStock
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,  -- Foreign Key from Users table (ID as UserID)
    ItemName NVARCHAR(100),
    Quantity INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(ID)  -- Foreign key referencing the Users table's ID
);
