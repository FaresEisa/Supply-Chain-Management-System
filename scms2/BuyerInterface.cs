using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace scms2.cs
{
    internal class BuyerInterface
    {
        private static string connectionString = "Server=ROBOLOCO;Database=RobolocoDB;Trusted_Connection=True;";

        public static void Display()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("Buyer Interface\n===============");
                Console.WriteLine("1. View Items by Category");
                Console.WriteLine("2. View My Orders");
                Console.WriteLine("0. Logout (Return to Main Menu)");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1": ChooseCategoryAndSubcategory(); break;
                    case "2": ViewMyOrders(); break;
                    case "0": return;
                    default: Console.WriteLine("Invalid choice. Please try again."); break;
                }
            }
        }

        private static void ViewMyOrders()
        {
            Console.WriteLine("Order history feature is not yet implemented.");
            Console.WriteLine("Press any key to return...");
            Console.ReadKey();
        }

        private static void ChooseCategoryAndSubcategory()
        {
            int categoryId = ChooseCategory();
            int subcategoryId = ChooseSubcategory(categoryId);
            ViewAvailableItems(subcategoryId);
        }

        private static int ChooseCategory()
        {
            Console.Clear();
            Console.WriteLine("Select a Category:\n===================");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, ClassName FROM Categories ORDER BY Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int i = 1;
                    while (reader.Read())
                        Console.WriteLine($"{i++}. {reader["ClassName"]}");
                }
            }
            Console.Write("Enter the number of the category: ");
            return int.Parse(Console.ReadLine());
        }

        private static int ChooseSubcategory(int categoryId)
        {
            Console.Clear();
            Console.WriteLine("Select a Subcategory:\n======================");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, SubcategoryName FROM Subcategories WHERE CategoryId = @CategoryId ORDER BY Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int i = 1;
                        while (reader.Read())
                            Console.WriteLine($"{i++}. {reader["SubcategoryName"]}");
                    }
                }
            }
            Console.Write("Enter the number of the subcategory: ");
            return int.Parse(Console.ReadLine());
        }

        private static void ViewAvailableItems(int subcategoryId)
        {
            Console.Clear();
            Console.WriteLine("Available Items:\n================");

            List<int> itemIds = new List<int>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, ItemName, Price, Stock FROM Items WHERE SubcategoryId = @SubcategoryId AND Stock > 0 ORDER BY ItemName";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SubcategoryId", subcategoryId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        int i = 1;
                        while (reader.Read())
                        {
                            Console.WriteLine($"{i}. {reader["ItemName"]} - Price: {reader["Price"]} - Stock: {reader["Stock"]}");
                            itemIds.Add((int)reader["Id"]);
                            i++;
                        }
                    }
                }
            }
            int choice;
            while (true)
            {
                Console.Write("Enter the number of the item you want to buy, or 0 to return: ");
                if (int.TryParse(Console.ReadLine(), out choice) && choice >= 0 && choice <= itemIds.Count)
                    break;
                Console.WriteLine("Invalid input. Please enter a valid number.");
            }
            if (choice > 0) PlaceOrder(itemIds[choice - 1]);
        }

        private static void PlaceOrder(int itemId)
        {
            int buyerId = GetCurrentUserId();
            int quantity;

            while (true)
            {
                Console.Write("Enter the quantity you want to buy: ");
                if (int.TryParse(Console.ReadLine(), out quantity) && quantity > 0)
                    break;
                Console.WriteLine("Invalid quantity. Please enter a valid number.");
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlTransaction transaction = conn.BeginTransaction())
                {
                    try
                    {
                        // Get available stock
                        string checkStockQuery = "SELECT Stock FROM Items WHERE Id = @ItemId";
                        using (SqlCommand cmd = new SqlCommand(checkStockQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@ItemId", itemId);
                            int availableStock = (int)cmd.ExecuteScalar();
                            if (quantity > availableStock)
                                throw new Exception("Not enough stock available.");
                        }

                        // Deduct stock from sellers in priority order
                        string getSellerStockQuery = @"
                SELECT ID, Quantity 
                FROM SellerStock 
                WHERE ItemName = (SELECT ItemName FROM Items WHERE Id = @ItemId) 
                    AND Quantity > 0 
                ORDER BY Quantity DESC"; // Priority: highest quantity first

                        using (SqlCommand getSellersCmd = new SqlCommand(getSellerStockQuery, conn, transaction))
                        {
                            getSellersCmd.Parameters.AddWithValue("@ItemId", itemId);
                            using (SqlDataReader reader = getSellersCmd.ExecuteReader())
                            {
                                List<(int SellerStockId, int AvailableStock)> sellers = new();
                                while (reader.Read())
                                {
                                    sellers.Add((reader.GetInt32(0), reader.GetInt32(1)));
                                }
                                reader.Close();

                                int remainingQuantity = quantity;

                                foreach (var (sellerStockId, sellerStock) in sellers)
                                {
                                    if (remainingQuantity <= 0)
                                        break;

                                    int deductAmount = Math.Min(remainingQuantity, sellerStock);
                                    remainingQuantity -= deductAmount;

                                    string updateSellerStockQuery = @"
                            UPDATE SellerStock 
                            SET Quantity = Quantity - @DeductAmount 
                            WHERE ID = @SellerStockId";

                                    using (SqlCommand updateCmd = new SqlCommand(updateSellerStockQuery, conn, transaction))
                                    {
                                        updateCmd.Parameters.AddWithValue("@DeductAmount", deductAmount);
                                        updateCmd.Parameters.AddWithValue("@SellerStockId", sellerStockId);
                                        updateCmd.ExecuteNonQuery();
                                    }
                                }
                            }
                        }

                        // Update the general stock of the item in the Items table
                        string updateItemStock = "UPDATE Items SET Stock = Stock - @Quantity WHERE Id = @ItemId";
                        using (SqlCommand cmd = new SqlCommand(updateItemStock, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@Quantity", quantity);
                            cmd.Parameters.AddWithValue("@ItemId", itemId);
                            cmd.ExecuteNonQuery();
                        }

                        // Insert the order into the BuyerOrders table
                        string insertOrder = @"
                INSERT INTO BuyerOrders (BuyerId, ItemId, Quantity, TotalPrice) 
                VALUES (@BuyerId, @ItemId, @Quantity, 
                        (SELECT Price FROM Items WHERE Id = @ItemId) * @Quantity)";

                        using (SqlCommand cmd = new SqlCommand(insertOrder, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@BuyerId", buyerId);
                            cmd.Parameters.AddWithValue("@ItemId", itemId);
                            cmd.Parameters.AddWithValue("@Quantity", quantity);
                            cmd.ExecuteNonQuery();
                        }

                        transaction.Commit();
                        Console.WriteLine("Order placed successfully!");
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }
        }



        private static int GetCurrentUserId()
        {
            return AuthManager.GetCurrentUserId("Buyer");
        }
    }
}