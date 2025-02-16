using System;
using System.Data.SqlClient;

namespace scms1.cs
{
    internal class SellerInterface
    {
        private static string connectionString = "Server=ROBOLOCO;Database=RobolocoDB;Trusted_Connection=True;";  // Your connection string

        // Display the seller interface
        // Display the seller interface
        public static void Display()
        {
            while (true)
            {
                Console.Clear();

                Console.WriteLine("Seller Interface");
                Console.WriteLine("================");
                Console.WriteLine("1. Add Stock");
                Console.WriteLine("2. View My Stock");  // New option to view seller's stock
                Console.WriteLine("0. Logout (Return to Main Menu)");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        AddStock();
                        break;
                    case "2":
                        PrintSellerStock();
                        break;
                    case "0":
                        Console.WriteLine("Logging out... Returning to the Main Menu.");
                        AuthManager.Display();
                        return;
                    default:
                        Console.WriteLine("Invalid choice. Please try again.");
                        break;
                }
            }
        }

        // Method to add stock
        public static void AddStock()
        {
            int categoryId = ChooseCategory();
            int subcategoryId = ChooseSubcategory(categoryId);
            int itemId = ChooseItem(subcategoryId);

            Console.WriteLine("Enter the stock amount to add:");
            int stockToAdd;
            while (!int.TryParse(Console.ReadLine(), out stockToAdd) || stockToAdd <= 0)
            {
                Console.WriteLine("Please enter a valid stock amount.");
            }

            UpdateItemStock(itemId, stockToAdd);
            RecordSellerStock(itemId, stockToAdd);

            Console.WriteLine("Stock added successfully!");
            Console.WriteLine("Press any key to return to the menu...");
            Console.ReadKey();
        }

        // Method to choose category
        // Method to choose category
        private static int ChooseCategory()
        {
            Console.Clear();
            Console.WriteLine("Select a Category:");
            Console.WriteLine("===================");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, ClassName FROM Categories ORDER BY Id"; // Ensuring order by Id to reflect insertion order
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    int i = 1;
                    while (reader.Read())
                    {
                        Console.WriteLine($"{i}. {reader["ClassName"]}");
                        i++;
                    }

                    Console.WriteLine("Enter the number of the category:");
                    int choice = int.Parse(Console.ReadLine()) - 1;
                    reader.Close();

                    // Retrieve the ID of the selected category
                    query = "SELECT Id FROM Categories ORDER BY Id";  // Ensure it's in the same order as above
                    cmd.CommandText = query;
                    reader = cmd.ExecuteReader();
                    for (int j = 0; j <= choice; j++) reader.Read();
                    int categoryId = (int)reader["Id"];
                    reader.Close();
                    return categoryId;
                }
            }
        }

        // Method to choose subcategory
        private static int ChooseSubcategory(int categoryId)
        {
            Console.Clear();
            Console.WriteLine("Select a Subcategory:");
            Console.WriteLine("======================");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, SubcategoryName FROM Subcategories WHERE CategoryId = @CategoryId ORDER BY Id"; // Ensuring order by Id
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    int i = 1;
                    while (reader.Read())
                    {
                        Console.WriteLine($"{i}. {reader["SubcategoryName"]}");
                        i++;
                    }

                    Console.WriteLine("Enter the number of the subcategory:");
                    int choice = int.Parse(Console.ReadLine()) - 1;
                    reader.Close();

                    // Retrieve the ID of the selected subcategory
                    query = "SELECT Id FROM Subcategories WHERE CategoryId = @CategoryId ORDER BY Id"; // Ensure the same order
                    cmd.CommandText = query;
                    reader = cmd.ExecuteReader();
                    for (int j = 0; j <= choice; j++) reader.Read();
                    int subcategoryId = (int)reader["Id"];
                    reader.Close();
                    return subcategoryId;
                }
            }
        }

        // Method to choose item
        private static int ChooseItem(int subcategoryId)
        {
            Console.Clear();
            Console.WriteLine("Select an Item:");
            Console.WriteLine("===============");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, ItemName, Stock FROM Items WHERE SubcategoryId = @SubcategoryId ORDER BY Id"; // Ensuring order by Id
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SubcategoryId", subcategoryId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    int i = 1;
                    while (reader.Read())
                    {
                        Console.WriteLine($"{i}. {reader["ItemName"]} - Stock: {reader["Stock"]}");
                        i++;
                    }

                    Console.WriteLine("Enter the number of the item:");
                    int choice = int.Parse(Console.ReadLine()) - 1;
                    reader.Close();

                    // Retrieve the ID of the selected item
                    query = "SELECT Id FROM Items WHERE SubcategoryId = @SubcategoryId ORDER BY Id";  // Ensure the same order
                    cmd.CommandText = query;
                    reader = cmd.ExecuteReader();
                    for (int j = 0; j <= choice; j++) reader.Read();
                    int itemId = (int)reader["Id"];
                    reader.Close();
                    return itemId;
                }
            }
        }

        // Method to update the item stock
        private static void UpdateItemStock(int itemId, int stockToAdd)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE Items SET Stock = Stock + @StockToAdd WHERE Id = @ItemId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StockToAdd", stockToAdd);
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to record seller stock change
        private static void RecordSellerStock(int itemId, int stockToAdd)
        {
            int sellerId = GetCurrentUserId();  // Fetch the current seller's ID

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Fetch Item Name using Item ID
                string itemName = "";
                string fetchItemQuery = "SELECT ItemName FROM Items WHERE Id = @ItemId";
                using (SqlCommand fetchCmd = new SqlCommand(fetchItemQuery, conn))
                {
                    fetchCmd.Parameters.AddWithValue("@ItemId", itemId);
                    SqlDataReader reader = fetchCmd.ExecuteReader();
                    if (reader.Read())
                    {
                        itemName = reader["ItemName"].ToString();
                    }
                    reader.Close();
                }

                if (string.IsNullOrEmpty(itemName))
                {
                    Console.WriteLine("Error: Item name not found.");
                    return;
                }

                // Check if the record already exists
                string checkQuery = "SELECT Quantity FROM SellerStock WHERE UserID = @UserID AND ItemName = @ItemName";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@UserID", sellerId);
                    checkCmd.Parameters.AddWithValue("@ItemName", itemName);
                    object existingQuantity = checkCmd.ExecuteScalar();

                    if (existingQuantity != null)  // If record exists, update it
                    {
                        string updateQuery = "UPDATE SellerStock SET Quantity = Quantity + @StockToAdd WHERE UserID = @UserID AND ItemName = @ItemName";
                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                        {
                            updateCmd.Parameters.AddWithValue("@StockToAdd", stockToAdd);
                            updateCmd.Parameters.AddWithValue("@UserID", sellerId);
                            updateCmd.Parameters.AddWithValue("@ItemName", itemName);
                            updateCmd.ExecuteNonQuery();
                        }
                    }
                    else  // If record doesn't exist, insert a new one
                    {
                        string insertQuery = "INSERT INTO SellerStock (UserID, ItemName, Quantity, CreatedAt) VALUES (@UserID, @ItemName, @Quantity, GETDATE())";
                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                        {
                            insertCmd.Parameters.AddWithValue("@UserID", sellerId);
                            insertCmd.Parameters.AddWithValue("@ItemName", itemName);
                            insertCmd.Parameters.AddWithValue("@Quantity", stockToAdd);
                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
        }

        // Method to print stock added by the current seller
        private static void PrintSellerStock()
        {
            int sellerId = GetCurrentUserId();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ItemName, Quantity FROM SellerStock WHERE UserID = @UserID ORDER BY ItemName";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", sellerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    Console.Clear();
                    Console.WriteLine("Your Stock:");
                    Console.WriteLine("============");

                    bool hasStock = false;
                    while (reader.Read())
                    {
                        hasStock = true;
                        Console.WriteLine($"{reader["ItemName"]} - Quantity: {reader["Quantity"]}");
                    }

                    if (!hasStock)
                    {
                        Console.WriteLine("You have not added any stock yet.");
                    }

                    reader.Close();
                }
            }

            Console.WriteLine("\nPress any key to return...");
            Console.ReadKey();
        }



        // Placeholder to get the current user's ID based on their role
        private static int GetCurrentUserId()  // Remove the role parameter
        {
            return AuthManager.GetCurrentUserId("Seller");
        }



    }
}
