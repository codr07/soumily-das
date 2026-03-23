-- OCBMS Mock Data Seed Script
USE ocbms;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE users;

TRUNCATE TABLE categories;

TRUNCATE TABLE products;

TRUNCATE TABLE orders;

TRUNCATE TABLE order_items;

SET FOREIGN_KEY_CHECKS = 1;

-- Creating Users
INSERT INTO
    users (
        username,
        email,
        password_hash,
        role
    )
VALUES (
        'admin1',
        'admin@example.com',
        '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by',
        'Admin'
    ),
    (
        'artisan_bob',
        'bob@example.com',
        '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by',
        'Artisan'
    ),
    (
        'artisan_sue',
        'sue@example.com',
        '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by',
        'Artisan'
    ),
    (
        'customer_john',
        'john@example.com',
        '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by',
        'Customer'
    ),
    (
        'customer_jane',
        'jane@example.com',
        '$2b$10$sAmN56GTewptI0wCiy3rUuq69hsdb4iw/sC.VA5MWQ.vzdUZWf5by',
        'Customer'
    );

-- Creating Categories
INSERT INTO
    categories (name, description)
VALUES (
        'Pottery',
        'Clay-based handmade goods.'
    ),
    (
        'Woodwork',
        'Hand-carved wooden creations.'
    ),
    (
        'Jewelry',
        'Custom jewelry and ornaments.'
    ),
    (
        'Textiles',
        'Woven fabrics and clothing.'
    ),
    (
        'Glass Art',
        'Stained and blown glass items.'
    );

-- Generating 100 Products
INSERT INTO
    products (
        sku,
        name,
        description,
        price,
        stock_quantity,
        category_id,
        artisan_id,
        image_url
    )
VALUES (
        'SKU-1001',
        'Modern Bowl 1',
        'A beautifully made modern bowl 1 directly crafted by our finest artisans.',
        56.51,
        14,
        2,
        3,
        '/images/woodwork.png'
    ),
    (
        'SKU-1002',
        'Premium Vase 2',
        'A beautifully made premium vase 2 directly crafted by our finest artisans.',
        83.22,
        50,
        5,
        2,
        '/images/glass_art.png'
    ),
    (
        'SKU-1003',
        'Modern Ornament 3',
        'A beautifully made modern ornament 3 directly crafted by our finest artisans.',
        14.81,
        11,
        2,
        3,
        '/images/woodwork.png'
    ),
    (
        'SKU-1004',
        'Premium Table 4',
        'A beautifully made premium table 4 directly crafted by our finest artisans.',
        64.62,
        3,
        5,
        3,
        '/images/glass_art.png'
    ),
    (
        'SKU-1005',
        'Elegant Necklace 5',
        'A beautifully made elegant necklace 5 directly crafted by our finest artisans.',
        17.70,
        25,
        2,
        3,
        '/images/woodwork.png'
    ),
    (
        'SKU-1006',
        'Elegant Vase 6',
        'A beautifully made elegant vase 6 directly crafted by our finest artisans.',
        36.14,
        26,
        1,
        3,
        '/images/pottery.png'
    ),
    (
        'SKU-1007',
        'Handcrafted Bowl 7',
        'A beautifully made handcrafted bowl 7 directly crafted by our finest artisans.',
        28.79,
        7,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1008',
        'Handcrafted Mug 8',
        'A beautifully made handcrafted mug 8 directly crafted by our finest artisans.',
        36.03,
        10,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1009',
        'Modern Vase 9',
        'A beautifully made modern vase 9 directly crafted by our finest artisans.',
        54.35,
        32,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1010',
        'Vintage Bowl 10',
        'A beautifully made vintage bowl 10 directly crafted by our finest artisans.',
        47.35,
        11,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1011',
        'Handcrafted Mug 11',
        'A beautifully made handcrafted mug 11 directly crafted by our finest artisans.',
        26.46,
        45,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1012',
        'Premium Vase 12',
        'A beautifully made premium vase 12 directly crafted by our finest artisans.',
        51.80,
        27,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1013',
        'Antique Mug 13',
        'A beautifully made antique mug 13 directly crafted by our finest artisans.',
        81.27,
        41,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1014',
        'Elegant Mug 14',
        'A beautifully made elegant mug 14 directly crafted by our finest artisans.',
        60.37,
        35,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1015',
        'Minimalist Vase 15',
        'A beautifully made minimalist vase 15 directly crafted by our finest artisans.',
        17.30,
        10,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1016',
        'Colorful Ornament 16',
        'A beautifully made colorful ornament 16 directly crafted by our finest artisans.',
        98.18,
        3,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1017',
        'Vintage Tapestry 17',
        'A beautifully made vintage tapestry 17 directly crafted by our finest artisans.',
        38.64,
        13,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1018',
        'Colorful Ornament 18',
        'A beautifully made colorful ornament 18 directly crafted by our finest artisans.',
        82.68,
        30,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1019',
        'Vintage Tapestry 19',
        'A beautifully made vintage tapestry 19 directly crafted by our finest artisans.',
        10.80,
        19,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1020',
        'Vintage Scarf 20',
        'A beautifully made vintage scarf 20 directly crafted by our finest artisans.',
        73.76,
        39,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1021',
        'Antique Tapestry 21',
        'A beautifully made antique tapestry 21 directly crafted by our finest artisans.',
        45.53,
        42,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1022',
        'Colorful Table 22',
        'A beautifully made colorful table 22 directly crafted by our finest artisans.',
        73.28,
        46,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1023',
        'Elegant Mug 23',
        'A beautifully made elegant mug 23 directly crafted by our finest artisans.',
        43.97,
        4,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1024',
        'Rustic Lamp 24',
        'A beautifully made rustic lamp 24 directly crafted by our finest artisans.',
        39.67,
        15,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1025',
        'Elegant Scarf 25',
        'A beautifully made elegant scarf 25 directly crafted by our finest artisans.',
        32.90,
        41,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1026',
        'Premium Scarf 26',
        'A beautifully made premium scarf 26 directly crafted by our finest artisans.',
        56.68,
        21,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1027',
        'Premium Mug 27',
        'A beautifully made premium mug 27 directly crafted by our finest artisans.',
        35.94,
        20,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1028',
        'Rustic Vase 28',
        'A beautifully made rustic vase 28 directly crafted by our finest artisans.',
        87.69,
        8,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1029',
        'Modern Scarf 29',
        'A beautifully made modern scarf 29 directly crafted by our finest artisans.',
        87.22,
        19,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1030',
        'Colorful Lamp 30',
        'A beautifully made colorful lamp 30 directly crafted by our finest artisans.',
        85.29,
        50,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1031',
        'Minimalist Ring 31',
        'A beautifully made minimalist ring 31 directly crafted by our finest artisans.',
        42.75,
        50,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1032',
        'Modern Necklace 32',
        'A beautifully made modern necklace 32 directly crafted by our finest artisans.',
        30.41,
        42,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1033',
        'Premium Scarf 33',
        'A beautifully made premium scarf 33 directly crafted by our finest artisans.',
        15.70,
        35,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1034',
        'Antique Ornament 34',
        'A beautifully made antique ornament 34 directly crafted by our finest artisans.',
        93.31,
        7,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1035',
        'Boho Tapestry 35',
        'A beautifully made boho tapestry 35 directly crafted by our finest artisans.',
        53.04,
        2,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1036',
        'Modern Necklace 36',
        'A beautifully made modern necklace 36 directly crafted by our finest artisans.',
        13.68,
        23,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1037',
        'Colorful Mug 37',
        'A beautifully made colorful mug 37 directly crafted by our finest artisans.',
        34.00,
        8,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1038',
        'Antique Table 38',
        'A beautifully made antique table 38 directly crafted by our finest artisans.',
        48.29,
        46,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1039',
        'Vintage Table 39',
        'A beautifully made vintage table 39 directly crafted by our finest artisans.',
        58.22,
        26,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1040',
        'Elegant Lamp 40',
        'A beautifully made elegant lamp 40 directly crafted by our finest artisans.',
        56.35,
        32,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1041',
        'Rustic Scarf 41',
        'A beautifully made rustic scarf 41 directly crafted by our finest artisans.',
        82.40,
        29,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1042',
        'Premium Mug 42',
        'A beautifully made premium mug 42 directly crafted by our finest artisans.',
        57.96,
        34,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1043',
        'Premium Mug 43',
        'A beautifully made premium mug 43 directly crafted by our finest artisans.',
        83.17,
        35,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1044',
        'Antique Ring 44',
        'A beautifully made antique ring 44 directly crafted by our finest artisans.',
        28.49,
        48,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1045',
        'Minimalist Lamp 45',
        'A beautifully made minimalist lamp 45 directly crafted by our finest artisans.',
        63.02,
        2,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1046',
        'Vintage Bowl 46',
        'A beautifully made vintage bowl 46 directly crafted by our finest artisans.',
        45.78,
        13,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1047',
        'Elegant Table 47',
        'A beautifully made elegant table 47 directly crafted by our finest artisans.',
        55.98,
        48,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1048',
        'Vintage Table 48',
        'A beautifully made vintage table 48 directly crafted by our finest artisans.',
        13.73,
        48,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1049',
        'Antique Tapestry 49',
        'A beautifully made antique tapestry 49 directly crafted by our finest artisans.',
        82.71,
        34,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1050',
        'Vintage Mug 50',
        'A beautifully made vintage mug 50 directly crafted by our finest artisans.',
        91.52,
        47,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1051',
        'Vintage Lamp 51',
        'A beautifully made vintage lamp 51 directly crafted by our finest artisans.',
        13.48,
        46,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1052',
        'Handcrafted Lamp 52',
        'A beautifully made handcrafted lamp 52 directly crafted by our finest artisans.',
        27.22,
        45,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1053',
        'Minimalist Vase 53',
        'A beautifully made minimalist vase 53 directly crafted by our finest artisans.',
        39.70,
        39,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1054',
        'Elegant Lamp 54',
        'A beautifully made elegant lamp 54 directly crafted by our finest artisans.',
        98.28,
        4,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1055',
        'Premium Ring 55',
        'A beautifully made premium ring 55 directly crafted by our finest artisans.',
        36.54,
        41,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1056',
        'Antique Ornament 56',
        'A beautifully made antique ornament 56 directly crafted by our finest artisans.',
        62.87,
        18,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1057',
        'Handcrafted Scarf 57',
        'A beautifully made handcrafted scarf 57 directly crafted by our finest artisans.',
        25.10,
        17,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1058',
        'Antique Bowl 58',
        'A beautifully made antique bowl 58 directly crafted by our finest artisans.',
        80.91,
        15,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1059',
        'Handcrafted Bowl 59',
        'A beautifully made handcrafted bowl 59 directly crafted by our finest artisans.',
        51.98,
        11,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1060',
        'Boho Bowl 60',
        'A beautifully made boho bowl 60 directly crafted by our finest artisans.',
        43.12,
        23,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1061',
        'Vintage Necklace 61',
        'A beautifully made vintage necklace 61 directly crafted by our finest artisans.',
        16.94,
        24,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1062',
        'Minimalist Necklace 62',
        'A beautifully made minimalist necklace 62 directly crafted by our finest artisans.',
        46.36,
        39,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1063',
        'Premium Vase 63',
        'A beautifully made premium vase 63 directly crafted by our finest artisans.',
        82.81,
        49,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1064',
        'Handcrafted Mug 64',
        'A beautifully made handcrafted mug 64 directly crafted by our finest artisans.',
        99.16,
        10,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1065',
        'Handcrafted Ornament 65',
        'A beautifully made handcrafted ornament 65 directly crafted by our finest artisans.',
        83.91,
        46,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1066',
        'Modern Lamp 66',
        'A beautifully made modern lamp 66 directly crafted by our finest artisans.',
        21.61,
        42,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1067',
        'Vintage Necklace 67',
        'A beautifully made vintage necklace 67 directly crafted by our finest artisans.',
        70.18,
        9,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1068',
        'Vintage Table 68',
        'A beautifully made vintage table 68 directly crafted by our finest artisans.',
        87.99,
        25,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1069',
        'Handcrafted Vase 69',
        'A beautifully made handcrafted vase 69 directly crafted by our finest artisans.',
        63.65,
        5,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1070',
        'Rustic Vase 70',
        'A beautifully made rustic vase 70 directly crafted by our finest artisans.',
        63.75,
        14,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1071',
        'Handcrafted Lamp 71',
        'A beautifully made handcrafted lamp 71 directly crafted by our finest artisans.',
        19.67,
        38,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1072',
        'Minimalist Bowl 72',
        'A beautifully made minimalist bowl 72 directly crafted by our finest artisans.',
        78.12,
        26,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1073',
        'Premium Tapestry 73',
        'A beautifully made premium tapestry 73 directly crafted by our finest artisans.',
        25.02,
        5,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1074',
        'Antique Lamp 74',
        'A beautifully made antique lamp 74 directly crafted by our finest artisans.',
        79.66,
        20,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1075',
        'Antique Mug 75',
        'A beautifully made antique mug 75 directly crafted by our finest artisans.',
        29.59,
        21,
        3,
        3,
        'images/jewelry.png'
    ),
    (
        'SKU-1076',
        'Vintage Mug 76',
        'A beautifully made vintage mug 76 directly crafted by our finest artisans.',
        66.43,
        13,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1077',
        'Modern Ornament 77',
        'A beautifully made modern ornament 77 directly crafted by our finest artisans.',
        85.44,
        13,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1078',
        'Handcrafted Mug 78',
        'A beautifully made handcrafted mug 78 directly crafted by our finest artisans.',
        83.55,
        42,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1079',
        'Rustic Table 79',
        'A beautifully made rustic table 79 directly crafted by our finest artisans.',
        24.75,
        33,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1080',
        'Antique Mug 80',
        'A beautifully made antique mug 80 directly crafted by our finest artisans.',
        57.00,
        31,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1081',
        'Vintage Ornament 81',
        'A beautifully made vintage ornament 81 directly crafted by our finest artisans.',
        72.66,
        3,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1082',
        'Boho Necklace 82',
        'A beautifully made boho necklace 82 directly crafted by our finest artisans.',
        14.30,
        15,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1083',
        'Boho Mug 83',
        'A beautifully made boho mug 83 directly crafted by our finest artisans.',
        56.70,
        27,
        2,
        2,
        'images/woodwork.png'
    ),
    (
        'SKU-1084',
        'Boho Vase 84',
        'A beautifully made boho vase 84 directly crafted by our finest artisans.',
        29.23,
        5,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1085',
        'Elegant Table 85',
        'A beautifully made elegant table 85 directly crafted by our finest artisans.',
        72.58,
        32,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1086',
        'Modern Mug 86',
        'A beautifully made modern mug 86 directly crafted by our finest artisans.',
        13.04,
        45,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1087',
        'Handcrafted Scarf 87',
        'A beautifully made handcrafted scarf 87 directly crafted by our finest artisans.',
        26.46,
        46,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1088',
        'Minimalist Lamp 88',
        'A beautifully made minimalist lamp 88 directly crafted by our finest artisans.',
        11.38,
        29,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1089',
        'Boho Vase 89',
        'A beautifully made boho vase 89 directly crafted by our finest artisans.',
        46.49,
        47,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1090',
        'Handcrafted Scarf 90',
        'A beautifully made handcrafted scarf 90 directly crafted by our finest artisans.',
        78.51,
        24,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1091',
        'Rustic Vase 91',
        'A beautifully made rustic vase 91 directly crafted by our finest artisans.',
        43.46,
        35,
        5,
        2,
        'images/glass_art.png'
    ),
    (
        'SKU-1092',
        'Boho Lamp 92',
        'A beautifully made boho lamp 92 directly crafted by our finest artisans.',
        25.05,
        43,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1093',
        'Minimalist Tapestry 93',
        'A beautifully made minimalist tapestry 93 directly crafted by our finest artisans.',
        17.16,
        44,
        1,
        3,
        'images/pottery.png'
    ),
    (
        'SKU-1094',
        'Modern Scarf 94',
        'A beautifully made modern scarf 94 directly crafted by our finest artisans.',
        63.41,
        46,
        4,
        2,
        'images/textiles.png'
    ),
    (
        'SKU-1095',
        'Minimalist Scarf 95',
        'A beautifully made minimalist scarf 95 directly crafted by our finest artisans.',
        20.08,
        40,
        1,
        2,
        'images/pottery.png'
    ),
    (
        'SKU-1096',
        'Vintage Tapestry 96',
        'A beautifully made vintage tapestry 96 directly crafted by our finest artisans.',
        92.24,
        21,
        5,
        3,
        'images/glass_art.png'
    ),
    (
        'SKU-1097',
        'Boho Tapestry 97',
        'A beautifully made boho tapestry 97 directly crafted by our finest artisans.',
        32.92,
        33,
        2,
        3,
        'images/woodwork.png'
    ),
    (
        'SKU-1098',
        'Vintage Tapestry 98',
        'A beautifully made vintage tapestry 98 directly crafted by our finest artisans.',
        10.50,
        37,
        4,
        3,
        'images/textiles.png'
    ),
    (
        'SKU-1099',
        'Boho Bowl 99',
        'A beautifully made boho bowl 99 directly crafted by our finest artisans.',
        91.91,
        36,
        3,
        2,
        'images/jewelry.png'
    ),
    (
        'SKU-1100',
        'Antique Necklace 100',
        'A beautifully made antique necklace 100 directly crafted by our finest artisans.',
        22.04,
        26,
        1,
        3,
        'images/pottery.png'
    );

-- Generating Order Data
INSERT INTO
    orders (
        user_id,
        total_amount,
        shipping_address,
        status
    )
VALUES (
        4,
        120.50,
        '123 Fake Street, Cityville',
        'Delivered'
    ),
    (
        5,
        45.00,
        '456 Random Ave, Townsville',
        'Pending'
    );

INSERT INTO
    order_items (
        order_id,
        product_id,
        quantity,
        price_at_purchase
    )
VALUES (1, 5, 2, 40.00),
    (1, 12, 1, 40.50),
    (2, 45, 1, 45.00);