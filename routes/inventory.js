const express = require('express');
const router = express.Router();
const pool = require('../database');
const auth = require('./auth'); // Use verifyToken middleware

// Get all products (Public)
router.get('/products', async (req, res) => {
    try {
        const [products] = await pool.query(`
            SELECT p.*, c.name as category_name, u.username as artisan_name 
            FROM products p
            LEFT JOIN categories c ON p.category_id = c.category_id
            LEFT JOIN users u ON p.artisan_id = u.user_id
        `);
        res.json(products);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch products' });
    }
});

// Get single product (Public)
router.get('/products/:id', async (req, res) => {
    try {
        const [products] = await pool.query('SELECT * FROM products WHERE product_id = ?', [req.params.id]);
        if (products.length === 0) return res.status(404).json({ error: 'Product not found' });
        res.json(products[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch product' });
    }
});

// Add a product (Requires Artisan or Admin role)
router.post('/products', auth.verifyToken, auth.checkRole(['Admin', 'Artisan']), async (req, res) => {
    const { sku, name, description, price, stock_quantity, category_id, image_url } = req.body;
    const artisan_id = req.user.userId; // Default to logged-in user

    try {
        const [result] = await pool.query(
            'INSERT INTO products (sku, name, description, price, stock_quantity, category_id, artisan_id, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [sku, name, description, price, stock_quantity, category_id, artisan_id, image_url]
        );
        res.status(201).json({ message: 'Product added successfully', productId: result.insertId });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to add product' });
    }
});

// Update a product (Requires Artisan or Admin role)
router.put('/products/:id', auth.verifyToken, auth.checkRole(['Admin', 'Artisan']), async (req, res) => {
    const { name, description, price, stock_quantity, category_id, image_url } = req.body;
    try {
        // If artisan, check if they own the product
        if (req.user.role === 'Artisan') {
            const [products] = await pool.query('SELECT artisan_id FROM products WHERE product_id = ?', [req.params.id]);
            if (products.length === 0 || products[0].artisan_id !== req.user.userId) {
                return res.status(403).json({ error: 'You do not have permission to edit this product' });
            }
        }

        await pool.query(
            'UPDATE products SET name = ?, description = ?, price = ?, stock_quantity = ?, category_id = ?, image_url = ? WHERE product_id = ?',
            [name, description, price, stock_quantity, category_id, image_url, req.params.id]
        );
        res.json({ message: 'Product updated successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to update product' });
    }
});

// Delete a product
router.delete('/products/:id', auth.verifyToken, auth.checkRole(['Admin', 'Artisan']), async (req, res) => {
    try {
        // If artisan, check if they own the product
        if (req.user.role === 'Artisan') {
            const [products] = await pool.query('SELECT artisan_id FROM products WHERE product_id = ?', [req.params.id]);
            if (products.length === 0 || products[0].artisan_id !== req.user.userId) {
                return res.status(403).json({ error: 'You do not have permission to delete this product' });
            }
        }

        await pool.query('DELETE FROM products WHERE product_id = ?', [req.params.id]);
        res.json({ message: 'Product deleted successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to delete product' });
    }
});

// Categories endpoints
router.get('/categories', async (req, res) => {
    try {
        const [categories] = await pool.query('SELECT * FROM categories');
        res.json(categories);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch categories' });
    }
});

module.exports = router;
