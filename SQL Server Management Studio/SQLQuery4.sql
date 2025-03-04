-- Create the Subcategories table
CREATE TABLE Subcategories (
    Id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incremented ID
    SubcategoryName VARCHAR(255) NOT NULL,  -- Subcategory Name
    CategoryId INT NOT NULL,  -- Foreign key to the Categories table
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id),  -- Link to Categories table
    INDEX idx_category_id (CategoryId),  -- Index on CategoryId for efficient querying
    INDEX idx_subcategory_name (SubcategoryName)  -- Index on SubcategoryName for fast search by name
);


-- Insert subcategories for the Goods categories
INSERT INTO Subcategories (SubcategoryName, CategoryId)
VALUES
('Industrial Chemicals', (SELECT Id FROM Categories WHERE ClassName = 'Chemicals for industry, science, and agriculture')),
('Agricultural Chemicals', (SELECT Id FROM Categories WHERE ClassName = 'Chemicals for industry, science, and agriculture')),
('Laboratory Chemicals', (SELECT Id FROM Categories WHERE ClassName = 'Chemicals for industry, science, and agriculture')),

('Paints for Industry', (SELECT Id FROM Categories WHERE ClassName = 'Paints, varnishes, lacquers')),
('Household Paints', (SELECT Id FROM Categories WHERE ClassName = 'Paints, varnishes, lacquers')),
('Decorative Paints', (SELECT Id FROM Categories WHERE ClassName = 'Paints, varnishes, lacquers')),

('Face Creams', (SELECT Id FROM Categories WHERE ClassName = 'Cosmetics and cleaning preparations')),
('Shampoos', (SELECT Id FROM Categories WHERE ClassName = 'Cosmetics and cleaning preparations')),
('Soaps', (SELECT Id FROM Categories WHERE ClassName = 'Cosmetics and cleaning preparations')),

('Lubricants for Machines', (SELECT Id FROM Categories WHERE ClassName = 'Industrial oils and lubricants')),
('Automotive Oils', (SELECT Id FROM Categories WHERE ClassName = 'Industrial oils and lubricants')),
('Greases', (SELECT Id FROM Categories WHERE ClassName = 'Industrial oils and lubricants')),

('Human Pharmaceuticals', (SELECT Id FROM Categories WHERE ClassName = 'Pharmaceuticals and veterinary preparations')),
('Veterinary Medicines', (SELECT Id FROM Categories WHERE ClassName = 'Pharmaceuticals and veterinary preparations')),
('Over-the-counter Drugs', (SELECT Id FROM Categories WHERE ClassName = 'Pharmaceuticals and veterinary preparations')),

('Ferrous Metals', (SELECT Id FROM Categories WHERE ClassName = 'Metals and alloys')),
('Non-ferrous Metals', (SELECT Id FROM Categories WHERE ClassName = 'Metals and alloys')),
('Alloy Steel', (SELECT Id FROM Categories WHERE ClassName = 'Metals and alloys')),

('Industrial Machinery', (SELECT Id FROM Categories WHERE ClassName = 'Machines and tools')),
('Hand-held Machinery', (SELECT Id FROM Categories WHERE ClassName = 'Machines and tools')),
('Precision Machines', (SELECT Id FROM Categories WHERE ClassName = 'Machines and tools')),

('Power Tools', (SELECT Id FROM Categories WHERE ClassName = 'Hand tools')),
('Garden Tools', (SELECT Id FROM Categories WHERE ClassName = 'Hand tools')),
('Measuring Tools', (SELECT Id FROM Categories WHERE ClassName = 'Hand tools')),

('Optical Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and photographic equipment')),
('Surveying Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and photographic equipment')),
('Photography Equipment', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and photographic equipment')),

('Diagnostic Devices', (SELECT Id FROM Categories WHERE ClassName = 'Medical devices')),
('Surgical Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Medical devices')),
('Prosthetic Devices', (SELECT Id FROM Categories WHERE ClassName = 'Medical devices')),

('Lighting Equipment', (SELECT Id FROM Categories WHERE ClassName = 'Environmental control apparatus')),
('Heating Systems', (SELECT Id FROM Categories WHERE ClassName = 'Environmental control apparatus')),
('Air Conditioning Units', (SELECT Id FROM Categories WHERE ClassName = 'Environmental control apparatus')),

('Motor Vehicles', (SELECT Id FROM Categories WHERE ClassName = 'Vehicles and conveyances')),
('Aircraft', (SELECT Id FROM Categories WHERE ClassName = 'Vehicles and conveyances')),
('Watercraft', (SELECT Id FROM Categories WHERE ClassName = 'Vehicles and conveyances')),

('Firearms', (SELECT Id FROM Categories WHERE ClassName = 'Firearms and ammunition')),
('Ammunition', (SELECT Id FROM Categories WHERE ClassName = 'Firearms and ammunition')),
('Explosives', (SELECT Id FROM Categories WHERE ClassName = 'Firearms and ammunition')),

('Gold', (SELECT Id FROM Categories WHERE ClassName = 'Precious metals and alloys')),
('Silver', (SELECT Id FROM Categories WHERE ClassName = 'Precious metals and alloys')),
('Platinum', (SELECT Id FROM Categories WHERE ClassName = 'Precious metals and alloys')),

('String Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Musical instruments')),
('Wind Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Musical instruments')),
('Percussion Instruments', (SELECT Id FROM Categories WHERE ClassName = 'Musical instruments')),

('Cardboard', (SELECT Id FROM Categories WHERE ClassName = 'Paper, cardboard, and printed materials')),
('Printing Paper', (SELECT Id FROM Categories WHERE ClassName = 'Paper, cardboard, and printed materials')),
('Printed Publications', (SELECT Id FROM Categories WHERE ClassName = 'Paper, cardboard, and printed materials')),

('Rubber Sheets', (SELECT Id FROM Categories WHERE ClassName = 'Rubber and plastics')),
('Plastic Packaging', (SELECT Id FROM Categories WHERE ClassName = 'Rubber and plastics')),
('Plastic Pipes', (SELECT Id FROM Categories WHERE ClassName = 'Rubber and plastics')),

('Leather Bags', (SELECT Id FROM Categories WHERE ClassName = 'Leather goods')),
('Leather Belts', (SELECT Id FROM Categories WHERE ClassName = 'Leather goods')),
('Leather Shoes', (SELECT Id FROM Categories WHERE ClassName = 'Leather goods')),

('Cement', (SELECT Id FROM Categories WHERE ClassName = 'Building materials')),
('Bricks', (SELECT Id FROM Categories WHERE ClassName = 'Building materials')),
('Glass', (SELECT Id FROM Categories WHERE ClassName = 'Building materials')),

('Sofas', (SELECT Id FROM Categories WHERE ClassName = 'Furniture and mirrors')),
('Chairs', (SELECT Id FROM Categories WHERE ClassName = 'Furniture and mirrors')),
('Tables', (SELECT Id FROM Categories WHERE ClassName = 'Furniture and mirrors')),

('Cookware', (SELECT Id FROM Categories WHERE ClassName = 'Household utensils')),
('Cutlery', (SELECT Id FROM Categories WHERE ClassName = 'Household utensils')),
('Cleaning Tools', (SELECT Id FROM Categories WHERE ClassName = 'Household utensils')),

('Ropes', (SELECT Id FROM Categories WHERE ClassName = 'Ropes and nets')),
('Fishing Nets', (SELECT Id FROM Categories WHERE ClassName = 'Ropes and nets')),
('Tents', (SELECT Id FROM Categories WHERE ClassName = 'Ropes and nets')),

('Cotton Yarn', (SELECT Id FROM Categories WHERE ClassName = 'Yarns and threads')),
('Wool Yarn', (SELECT Id FROM Categories WHERE ClassName = 'Yarns and threads')),
('Synthetic Yarn', (SELECT Id FROM Categories WHERE ClassName = 'Yarns and threads')),

('Bed Linen', (SELECT Id FROM Categories WHERE ClassName = 'Textiles and textile goods')),
('Curtains', (SELECT Id FROM Categories WHERE ClassName = 'Textiles and textile goods')),
('Towels', (SELECT Id FROM Categories WHERE ClassName = 'Textiles and textile goods')),

('Jeans', (SELECT Id FROM Categories WHERE ClassName = 'Clothing and footwear')),
('Shirts', (SELECT Id FROM Categories WHERE ClassName = 'Clothing and footwear')),
('Sneakers', (SELECT Id FROM Categories WHERE ClassName = 'Clothing and footwear')),

('Laces', (SELECT Id FROM Categories WHERE ClassName = 'Lace, embroidery, ribbons')),
('Embroidery', (SELECT Id FROM Categories WHERE ClassName = 'Lace, embroidery, ribbons')),
('Ribbons', (SELECT Id FROM Categories WHERE ClassName = 'Lace, embroidery, ribbons')),

('Wool Carpets', (SELECT Id FROM Categories WHERE ClassName = 'Carpets, rugs, and mats')),
('Cotton Mats', (SELECT Id FROM Categories WHERE ClassName = 'Carpets, rugs, and mats')),
('Artificial Rugs', (SELECT Id FROM Categories WHERE ClassName = 'Carpets, rugs, and mats')),

('Football', (SELECT Id FROM Categories WHERE ClassName = 'Games and sports equipment')),
('Tennis Racquets', (SELECT Id FROM Categories WHERE ClassName = 'Games and sports equipment')),
('Baseball Bats', (SELECT Id FROM Categories WHERE ClassName = 'Games and sports equipment')),

('Fresh Meat', (SELECT Id FROM Categories WHERE ClassName = 'Meat, fish, and oils')),
('Canned Fish', (SELECT Id FROM Categories WHERE ClassName = 'Meat, fish, and oils')),
('Vegetable Oils', (SELECT Id FROM Categories WHERE ClassName = 'Meat, fish, and oils')),

('Instant Coffee', (SELECT Id FROM Categories WHERE ClassName = 'Coffee, tea, and foodstuffs')),
('Tea Bags', (SELECT Id FROM Categories WHERE ClassName = 'Coffee, tea, and foodstuffs')),
('Sugar', (SELECT Id FROM Categories WHERE ClassName = 'Coffee, tea, and foodstuffs')),

('Fruits', (SELECT Id FROM Categories WHERE ClassName = 'Agricultural and forestry products')),
('Vegetables', (SELECT Id FROM Categories WHERE ClassName = 'Agricultural and forestry products')),
('Herbs', (SELECT Id FROM Categories WHERE ClassName = 'Agricultural and forestry products')),

('Soft Drinks', (SELECT Id FROM Categories WHERE ClassName = 'Beverages (non-alcoholic)')),
('Mineral Water', (SELECT Id FROM Categories WHERE ClassName = 'Beverages (non-alcoholic)')),
('Energy Drinks', (SELECT Id FROM Categories WHERE ClassName = 'Beverages (non-alcoholic)')),

('Whisky', (SELECT Id FROM Categories WHERE ClassName = 'Alcoholic beverages')),
('Wine', (SELECT Id FROM Categories WHERE ClassName = 'Alcoholic beverages')),
('Vodka', (SELECT Id FROM Categories WHERE ClassName = 'Alcoholic beverages')),

('Cigarettes', (SELECT Id FROM Categories WHERE ClassName = 'Tobacco and smokers'' articles')),
('Smoking Pipes', (SELECT Id FROM Categories WHERE ClassName = 'Tobacco and smokers'' articles')),
('Cigars', (SELECT Id FROM Categories WHERE ClassName = 'Tobacco and smokers'' articles')),

-- Insert subcategories for the Services categories
('Advertising Services', (SELECT Id FROM Categories WHERE ClassName = 'Advertising and business services')),
('Marketing Services', (SELECT Id FROM Categories WHERE ClassName = 'Advertising and business services')),
('Business Consulting', (SELECT Id FROM Categories WHERE ClassName = 'Advertising and business services')),

('Life Insurance', (SELECT Id FROM Categories WHERE ClassName = 'Insurance and financial services')),
('Banking', (SELECT Id FROM Categories WHERE ClassName = 'Insurance and financial services')),
('Real Estate Services', (SELECT Id FROM Categories WHERE ClassName = 'Insurance and financial services')),

('Home Construction', (SELECT Id FROM Categories WHERE ClassName = 'Construction and repair services')),
('Building Renovation', (SELECT Id FROM Categories WHERE ClassName = 'Construction and repair services')),
('Plumbing', (SELECT Id FROM Categories WHERE ClassName = 'Construction and repair services')),

('Internet Services', (SELECT Id FROM Categories WHERE ClassName = 'Telecommunications')),
('Mobile Phone Services', (SELECT Id FROM Categories WHERE ClassName = 'Telecommunications')),
('Satellite Communications', (SELECT Id FROM Categories WHERE ClassName = 'Telecommunications')),

('Road Transport', (SELECT Id FROM Categories WHERE ClassName = 'Transport and packaging services')),
('Air Freight', (SELECT Id FROM Categories WHERE ClassName = 'Transport and packaging services')),
('Storage Services', (SELECT Id FROM Categories WHERE ClassName = 'Transport and packaging services')),

('Metal Treatment', (SELECT Id FROM Categories WHERE ClassName = 'Treatment of materials')),
('Plastic Treatment', (SELECT Id FROM Categories WHERE ClassName = 'Treatment of materials')),
('Heat Treatment', (SELECT Id FROM Categories WHERE ClassName = 'Treatment of materials')),

('Online Education', (SELECT Id FROM Categories WHERE ClassName = 'Education and entertainment')),
('Training Courses', (SELECT Id FROM Categories WHERE ClassName = 'Education and entertainment')),
('Entertainment Services', (SELECT Id FROM Categories WHERE ClassName = 'Education and entertainment')),

('Tech Consulting', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and technological services')),
('Software Development', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and technological services')),
('Engineering Services', (SELECT Id FROM Categories WHERE ClassName = 'Scientific and technological services')),

('Catering Services', (SELECT Id FROM Categories WHERE ClassName = 'Food and accommodation services')),
('Hotel Accommodation', (SELECT Id FROM Categories WHERE ClassName = 'Food and accommodation services')),
('Restaurant Services', (SELECT Id FROM Categories WHERE ClassName = 'Food and accommodation services')),

('Medical Care', (SELECT Id FROM Categories WHERE ClassName = 'Medical and beauty services')),
('Beauty Salons', (SELECT Id FROM Categories WHERE ClassName = 'Medical and beauty services')),
('Spa Services', (SELECT Id FROM Categories WHERE ClassName = 'Medical and beauty services')),

('Legal Advisory', (SELECT Id FROM Categories WHERE ClassName = 'Legal and security services')),
('Security Services', (SELECT Id FROM Categories WHERE ClassName = 'Legal and security services')),
('Legal Representation', (SELECT Id FROM Categories WHERE ClassName = 'Legal and security services'));
