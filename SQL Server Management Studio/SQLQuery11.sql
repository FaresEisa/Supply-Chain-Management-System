CREATE TABLE Users
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    PasswordHash NVARCHAR(500),
    Role NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UNIQUE (Email, Role) -- This ensures no same email for the same role
);
