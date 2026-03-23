const express = require('express');
const router = express.Router();
const pool = require('../database');
const auth = require('./auth');

// Protect all reporting routes (Admin only)
router.use(auth.verifyToken, auth.checkRole(['Admin']));

// Total Sales Summary
router.get('/sales/summary', async (req, res) => {
    try {
        const [result] = await pool.query(`
            SELECT 
                COUNT(order_id) as total_orders,
                SUM(total_amount) as total_revenue
            FROM orders 
            WHERE status != 'Cancelled'
        `);
        res.json(result[0]);
    } catch (error) {
        res.status(500).json({ error: 'Failed to generate report' });
    }
});

// Daily Sales Report
router.get('/sales/daily', async (req, res) => {
    try {
        const [results] = await pool.query(`
            SELECT 
                DATE(created_at) as sale_date,
                COUNT(order_id) as orders_count,
                SUM(total_amount) as daily_revenue
            FROM orders
            WHERE status != 'Cancelled'
            GROUP BY DATE(created_at)
            ORDER BY sale_date DESC
            LIMIT 30
        `);
        res.json(results);
    } catch (error) {
        res.status(500).json({ error: 'Failed to generate report' });
    }
});

// Top Selling Products
router.get('/products/top', async (req, res) => {
    try {
        const [results] = await pool.query(`
            SELECT 
                p.product_id,
                p.name as product_name,
                SUM(oi.quantity) as total_sold,
                SUM(oi.quantity * oi.price_at_purchase) as revenue_generated
            FROM order_items oi
            JOIN products p ON oi.product_id = p.product_id
            JOIN orders o ON oi.order_id = o.order_id
            WHERE o.status != 'Cancelled'
            GROUP BY p.product_id, p.name
            ORDER BY total_sold DESC
            LIMIT 10
        `);
        res.json(results);
    } catch (error) {
        res.status(500).json({ error: 'Failed to generate report' });
    }
});

// Low Stock Alert
router.get('/inventory/low-stock', async (req, res) => {
    try {
        const threshold = parseInt(req.query.threshold) || 10;
        const [results] = await pool.query(`
            SELECT product_id, sku, name, stock_quantity
            FROM products
            WHERE stock_quantity <= ?
            ORDER BY stock_quantity ASC
        `, [threshold]);
        res.json(results);
    } catch (error) {
        res.status(500).json({ error: 'Failed to generate report' });
    }
});

module.exports = router;
