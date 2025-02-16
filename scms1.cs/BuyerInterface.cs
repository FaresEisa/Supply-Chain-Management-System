using System;
using System.Data.SqlClient;

namespace scms1.cs
{
    internal class BuyerInterface
    {
        private static string connectionString = "Server=ROBOLOCO;Database=RobolocoDB;Trusted_Connection=True;";  // Your connection string

        // Display the buyer interface
        public static void Display()
        {
            while (true)
            {
                Console.Clear();

                Console.WriteLine("Buyer Interface");
                Console.WriteLine("================");
                Console.WriteLine("1. Place an Order");
                Console.WriteLine("2. View My Orders (Coming soon)");
                Console.WriteLine("3. View Expenses (Coming soon)");
                Console.WriteLine("0. Logout (Return to Main Menu)");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        PlaceOrder();
                        break;
                    case "2":
                        // ViewOrders();
                        break;
                    case "3":
                        // ViewExpenses();
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

        // Method to place an order
        private static void PlaceOrder()
        {
            int categoryId = ChooseCategory();
            int subcategoryId = ChooseSubcategory(categoryId);
            int itemId = ChooseItem(subcategoryId);

            Console.WriteLine("Enter the quantity you want to purchase:");
            int quantity;
            while (!int.TryParse(Console.ReadLine(), out quantity) || quantity <= 0)
            {
                Console.WriteLine("Please enter a valid quantity.");
            }

            decimal price = GetItemPrice(itemId);
            decimal totalPrice = price * quantity;

            // Store the order in the database
            StoreOrder(itemId, quantity, totalPrice);

            Console.WriteLine($"Order placed successfully! Total Price: {totalPrice:C}");
            Console.WriteLine("Press any key to return to the menu...");
            Console.ReadKey();
        }

        // Method to choose category
        private static int ChooseCategory()
        {
            Console.Clear();
            Console.WriteLine("Select a Category:");
            Console.WriteLine("===================");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, ClassName FROM Categories ORDER BY Id";
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
                    query = "SELECT Id FROM Categories ORDER BY Id";
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
                string query = "SELECT Id, SubcategoryName FROM Subcategories WHERE CategoryId = @CategoryId ORDER BY Id";
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
                    query = "SELECT Id FROM Subcategories WHERE CategoryId = @CategoryId ORDER BY Id";
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
        // Method to choose item
        private static int ChooseItem(int subcategoryId)
        {
            Console.Clear();
            Console.WriteLine("Select an Item:");
            Console.WriteLine("===============");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Include stock in the query
                string query = "SELECT Id, ItemName, Price, Stock FROM Items WHERE SubcategoryId = @SubcategoryId ORDER BY Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SubcategoryId", subcategoryId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    int i = 1;
                    while (reader.Read())
                    {
                        Console.WriteLine($"{i}. {reader["ItemName"]} - Price: {reader["Price"]} - Stock: {reader["Stock"]}");
                        i++;
                    }

                    Console.WriteLine("Enter the number of the item:");
                    int choice = int.Parse(Console.ReadLine()) - 1;
                    reader.Close();

                    // Retrieve the ID of the selected item
                    query = "SELECT Id FROM Items WHERE SubcategoryId = @SubcategoryId ORDER BY Id";
                    cmd.CommandText = query;
                    reader = cmd.ExecuteReader();
                    for (int j = 0; j <= choice; j++) reader.Read();
                    int itemId = (int)reader["Id"];
                    reader.Close();
                    return itemId;
                }
            }
        }


        // Method to get the price of an item
        private static decimal GetItemPrice(int itemId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Price FROM Items WHERE Id = @ItemId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    return (decimal)cmd.ExecuteScalar();
                }
            }
        }

        // Method to store the order in the database
        private static void StoreOrder(int itemId, int quantity, decimal totalPrice)
        {
            int buyerId = GetCurrentBuyerId();  // Assuming this method gets the current buyer's ID

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO BuyerOrders (BuyerId, ItemName, Quantity, TotalPrice) VALUES (@BuyerId, @ItemName, @Quantity, @TotalPrice)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@BuyerId", buyerId);
                    cmd.Parameters.AddWithValue("@ItemName", GetItemName(itemId));  // Assuming this method retrieves item name
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@TotalPrice", totalPrice);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to get the item name
        private static string GetItemName(int itemId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ItemName FROM Items WHERE Id = @ItemId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ItemId", itemId);
                    return (string)cmd.ExecuteScalar();
                }
            }
        }

        // Placeholder to get the current buyer's ID
        // Placeholder to get the current user's ID based on their role
        private static int GetCurrentBuyerId()
        {
            return AuthManager.GetCurrentUserId("Buyer");
        }

    }
}
