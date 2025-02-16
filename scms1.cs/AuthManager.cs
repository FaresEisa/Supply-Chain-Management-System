using System;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;

namespace scms1.cs
{
    internal class AuthManager
    {
        private static string connectionString = "Server=ROBOLOCO;Database=RobolocoDB;Trusted_Connection=True;";  // Update with your actual connection string
        private static int currentSellerId;
        private static int currentBuyerId;
        private static int currentLogisticId;

        // Display the main menu
        public static void Display()
        {
            while (true)
            {
                Console.Clear();  // Clears the console for a fresh look each time

                // Display "Main Menu" title at the top
                Console.WriteLine("Main Menu");
                Console.WriteLine("==========");

                // Display the main menu options
                Console.WriteLine("1. Register");
                Console.WriteLine("2. Login");
                Console.WriteLine("0. Exit");

                string choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        Register();
                        break;
                    case "2":
                        Login();
                        break;
                    case "0":
                        Console.WriteLine("Exiting... Goodbye!");
                        Environment.Exit(0);  // Exit the application
                        break;
                    default:
                        Console.WriteLine("Invalid choice. Please try again.");
                        break;
                }
            }
        }

        // Display the registration menu
        public static void Register()
        {
            Console.Clear();
            Console.WriteLine("Registration");
            Console.WriteLine("=============");

            Console.WriteLine("1. Register Owner");
            Console.WriteLine("2. Register Seller");
            Console.WriteLine("3. Register Buyer");
            Console.WriteLine("4. Register Logistic");
            Console.WriteLine("0. Return to Main Menu");

            string choice = Console.ReadLine();
            string role = string.Empty;

            switch (choice)
            {
                case "1":
                    role = "Owner";
                    RegisterOwner(role);
                    break;
                case "2":
                    role = "Seller";
                    RegisterUser(role);
                    break;
                case "3":
                    role = "Buyer";
                    RegisterUser(role);
                    break;
                case "4":
                    role = "Logistic";
                    RegisterUser(role);
                    break;
                case "0":
                    AuthManager.Display();  // Return to Main Menu
                    break;
                default:
                    Console.WriteLine("Invalid choice. Returning to the Main Menu...");
                    break;
            }
        }

        // Check if an owner already exists in the database
        public static bool IsOwnerRegistered()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Role = 'Owner'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0; // If there's already one owner, return true
                }
            }
        }

        // Check if an email is already used for the same role
        public static bool IsEmailAlreadyUsedForRole(string email, string role)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Role = @Role";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Role", role);

                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        // Register the owner (only one owner allowed)
        public static void RegisterOwner(string role)
        {
            if (IsOwnerRegistered())
            {
                Console.WriteLine("An owner is already registered. Only one owner can exist.");
            }
            else
            {
                Console.WriteLine($"Enter the {role}'s name:");
                string name = Console.ReadLine();

                Console.WriteLine($"Enter the {role}'s email:");
                string email = Console.ReadLine();

                if (IsEmailAlreadyUsedForRole(email, role))
                {
                    Console.WriteLine($"The email {email} is already registered for an {role}.");
                    Console.WriteLine("Press any key to return to the main menu...");
                    Console.ReadKey();
                    AuthManager.Display();
                    return;
                }

                Console.WriteLine($"Enter the {role}'s password:");
                string password = Console.ReadLine();

                string hashedPassword = HashPassword(password);

                InsertUserIntoDatabase(name, email, hashedPassword, role);

                Console.WriteLine($"{role} {name} has been successfully registered.");
            }

            Console.WriteLine("Press any key to return to the main menu...");
            Console.ReadKey();
            AuthManager.Display();
        }

        // General method to register user with a specific role
        public static void RegisterUser(string role)
        {
            Console.WriteLine($"Enter the {role}'s name:");
            string name = Console.ReadLine();

            Console.WriteLine($"Enter the {role}'s email:");
            string email = Console.ReadLine();

            if (IsEmailAlreadyUsedForRole(email, role))
            {
                Console.WriteLine($"The email {email} is already registered for the {role} role.");
                Console.WriteLine("Press any key to return to the main menu...");
                Console.ReadKey();
                AuthManager.Display();
                return;
            }

            Console.WriteLine($"Enter the {role}'s password:");
            string password = Console.ReadLine();

            string hashedPassword = HashPassword(password);

            InsertUserIntoDatabase(name, email, hashedPassword, role);

            Console.WriteLine($"{role} {name} has been successfully registered.");
            Console.WriteLine("Press any key to return to the main menu...");
            Console.ReadKey();
            AuthManager.Display();
        }

        // Method to insert the user into the database
        public static void InsertUserIntoDatabase(string name, string email, string passwordHash, string role)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Users (Name, Email, PasswordHash, Role) VALUES (@Name, @Email, @PasswordHash, @Role)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to hash the password using SHA-256
        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashBytes);
            }
        }

        // Method for login
        public static void Login()
        {
            Console.Clear();
            Console.WriteLine("Login");
            Console.WriteLine("=====");

            Console.WriteLine("1. Login as Owner");
            Console.WriteLine("2. Login as Buyer");
            Console.WriteLine("3. Login as Seller");
            Console.WriteLine("4. Login as Logistic");
            Console.WriteLine("0. Return to Main Menu");

            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    LoginAsOwner();
                    break;
                case "2":
                    LoginAsBuyer();
                    break;
                case "3":
                    LoginAsSeller();
                    break;
                case "4":
                    LoginAsLogistic();
                    break;
                case "0":
                    AuthManager.Display();  // Return to Main Menu
                    break;
                default:
                    Console.WriteLine("Invalid choice. Please try again.");
                    break;
            }
        }

        // Method for login as the owner
        public static void LoginAsOwner()
        {
            LoginAsUser("Owner");
        }

        // Method for login as the buyer
        public static void LoginAsBuyer()
        {
            LoginAsUser("Buyer");
        }

        // Method for login as the seller
        public static void LoginAsSeller()
        {
            LoginAsUser("Seller");
        }

        // Method for login as the logistic
        public static void LoginAsLogistic()
        {
            LoginAsUser("Logistic");
        }

        // Method to store the current user ID for each role
        public static void StoreCurrentUserId(int userId, string role)
        {
            switch (role)
            {
                case "Seller":
                    currentSellerId = userId;
                    break;
                case "Buyer":
                    currentBuyerId = userId;
                    break;
                case "Logistic":
                    currentLogisticId = userId;
                    break;
                case "Owner":
                    // You might also want to handle storing the Owner's ID
                    break;
            }
        }

        // Generic method for login as any user
        // Generic method for login as any user
        public static void LoginAsUser(string role)
        {
            Console.WriteLine($"Enter the {role.ToLower()}'s email:");
            string email = Console.ReadLine();

            Console.WriteLine($"Enter the {role.ToLower()}'s password:");
            string password = Console.ReadLine();

            int userId = GetUserIdFromDatabase(email, password, role);
            if (userId > 0)
            {
                Console.WriteLine($"Login successful! Welcome, {role}.");
                StoreCurrentUserId(userId, role);  // Store the current user ID based on the role

                // Display appropriate interface based on the role
                if (role == "Seller")
                    SellerInterface.Display();
                else if (role == "Buyer")
                    BuyerInterface.Display();
                //else if (role == "Logistic")
                //    LogisticInterface.Display();
                else if (role == "Owner")
                    OwnerInterface.Display();
            }
            else
            {
                Console.WriteLine("Invalid credentials. Please try again.");
            }

            Console.WriteLine("Press any key to return to the main menu...");
            Console.ReadKey();
            AuthManager.Display();
        }


        // Method to retrieve user ID from the database based on login credentials
        private static int GetUserIdFromDatabase(string email, string password, string role)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Id, PasswordHash FROM Users WHERE Email = @Email AND Role = @Role";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Role", role);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedHash = reader["PasswordHash"].ToString();
                            int userId = Convert.ToInt32(reader["Id"]);

                            if (VerifyPassword(password, storedHash))
                            {
                                return userId;
                            }
                        }
                    }
                }
            }
            return 0; // Return 0 if login fails
        }

        // Placeholder to get the current user's ID based on their role
        public static int GetCurrentUserId(string role)
        {
            switch (role)
            {
                case "Seller":
                    return currentSellerId;
                case "Buyer":
                    return currentBuyerId;
                case "Logistic":
                    return currentLogisticId;
                case "Owner":
                    // You can store the owner ID in a similar manner if needed
                    return 0;  // Implement owner logic if required
                default:
                    return 0;
            }
        }


        // Method to verify password hash
        public static bool VerifyPassword(string enteredPassword, string storedPasswordHash)
        {
            string enteredPasswordHash = HashPassword(enteredPassword);
            return enteredPasswordHash == storedPasswordHash;
        }
    }
}
