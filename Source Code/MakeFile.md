Instructions

1)
Install sql 2022,
 install ssms 2022,
  connect to sql,
   open ssms select windows authenticator, tick trust, and click connect

2)
Open SCMS.sln with VS

3)
open file appsettings.json and change the server name 
"Sever=ROBOLOCO;" 
with your SQL server name 
"Sever= your server name here ;"

4)
Build solution

5)
Make sure in VS Powershell you are in the directory with the .csproj file.
Run in VS PowerShell:
dotnet restore 
-(rebuild solution and)-
dotnet tool install --global dotnet-ef
-(rebuild solution and)-
dotnet ef database update
(rebuild solution)

6)
Dotnet restore should install all the packages necessary for the project, if not, please install the necessary packages manually.

7)
Open ssms(sql app) and run the query to insert data and populate the tables.

8)
Run the program and it should automatically open your browser.
Register yourself as a owner to access admin priviledges and display all customers data. Log in and navigate the owner dashboard. when you finish click Logout.

10)
Register as a client with another email and log in to simulate the client experience. The client dashboard allows the user to click on any item and sell, or buy items (your own stock is not displayed to avoid buying your own stock). It also displays all your orders history and your listings. Logout when satisfied.

11)
Register as a logistic with another email to simulate the logistic experience. The logostic allow the user to accept delivery jobs and update the delivery status across all users involved.
