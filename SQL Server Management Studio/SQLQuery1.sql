-- Create the table
CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClassName VARCHAR(255) NOT NULL,
    CategoryType VARCHAR(50) NOT NULL
);

-- Insert the categories
INSERT INTO Categories (ClassName, CategoryType)
VALUES
('Chemicals for industry, science, and agriculture', 'Goods'),
('Paints, varnishes, lacquers', 'Goods'),
('Cosmetics and cleaning preparations', 'Goods'),
('Industrial oils and lubricants', 'Goods'),
('Pharmaceuticals and veterinary preparations', 'Goods'),
('Metals and alloys', 'Goods'),
('Machines and tools', 'Goods'),
('Hand tools', 'Goods'),
('Scientific and photographic equipment', 'Goods'),
('Medical devices', 'Goods'),
('Environmental control apparatus', 'Goods'),
('Vehicles and conveyances', 'Goods'),
('Firearms and ammunition', 'Goods'),
('Precious metals and alloys', 'Goods'),
('Musical instruments', 'Goods'),
('Paper, cardboard, and printed materials', 'Goods'),
('Rubber and plastics', 'Goods'),
('Leather goods', 'Goods'),
('Building materials', 'Goods'),
('Furniture and mirrors', 'Goods'),
('Household utensils', 'Goods'),
('Ropes and nets', 'Goods'),
('Yarns and threads', 'Goods'),
('Textiles and textile goods', 'Goods'),
('Clothing and footwear', 'Goods'),
('Lace, embroidery, ribbons', 'Goods'),
('Carpets, rugs, and mats', 'Goods'),
('Games and sports equipment', 'Goods'),
('Meat, fish, and oils', 'Goods'),
('Coffee, tea, and foodstuffs', 'Goods'),
('Agricultural and forestry products', 'Goods'),
('Beverages (non-alcoholic)', 'Goods'),
('Alcoholic beverages', 'Goods'),
('Tobacco and smokers'' articles', 'Goods'),
('Advertising and business services', 'Services'),
('Insurance and financial services', 'Services'),
('Construction and repair services', 'Services'),
('Telecommunications', 'Services'),
('Transport and packaging services', 'Services'),
('Treatment of materials', 'Services'),
('Education and entertainment', 'Services'),
('Scientific and technological services', 'Services'),
('Food and accommodation services', 'Services'),
('Medical and beauty services', 'Services'),
('Legal and security services', 'Services');

-- Create an index for faster queries on ClassName
CREATE INDEX idx_classname ON Categories(ClassName);
