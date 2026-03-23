const fs = require('fs');

const dummyPassword = '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by'; // 'pss123'

let sql = `-- OCBMS Mock Data Seed Script
USE ocbms;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE users;
TRUNCATE TABLE categories;
TRUNCATE TABLE products;
TRUNCATE TABLE orders;
TRUNCATE TABLE order_items;
SET FOREIGN_KEY_CHECKS = 1;

-- Creating Users
INSERT INTO users (username, email, password_hash, role) VALUES 
('admin1', 'admin@example.com', '${dummyPassword}', 'Admin'),
('artisan_bob', 'bob@example.com', '${dummyPassword}', 'Artisan'),
('artisan_sue', 'sue@example.com', '${dummyPassword}', 'Artisan'),
('customer_john', 'john@example.com', '${dummyPassword}', 'Customer'),
('customer_jane', 'jane@example.com', '${dummyPassword}', 'Customer');

-- Creating Categories
INSERT INTO categories (name, description) VALUES
('Pottery', 'Clay-based handmade goods.'),
('Woodwork', 'Hand-carved wooden creations.'),
('Jewelry', 'Custom jewelry and ornaments.'),
('Textiles', 'Woven fabrics and clothing.'),
('Glass Art', 'Stained and blown glass items.');

-- Generating 100 Products
INSERT INTO products (sku, name, description, price, stock_quantity, category_id, artisan_id, image_url) VALUES
`;

const adjectives = ['Rustic', 'Vintage', 'Modern', 'Elegant', 'Handcrafted', 'Boho', 'Minimalist', 'Antique', 'Colorful', 'Premium'];
const nouns = ['Vase', 'Table', 'Necklace', 'Scarf', 'Ornament', 'Bowl', 'Ring', 'Tapestry', 'Mug', 'Lamp'];

for (let i = 1; i <= 100; i++) {
    const adj = adjectives[Math.floor(Math.random() * adjectives.length)];
    const noun = nouns[Math.floor(Math.random() * nouns.length)];
    const name = `${adj} ${noun} ${i}`;
    const sku = `SKU-${1000 + i}`;
    const desc = `A beautifully made ${name.toLowerCase()} directly crafted by our finest artisans.`;
    const price = (Math.random() * 90 + 10).toFixed(2);
    const stock = Math.floor(Math.random() * 50) + 1;
    const catId = Math.floor(Math.random() * 5) + 1; // 1 to 5
    const artisanId = Math.floor(Math.random() * 2) + 2; // 2 or 3 (bob or sue)
    
    let imgUrl = '';
    if (catId === 1) imgUrl = 'images/pottery.png';
    else if (catId === 2) imgUrl = 'images/woodwork.png';
    else if (catId === 3) imgUrl = 'images/jewelry.png';
    else if (catId === 4) imgUrl = 'images/textiles.png';
    else imgUrl = 'images/glass_art.png';
    
    sql += `('${sku}', '${name.replace(/'/g, "''")}', '${desc.replace(/'/g, "''")}', ${price}, ${stock}, ${catId}, ${artisanId}, '${imgUrl}')`;
    if (i < 100) sql += ',\n';
    else sql += ';\n';
}

sql += `
-- Generating Order Data
INSERT INTO orders (user_id, total_amount, shipping_address, status) VALUES
(4, 120.50, '123 Fake Street, Cityville', 'Delivered'),
(5, 45.00, '456 Random Ave, Townsville', 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 5, 2, 40.00),
(1, 12, 1, 40.50),
(2, 45, 1, 45.00);
`;

fs.writeFileSync('seed.sql', sql);
console.log('Successfully generated seed.sql with 100 products!');
