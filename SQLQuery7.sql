-- Drop the existing Items table if it exists
DROP TABLE IF EXISTS Items;

-- Create the Items table again
CREATE TABLE Items (
    Id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incremented ID
    ItemName VARCHAR(255) NOT NULL, -- Item Name
    SubcategoryId INT NOT NULL, -- Foreign key to Subcategories table
    Stock INT NOT NULL DEFAULT 0, -- Default stock set to 0
    Price DECIMAL(10, 2) NOT NULL, -- Price for the item
    FOREIGN KEY (SubcategoryId) REFERENCES Subcategories(Id), -- Link to Subcategories table
    INDEX idx_subcategory_id (SubcategoryId), -- Index on SubcategoryId for efficient querying
    INDEX idx_item_name (ItemName) -- Index on ItemName for fast search by name
);



-- Industrial Chemicals
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Hydrochloric Acid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Chemicals'), 0, 25.00),
('Sulfuric Acid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Chemicals'), 0, 18.50),
('Nitric Acid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Chemicals'), 0, 28.00),

-- Agricultural Chemicals
('Fungicide', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Agricultural Chemicals'), 0, 35.00),
('Insecticide', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Agricultural Chemicals'), 0, 22.00),
('Herbicide', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Agricultural Chemicals'), 0, 15.00),

-- Laboratory Chemicals
('Sodium Hydroxide', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laboratory Chemicals'), 0, 10.00),
('Acetone', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laboratory Chemicals'), 0, 8.00),
('Methanol', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laboratory Chemicals'), 0, 12.00),

-- Paints for Industry
('Epoxy Resin Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Paints for Industry'), 0, 40.00),
('Acrylic Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Paints for Industry'), 0, 30.00),
('Polyurethane Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Paints for Industry'), 0, 45.00),

-- Household Paints
('Interior Wall Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Household Paints'), 0, 15.00),
('Exterior Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Household Paints'), 0, 18.00),
('Wood Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Household Paints'), 0, 20.00),

-- Decorative Paints
('Metallic Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Decorative Paints'), 0, 25.00),
('Matte Finish Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Decorative Paints'), 0, 22.00),
('Glossy Finish Paint', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Decorative Paints'), 0, 28.00),

-- Face Creams
('Moisturizing Cream', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Face Creams'), 0, 15.00),
('Anti-aging Cream', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Face Creams'), 0, 25.00),
('Brightening Cream', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Face Creams'), 0, 20.00),

-- Shampoos
('Anti-dandruff Shampoo', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shampoos'), 0, 10.00),
('Volumizing Shampoo', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shampoos'), 0, 12.00),
('Moisturizing Shampoo', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shampoos'), 0, 14.00),

-- Soaps
('Antibacterial Soap', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soaps'), 0, 3.00),
('Moisturizing Soap', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soaps'), 0, 2.50),
('Herbal Soap', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soaps'), 0, 4.00),

-- Lubricants for Machines
('Engine Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lubricants for Machines'), 0, 35.00),
('Hydraulic Fluid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lubricants for Machines'), 0, 40.00),
('Grease', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lubricants for Machines'), 0, 30.00),

-- Automotive Oils
('Motor Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Automotive Oils'), 0, 18.00),
('Transmission Fluid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Automotive Oils'), 0, 20.00),
('Brake Fluid', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Automotive Oils'), 0, 15.00),

-- Greases
('Lithium Grease', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Greases'), 0, 10.00),
('Silicone Grease', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Greases'), 0, 12.00),
('Multi-purpose Grease', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Greases'), 0, 8.00),

-- Human Pharmaceuticals
('Pain Reliever', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Human Pharmaceuticals'), 0, 10.00),
('Antibiotic', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Human Pharmaceuticals'), 0, 15.00),
('Cough Syrup', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Human Pharmaceuticals'), 0, 8.00),

-- Veterinary Medicines
('Flea Treatment', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Veterinary Medicines'), 0, 20.00),
('Antibiotics for Pets', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Veterinary Medicines'), 0, 18.00),
('Pet Dewormer', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Veterinary Medicines'), 0, 15.00),

-- Over-the-counter Drugs
('Antihistamines', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Over-the-counter Drugs'), 0, 10.00),
('Aspirin', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Over-the-counter Drugs'), 0, 5.00),
('Ibuprofen', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Over-the-counter Drugs'), 0, 7.00),

-- Ferrous Metals
('Steel Rods', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ferrous Metals'), 0, 40.00),
('Iron Plates', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ferrous Metals'), 0, 30.00),
('Cast Iron Pipes', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ferrous Metals'), 0, 35.00),

-- Non-ferrous Metals
('Aluminum Sheets', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Non-ferrous Metals'), 0, 25.00),
('Copper Wire', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Non-ferrous Metals'), 0, 50.00),
('Zinc Plates', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Non-ferrous Metals'), 0, 40.00),

-- Alloy Steel
('Stainless Steel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Alloy Steel'), 0, 45.00),
('Tool Steel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Alloy Steel'), 0, 55.00),
('Carbon Steel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Alloy Steel'), 0, 50.00),

-- Industrial Machinery
('CNC Machine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Machinery'), 0, 1000.00),
('Lathe Machine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Machinery'), 0, 1500.00),
('Milling Machine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Industrial Machinery'), 0, 2000.00),

-- Hand-held Machinery
('Angle Grinder', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hand-held Machinery'), 0, 100.00),
('Drill Machine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hand-held Machinery'), 0, 80.00),
('Electric Saw', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hand-held Machinery'), 0, 120.00),

-- Precision Machines
('Laser Cutter', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Precision Machines'), 0, 2000.00),
('CNC Router', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Precision Machines'), 0, 1800.00),
('3D Printer', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Precision Machines'), 0, 1500.00),

-- Power Tools
('Cordless Drill', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Power Tools'), 0, 120.00),
('Impact Wrench', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Power Tools'), 0, 150.00),
('Circular Saw', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Power Tools'), 0, 100.00),

-- Garden Tools
('Lawn Mower', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Garden Tools'), 0, 250.00),
('Garden Shears', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Garden Tools'), 0, 30.00),
('Shovel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Garden Tools'), 0, 15.00),

-- Measuring Tools
('Tape Measure', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Measuring Tools'), 0, 10.00),
('Laser Measure', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Measuring Tools'), 0, 50.00),
('Caliper', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Measuring Tools'), 0, 40.00),

-- Optical Instruments
('Telescope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Optical Instruments'), 0, 150.00),
('Binoculars', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Optical Instruments'), 0, 80.00),
('Microscope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Optical Instruments'), 0, 200.00),

-- Surveying Instruments
('Theodolite', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surveying Instruments'), 0, 500.00),
('Total Station', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surveying Instruments'), 0, 1200.00),
('Level Instrument', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surveying Instruments'), 0, 300.00),

-- Photography Equipment
('DSLR Camera', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Photography Equipment'), 0, 1000.00),
('Tripod', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Photography Equipment'), 0, 50.00),
('Flashlight', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Photography Equipment'), 0, 80.00),

-- Diagnostic Devices
('ECG Machine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Diagnostic Devices'), 0, 1500.00),
('Blood Pressure Monitor', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Diagnostic Devices'), 0, 120.00),
('Stethoscope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Diagnostic Devices'), 0, 20.00),

-- Surgical Instruments
('Scalpel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surgical Instruments'), 0, 15.00),
('Surgical Scissors', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surgical Instruments'), 0, 25.00),
('Forceps', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Surgical Instruments'), 0, 18.00);

-- [Continue this pattern for the remaining categories]
-- Prosthetic Devices
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Artificial Limb', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Prosthetic Devices'), 0, 5000.00),
('Bionic Hand', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Prosthetic Devices'), 0, 8000.00),
('Orthopedic Brace', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Prosthetic Devices'), 0, 300.00);

-- Lighting Equipment
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('LED Floodlight', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lighting Equipment'), 0, 50.00),
('Solar Street Light', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lighting Equipment'), 0, 150.00),
('Smart Bulb', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Lighting Equipment'), 0, 20.00);

-- Heating Systems
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Gas Furnace', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heating Systems'), 0, 2000.00),
('Electric Heater', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heating Systems'), 0, 100.00),
('Radiator', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heating Systems'), 0, 250.00);

-- Air Conditioning Units
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Split AC', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Conditioning Units'), 0, 500.00),
('Window AC', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Conditioning Units'), 0, 400.00),
('Portable AC', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Conditioning Units'), 0, 300.00);

-- Motor Vehicles
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Sedan Car', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Motor Vehicles'), 0, 20000.00),
('SUV', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Motor Vehicles'), 0, 30000.00),
('Pickup Truck', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Motor Vehicles'), 0, 25000.00);

-- Aircraft
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Private Jet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Aircraft'), 0, 5000000.00),
('Helicopter', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Aircraft'), 0, 2000000.00),
('Passenger Plane', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Aircraft'), 0, 10000000.00);

-- Watercraft
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Speed Boat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Watercraft'), 0, 80000.00),
('Yacht', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Watercraft'), 0, 500000.00),
('Fishing Boat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Watercraft'), 0, 60000.00);

-- Firearms
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Handgun', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Firearms'), 0, 500.00),
('Rifle', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Firearms'), 0, 1200.00),
('Shotgun', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Firearms'), 0, 800.00);

-- Ammunition
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('9mm Bullets', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ammunition'), 0, 20.00),
('Shotgun Shells', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ammunition'), 0, 30.00),
('Rifle Rounds', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ammunition'), 0, 40.00);

-- Explosives
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Dynamite', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Explosives'), 0, 500.00),
('C4 Explosive', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Explosives'), 0, 1000.00),
('TNT Blocks', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Explosives'), 0, 750.00);

-- Gold
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Gold Bar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Gold'), 0, 60000.00),
('Gold Coins', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Gold'), 0, 2000.00),
('Gold Jewelry', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Gold'), 0, 5000.00);

-- Silver
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Silver Bar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Silver'), 0, 1000.00),
('Silver Coins', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Silver'), 0, 200.00),
('Silver Jewelry', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Silver'), 0, 500.00);

-- Platinum
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Platinum Bar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Platinum'), 0, 70000.00),
('Platinum Ring', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Platinum'), 0, 3000.00),
('Platinum Necklace', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Platinum'), 0, 8000.00);

-- String Instruments
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Acoustic Guitar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'String Instruments'), 0, 300.00),
('Violin', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'String Instruments'), 0, 500.00),
('Cello', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'String Instruments'), 0, 1200.00);

-- Wind Instruments
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Flute', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wind Instruments'), 0, 150.00),
('Clarinet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wind Instruments'), 0, 400.00),
('Saxophone', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wind Instruments'), 0, 800.00);

-- Percussion Instruments
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Drum Set', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Percussion Instruments'), 0, 1000.00),
('Bongo Drums', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Percussion Instruments'), 0, 250.00),
('Tambourine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Percussion Instruments'), 0, 50.00);

-- Cardboard
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Corrugated Cardboard', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cardboard'), 0, 20.00),
('Folding Carton', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cardboard'), 0, 15.00),
('Paperboard Sheets', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cardboard'), 0, 30.00);

-- Printing Paper
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('A4 Paper Ream', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printing Paper'), 0, 10.00),
('Photo Paper', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printing Paper'), 0, 15.00),
('Card Stock', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printing Paper'), 0, 20.00);

-- Printed Publications
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Magazine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printed Publications'), 0, 5.00),
('Newspaper', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printed Publications'), 0, 2.00),
('Hardcover Book', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Printed Publications'), 0, 25.00);

-- Rubber Sheets
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Industrial Rubber Sheet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Rubber Sheets'), 0, 50.00),
('Silicone Rubber Sheet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Rubber Sheets'), 0, 80.00),
('Neoprene Rubber Sheet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Rubber Sheets'), 0, 60.00);

-- Plastic Packaging
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Plastic Wrapping Film', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Packaging'), 0, 5.00),
('Bubble Wrap', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Packaging'), 0, 10.00),
('Plastic Containers', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Packaging'), 0, 15.00);

-- Plastic Pipes
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('PVC Pipe', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Pipes'), 0, 20.00),
('HDPE Pipe', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Pipes'), 0, 30.00),
('Polyethylene Tubing', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Pipes'), 0, 25.00);

-- Leather Bags
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Leather Handbag', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Bags'), 0, 120.00),
('Leather Messenger Bag', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Bags'), 0, 150.00),
('Leather Backpack', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Bags'), 0, 180.00);

-- Leather Belts
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Formal Leather Belt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Belts'), 0, 50.00),
('Casual Leather Belt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Belts'), 0, 40.00),
('Braided Leather Belt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Belts'), 0, 60.00);

-- Leather Shoes
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Oxford Shoes', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Shoes'), 0, 120.00),
('Loafers', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Shoes'), 0, 100.00),
('Brogues', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Leather Shoes'), 0, 130.00);

-- Cement
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Portland Cement', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cement'), 0, 10.00),
('White Cement', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cement'), 0, 12.00),
('Masonry Cement', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cement'), 0, 9.00);

-- Bricks
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Red Clay Brick', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bricks'), 0, 1.00),
('Concrete Brick', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bricks'), 0, 2.00),
('Fly Ash Brick', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bricks'), 0, 1.50);

-- Glass
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Tempered Glass', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Glass'), 0, 50.00),
('Frosted Glass', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Glass'), 0, 40.00),
('Stained Glass', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Glass'), 0, 60.00);

-- Sofas
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Leather Sofa', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sofas'), 0, 800.00),
('Fabric Sofa', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sofas'), 0, 600.00),
('Recliner Sofa', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sofas'), 0, 1000.00);

-- Chairs
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Office Chair', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Chairs'), 0, 200.00),
('Dining Chair', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Chairs'), 0, 150.00),
('Rocking Chair', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Chairs'), 0, 250.00);

-- Tables
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Dining Table', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tables'), 0, 500.00),
('Coffee Table', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tables'), 0, 300.00),
('Study Table', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tables'), 0, 350.00);

-- Cookware
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Non-stick Pan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cookware'), 0, 40.00),
('Stainless Steel Pot', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cookware'), 0, 60.00),
('Cast Iron Skillet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cookware'), 0, 80.00);

-- Cutlery
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Stainless Steel Knife Set', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cutlery'), 0, 50.00),
('Silverware Set', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cutlery'), 0, 80.00),
('Ceramic Knife', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cutlery'), 0, 30.00);

-- Cleaning Tools
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Broom', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cleaning Tools'), 0, 15.00),
('Mop', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cleaning Tools'), 0, 20.00),
('Vacuum Cleaner', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cleaning Tools'), 0, 150.00);

-- Ropes
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Nylon Rope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ropes'), 0, 25.00),
('Cotton Rope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ropes'), 0, 20.00),
('Polypropylene Rope', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ropes'), 0, 30.00);

-- Fishing Nets
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Gill Net', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fishing Nets'), 0, 100.00),
('Cast Net', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fishing Nets'), 0, 80.00),
('Seine Net', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fishing Nets'), 0, 120.00);

-- Tents
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Camping Tent', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tents'), 0, 150.00),
('Backpacking Tent', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tents'), 0, 200.00),
('Family Tent', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tents'), 0, 300.00);

-- Cotton Yarn
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Knitting Cotton Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Yarn'), 0, 10.00),
('Weaving Cotton Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Yarn'), 0, 15.00),
('Organic Cotton Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Yarn'), 0, 20.00);

-- Wool Yarn
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Merino Wool Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Yarn'), 0, 30.00),
('Alpaca Wool Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Yarn'), 0, 40.00),
('Cashmere Wool Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Yarn'), 0, 50.00);

-- Synthetic Yarn
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Acrylic Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Synthetic Yarn'), 0, 15.00),
('Polyester Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Synthetic Yarn'), 0, 20.00),
('Nylon Yarn', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Synthetic Yarn'), 0, 25.00);

-- Bed Linen
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Cotton Bed Sheet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bed Linen'), 0, 50.00),
('Silk Bed Linen', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bed Linen'), 0, 120.00),
('Microfiber Bed Linen', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Bed Linen'), 0, 70.00);

-- Curtains
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Blackout Curtains', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Curtains'), 0, 80.00),
('Sheer Curtains', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Curtains'), 0, 60.00),
('Thermal Curtains', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Curtains'), 0, 90.00);

-- Towels
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Cotton Bath Towel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Towels'), 0, 30.00),
('Microfiber Towel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Towels'), 0, 20.00),
('Linen Hand Towel', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Towels'), 0, 25.00);

-- Jeans
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Slim Fit Jeans', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Jeans'), 0, 60.00),
('Regular Fit Jeans', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Jeans'), 0, 50.00),
('Ripped Jeans', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Jeans'), 0, 70.00);

-- Shirts
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Cotton Shirt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shirts'), 0, 40.00),
('Linen Shirt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shirts'), 0, 60.00),
('Denim Shirt', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Shirts'), 0, 55.00);

-- Sneakers
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Running Sneakers', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sneakers'), 0, 80.00),
('Casual Sneakers', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sneakers'), 0, 70.00),
('High-top Sneakers', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sneakers'), 0, 90.00);

-- Laces
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Round Shoelaces', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laces'), 0, 5.00),
('Flat Shoelaces', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laces'), 0, 6.00),
('Elastic Shoelaces', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Laces'), 0, 7.00);

-- Embroidery
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Floral Embroidery Thread', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Embroidery'), 0, 15.00),
('Silk Embroidery Kit', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Embroidery'), 0, 25.00),
('Cotton Embroidery Fabric', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Embroidery'), 0, 18.00);

-- Ribbons
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Satin Ribbon', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ribbons'), 0, 10.00),
('Grosgrain Ribbon', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ribbons'), 0, 12.00),
('Velvet Ribbon', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Ribbons'), 0, 15.00);

-- Wool Carpets
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Persian Wool Carpet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Carpets'), 0, 500.00),
('Handwoven Wool Carpet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Carpets'), 0, 600.00),
('Modern Wool Carpet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wool Carpets'), 0, 450.00);

-- Cotton Mats
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Bathroom Cotton Mat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Mats'), 0, 30.00),
('Yoga Cotton Mat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Mats'), 0, 50.00),
('Woven Cotton Mat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cotton Mats'), 0, 40.00);

-- Artificial Rugs
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Synthetic Persian Rug', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Artificial Rugs'), 0, 200.00),
('Machine-made Area Rug', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Artificial Rugs'), 0, 250.00),
('Polyester Shag Rug', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Artificial Rugs'), 0, 180.00);

-- Football
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Official Match Football', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Football'), 0, 100.00),
('Training Football', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Football'), 0, 50.00),
('Futsal Ball', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Football'), 0, 70.00);

-- Tennis Racquets
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Professional Tennis Racquet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tennis Racquets'), 0, 150.00),
('Beginner Tennis Racquet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tennis Racquets'), 0, 100.00),
('Junior Tennis Racquet', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tennis Racquets'), 0, 80.00);

-- Baseball Bats
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Wooden Baseball Bat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Baseball Bats'), 0, 90.00),
('Aluminum Baseball Bat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Baseball Bats'), 0, 120.00),
('Composite Baseball Bat', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Baseball Bats'), 0, 140.00);

-- Fresh Meat
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Beef Ribeye Steak', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fresh Meat'), 0, 25.00),
('Pork Tenderloin', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fresh Meat'), 0, 20.00),
('Lamb Chops', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fresh Meat'), 0, 30.00);

-- Canned Fish
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Tuna in Olive Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Canned Fish'), 0, 5.00),
('Sardines in Tomato Sauce', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Canned Fish'), 0, 4.00),
('Mackerel Fillets', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Canned Fish'), 0, 6.00);

-- Vegetable Oils
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Extra Virgin Olive Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetable Oils'), 0, 15.00),
('Sunflower Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetable Oils'), 0, 8.00),
('Coconut Oil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetable Oils'), 0, 12.00);

-- Instant Coffee
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Premium Arabica Instant Coffee', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Instant Coffee'), 0, 10.00),
('Classic Espresso Instant Coffee', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Instant Coffee'), 0, 8.00),
('Decaf Instant Coffee', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Instant Coffee'), 0, 9.00);

-- Tea Bags
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Green Tea Bags', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tea Bags'), 0, 6.00),
('Black Tea Bags', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tea Bags'), 0, 5.00),
('Chamomile Herbal Tea Bags', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tea Bags'), 0, 7.00);

-- Sugar
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('White Granulated Sugar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sugar'), 0, 3.00),
('Brown Sugar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sugar'), 0, 4.00),
('Powdered Sugar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Sugar'), 0, 5.00);

-- Fruits
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Fresh Apples', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fruits'), 0, 2.00),
('Bananas', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fruits'), 0, 1.50),
('Oranges', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Fruits'), 0, 3.00);

-- Vegetables
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Fresh Carrots', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetables'), 0, 2.00),
('Broccoli', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetables'), 0, 3.00),
('Spinach', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vegetables'), 0, 2.50);

-- Herbs
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Fresh Basil', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Herbs'), 0, 4.00),
('Dried Oregano', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Herbs'), 0, 3.00),
('Rosemary Sprigs', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Herbs'), 0, 5.00);

-- Soft Drinks
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Cola Soft Drink', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soft Drinks'), 0, 2.00),
('Lemon Lime Soda', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soft Drinks'), 0, 1.80),
('Ginger Ale', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Soft Drinks'), 0, 2.50);

-- Mineral Water
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Spring Mineral Water', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mineral Water'), 0, 1.50),
('Sparkling Mineral Water', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mineral Water'), 0, 2.00),
('Alkaline Water', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mineral Water'), 0, 2.50);

-- Energy Drinks
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Taurine Energy Drink', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Energy Drinks'), 0, 3.00),
('Natural Caffeine Energy Drink', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Energy Drinks'), 0, 4.00),
('Electrolyte Boost Energy Drink', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Energy Drinks'), 0, 3.50);

-- Whisky
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Single Malt Whisky', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Whisky'), 0, 50.00),
('Blended Whisky', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Whisky'), 0, 40.00),
('Bourbon Whisky', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Whisky'), 0, 45.00);

-- Wine
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Red Wine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wine'), 0, 30.00),
('White Wine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wine'), 0, 28.00),
('Rosé Wine', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Wine'), 0, 32.00);

-- Vodka
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Premium Vodka', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vodka'), 0, 35.00),
('Flavored Vodka', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vodka'), 0, 38.00),
('Classic Russian Vodka', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Vodka'), 0, 40.00);

-- Cigarettes
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Menthol Cigarettes', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigarettes'), 0, 10.00),
('Classic Tobacco Cigarettes', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigarettes'), 0, 9.00),
('Light Cigarettes', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigarettes'), 0, 11.00);

-- Smoking Pipes
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Wooden Smoking Pipe', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Smoking Pipes'), 0, 25.00),
('Meerschaum Smoking Pipe', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Smoking Pipes'), 0, 30.00),
('Metal Smoking Pipe', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Smoking Pipes'), 0, 20.00);

-- Cigars
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Cuban Cigar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigars'), 0, 50.00),
('Dominican Cigar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigars'), 0, 40.00),
('Nicaraguan Cigar', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Cigars'), 0, 45.00);

-- Advertising Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Digital Ad Campaign', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Advertising Services'), 0, 500.00),
('Print Media Advertisement', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Advertising Services'), 0, 300.00),
('Billboard Advertising', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Advertising Services'), 0, 1000.00);

-- Marketing Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('SEO Optimization', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Marketing Services'), 0, 400.00),
('Social Media Marketing', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Marketing Services'), 0, 600.00),
('Email Marketing Campaign', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Marketing Services'), 0, 350.00);

-- Business Consulting
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Financial Strategy Consultation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Business Consulting'), 0, 800.00),
('Market Analysis Report', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Business Consulting'), 0, 700.00),
('Corporate Restructuring Advice', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Business Consulting'), 0, 1200.00);

-- Life Insurance
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Term Life Insurance', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Life Insurance'), 0, 200.00),
('Whole Life Insurance', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Life Insurance'), 0, 500.00),
('Universal Life Insurance', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Life Insurance'), 0, 750.00);

-- Banking
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Personal Savings Account', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Banking'), 0, 50.00),
('Business Loan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Banking'), 0, 1000.00),
('Mortgage Loan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Banking'), 0, 1500.00);

-- Real Estate Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Property Valuation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Real Estate Services'), 0, 600.00),
('Real Estate Brokerage', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Real Estate Services'), 0, 2000.00),
('Property Management Services', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Real Estate Services'), 0, 1000.00);

-- Home Construction
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Single Family Home Construction', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Home Construction'), 0, 150000.00),
('Apartment Complex Construction', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Home Construction'), 0, 500000.00),
('Custom Home Design', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Home Construction'), 0, 20000.00);

-- Building Renovation
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Kitchen Remodeling', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Building Renovation'), 0, 15000.00),
('Bathroom Renovation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Building Renovation'), 0, 10000.00),
('Complete Home Makeover', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Building Renovation'), 0, 50000.00);

-- Plumbing
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Leak Repair Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plumbing'), 0, 200.00),
('Drain Cleaning Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plumbing'), 0, 150.00),
('Water Heater Installation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plumbing'), 0, 1000.00);

-- Internet Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Fiber Optic Internet Plan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Internet Services'), 0, 60.00),
('Broadband Internet Plan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Internet Services'), 0, 50.00),
('Satellite Internet Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Internet Services'), 0, 80.00);

-- Mobile Phone Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Prepaid Mobile Plan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mobile Phone Services'), 0, 30.00),
('Postpaid Mobile Plan', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mobile Phone Services'), 0, 60.00),
('International Roaming Package', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Mobile Phone Services'), 0, 100.00);

-- Satellite Communications
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Satellite Internet Package', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Satellite Communications'), 0, 120.00),
('Satellite Phone Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Satellite Communications'), 0, 200.00),
('Global Positioning Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Satellite Communications'), 0, 150.00);

-- Road Transport
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Local Freight Transport', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Road Transport'), 0, 500.00),
('Interstate Cargo Transport', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Road Transport'), 0, 1500.00),
('Express Parcel Delivery', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Road Transport'), 0, 100.00);

-- Air Freight
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('International Air Cargo', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Freight'), 0, 3000.00),
('Domestic Air Freight', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Freight'), 0, 2000.00),
('Express Air Delivery', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Air Freight'), 0, 5000.00);

-- Storage Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Climate-Controlled Storage', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Storage Services'), 0, 100.00),
('Warehouse Storage Space', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Storage Services'), 0, 300.00),
('Self-Storage Unit', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Storage Services'), 0, 150.00);

-- Metal Treatment
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Galvanization Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Metal Treatment'), 0, 500.00),
('Heat Hardening Treatment', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Metal Treatment'), 0, 700.00),
('Rust Prevention Coating', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Metal Treatment'), 0, 300.00);

-- Plastic Treatment
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Plastic Molding Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Treatment'), 0, 600.00),
('Surface Polishing', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Treatment'), 0, 250.00),
('Reinforced Plastic Coating', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Plastic Treatment'), 0, 400.00);

-- Heat Treatment
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Annealing Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heat Treatment'), 0, 800.00),
('Tempering Process', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heat Treatment'), 0, 900.00),
('Case Hardening Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Heat Treatment'), 0, 1000.00);

-- Online Education
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Online Course Subscription', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Online Education'), 0, 50.00),
('Webinar Access', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Online Education'), 0, 30.00),
('E-Learning Certification', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Online Education'), 0, 100.00);

-- Training Courses
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Project Management Training', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Training Courses'), 0, 500.00),
('Software Development Bootcamp', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Training Courses'), 0, 1000.00),
('Public Speaking Workshop', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Training Courses'), 0, 250.00);

-- Entertainment Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Concert Ticket', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Entertainment Services'), 0, 150.00),
('Streaming Service Subscription', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Entertainment Services'), 0, 20.00),
('Theater Play Admission', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Entertainment Services'), 0, 100.00);

-- Tech Consulting
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('IT Infrastructure Assessment', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tech Consulting'), 0, 1200.00),
('Cybersecurity Audit', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tech Consulting'), 0, 2000.00),
('Cloud Migration Strategy', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Tech Consulting'), 0, 1500.00);

-- Software Development
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Custom Web Application', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Software Development'), 0, 5000.00),
('Mobile App Development', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Software Development'), 0, 7000.00),
('Enterprise Software Solution', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Software Development'), 0, 10000.00);

-- Engineering Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Structural Engineering Consultation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Engineering Services'), 0, 3000.00),
('Mechanical Design Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Engineering Services'), 0, 5000.00),
('Civil Engineering Planning', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Engineering Services'), 0, 4000.00);

-- Catering Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Corporate Event Catering', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Catering Services'), 0, 1500.00),
('Wedding Catering', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Catering Services'), 0, 3000.00),
('Private Party Catering', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Catering Services'), 0, 2000.00);

-- Hotel Accommodation
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Luxury Suite Booking', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hotel Accommodation'), 0, 400.00),
('Standard Room Booking', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hotel Accommodation'), 0, 200.00),
('Budget Room Stay', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Hotel Accommodation'), 0, 100.00);

-- Restaurant Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Fine Dining Experience', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Restaurant Services'), 0, 150.00),
('Buffet Dinner', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Restaurant Services'), 0, 80.00),
('Fast Food Combo Meal', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Restaurant Services'), 0, 20.00);

-- Medical Care
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('General Health Check-up', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Medical Care'), 0, 100.00),
('Specialist Consultation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Medical Care'), 0, 250.00),
('Diagnostic Imaging Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Medical Care'), 0, 500.00);

-- Beauty Salons
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Hair Styling Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Beauty Salons'), 0, 50.00),
('Facial Treatment', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Beauty Salons'), 0, 70.00),
('Manicure and Pedicure', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Beauty Salons'), 0, 40.00);

-- Spa Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Full Body Massage', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Spa Services'), 0, 100.00),
('Aromatherapy Session', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Spa Services'), 0, 80.00),
('Sauna Therapy', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Spa Services'), 0, 90.00);

-- Legal Advisory
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Contract Review', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Advisory'), 0, 500.00),
('Business Legal Consultation', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Advisory'), 0, 1000.00),
('Intellectual Property Advice', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Advisory'), 0, 1500.00);

-- Security Services
INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Private Security Guard', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Security Services'), 0, 300.00),
('CCTV Monitoring Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Security Services'), 0, 500.00),
('Event Security Service', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Security Services'), 0, 800.00);

INSERT INTO Items (ItemName, SubcategoryId, Stock, Price)
VALUES
('Court Representation Services', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Representation'), 0, 2000.00),
('Contract Dispute Resolution', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Representation'), 0, 1500.00),
('Legal Documentation Services', (SELECT Id FROM Subcategories WHERE SubcategoryName = 'Legal Representation'), 0, 500.00);
