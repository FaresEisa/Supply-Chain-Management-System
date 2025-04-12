Instructions

throughout the step 5 make sure you build/rebuild to make sure the code compiles before every command

1)
Install sql 2022,
 install ssms 2022,
  connect to sql,
   open ssms select trust and windows authenticator and click connect

2)
Open b1.sln with VS

3)
open file appsettings.json and change the server name 
"Sever=ROBOLOCO;" 
with your SQL server name 
"Sever=  your server name here  ;"

4)
Build-Rebuild now and throughout next step

5)
Make sure in VS Powershell you are in the directory with the .csproj file.
Run in VS PowerShell:
dotnet restore
-AND-
dotnet tool install --global dotnet-ef
-AND-
dotnet ef migrations add InitialCreate
-AND-
dotnet ef database update

6)
Go ssms and run the 3 queries to insert data, in order 
category 
subcategory
items

7)
Run
