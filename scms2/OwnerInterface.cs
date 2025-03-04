using System;
using System.Data.SqlClient;

namespace scms2.cs
{
    public class OwnerInterface
    {
        private static string connectionString = "Server=ROBOLOCO;Database=RobolocoDB;Trusted_Connection=True;";  // Update with your actual connection string

        // Method to display the Owner Interface
        public static void Display()
        {
            while (true)
            {
                Console.Clear();  // Clears the console for a fresh look each time

                // Display Owner Interface Menu
                Console.WriteLine("Owner Interface");
                Console.WriteLine("===============");
                Console.WriteLine("1. Print Users");
                Console.WriteLine("0. Logout and Return to Main Menu");

                string choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        PrintUsers();
                        break;
                    case "0":
                        LogoutAndReturnToMainMenu();
                        return;  // Exit the current method and go back to MainMenu
                    default:
                        Console.WriteLine("Invalid choice. Please try again.");
                        break;
                }
            }
        }

        // Method to print all users from the 'Users' table
        public static void PrintUsers()
        {
            Console.Clear();
            Console.WriteLine("List of Users:");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, Name, Role, Email FROM Users";  // Fetch all users from Users table

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            int i = 1;
                            while (reader.Read())
                            {
                                Console.WriteLine($"{i}. Name: {reader["Name"]}, Role: {reader["Role"]}, Email: {reader["Email"]}");
                                i++;
                            }
                            Console.WriteLine("Enter the number of the user to select or press 0 to return to the menu:");
                        }
                        else
                        {
                            Console.WriteLine("No users found.");
                        }
                    }
                }
            }

            // User selection
            string userChoice = Console.ReadLine();
            if (int.TryParse(userChoice, out int selectedUserIndex) && selectedUserIndex > 0)
            {
                HandleUserSelection(selectedUserIndex - 1);  // Adjust for 0-based index
            }
            else if (userChoice == "0")
            {
                return;  // Return to the previous menu
            }
            else
            {
                Console.WriteLine("Invalid selection. Returning to menu...");
                Console.ReadKey();
            }
        }

        // Method to handle user selection (e.g., print stock for sellers)
        private static void HandleUserSelection(int userIndex)
        {
            // Retrieve email and role of the selected user
            string userEmail = GetUserEmailByIndex(userIndex);  // Fetch the email based on the index
            string userRole = GetUserRoleByIndex(userIndex);    // Fetch the role based on the index

            if (string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(userRole))
            {
                Console.WriteLine("Invalid user selection.");
                return;
            }

            int userId = GetUserIdByEmailAndRole(userEmail, userRole);  // Fetch the selected user ID based on email and role
            if (userId == -1)
            {
                Console.WriteLine("User not found.");
                return;
            }

            // Now perform actions based on the user's role
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Role FROM Users WHERE Id = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    var role = cmd.ExecuteScalar()?.ToString();

                    if (role == "Seller")
                    {
                        Console.Clear();
                        Console.WriteLine("Selected user is a Seller.");
                        Console.WriteLine("1. Print Seller's Stock");
                        Console.WriteLine("2. Print Seller's Orders (Coming soon)");
                        Console.WriteLine("0. Return to the Previous Menu");

                        string actionChoice = Console.ReadLine();
                        switch (actionChoice)
                        {
                            case "1":
                                PrintSellerStock(userId);  // Print the seller's stock
                                break;
                            case "2":
                                Console.WriteLine("This feature will be available soon.");
                                break;
                            case "0":
                                return;  // Go back to the users list
                            default:
                                Console.WriteLine("Invalid choice. Returning to the menu...");
                                break;
                        }
                    }
                    else
                    {
                        Console.WriteLine("Selected user is not a Seller.");
                    }
                }
            }
        }

        // Method to print stock for the selected seller
        private static void PrintSellerStock(int sellerId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ItemName, Quantity FROM SellerStock WHERE UserID = @UserID ORDER BY ItemName";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", sellerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    Console.Clear();
                    Console.WriteLine("Seller's Stock:");
                    Console.WriteLine("================");

                    bool hasStock = false;
                    while (reader.Read())
                    {
                        hasStock = true;
                        Console.WriteLine($"{reader["ItemName"]} - Quantity: {reader["Quantity"]}");
                    }

                    if (!hasStock)
                    {
                        Console.WriteLine("This seller has no stock yet.");
                    }

                    reader.Close();
                }
            }

            Console.WriteLine("\nPress any key to return to the previous menu...");
            Console.ReadKey();
        }

        // Method to get user email by index
        private static string GetUserEmailByIndex(int index)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Email FROM Users ORDER BY Id";  // Order by ID to get the correct sequence

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int i = 0;
                    while (reader.Read())
                    {
                        if (i == index)
                        {
                            return reader["Email"].ToString();
                        }
                        i++;
                    }
                }
            }

            return string.Empty;  // Return empty if no email found for the index
        }

        // Method to get user role by index
        private static string GetUserRoleByIndex(int index)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Role FROM Users ORDER BY Id";  // Order by ID to get the correct sequence

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int i = 0;
                    while (reader.Read())
                    {
                        if (i == index)
                        {
                            return reader["Role"].ToString();
                        }
                        i++;
                    }
                }
            }

            return string.Empty;  // Return empty if no role found for the index
        }

        // Method to get user ID based on email and role
        private static int GetUserIdByEmailAndRole(string email, string role)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id FROM Users WHERE Email = @Email AND Role = @Role";  // Query based on both email and role
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Role", role);
                    object result = cmd.ExecuteScalar();  // ExecuteScalar will return the first column of the first row

                    if (result != null)
                    {
                        return (int)result;  // Return the user ID if found
                    }
                    else
                    {
                        Console.WriteLine("User not found with the provided email and role.");
                        return -1;  // Return -1 if no user is found with the specified email and role
                    }
                }
            }
        }

        // Method to logout and return to the main menu
        public static void LogoutAndReturnToMainMenu()
        {
            Console.Clear();
            Console.WriteLine("Logging out...");
            Console.WriteLine("Returning to the Main Menu...");
            Console.WriteLine("Press any key to continue.");
            Console.ReadKey();
            AuthManager.Display();  // Call the MainMenu.Display method to return to the main menu
        }
    }
}
