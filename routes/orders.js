const express = require('express');
const router = express.Router();
const pool = require('../database');
const auth = require('./auth');

// Place an order (Requires Customer role)
router.post('/', auth.verifyToken, auth.checkRole(['Customer']), async (req, res) => {
    const { items, shipping_address } = req.body; // items = [{ product_id, quantity }]
    const user_id = req.user.userId;

    if (!items || items.length === 0) {
        return res.status(400).json({ error: 'Order must contain at least one item' });
    }

    const connection = await pool.getConnection();

    try {
        // Start an ACID transaction
        await connection.beginTransaction();

        let total_amount = 0;
        const validItems = [];

        // 1. Check stock and calculate total
        for (const item of items) {
            const [products] = await connection.query('SELECT * FROM products WHERE product_id = ? FOR UPDATE', [item.product_id]);
            
            if (products.length === 0) {
                throw new Error(`Product ID ${item.product_id} not found`);
            }
            
            const product = products[0];

            if (product.stock_quantity < item.quantity) {
                throw new Error(`Insufficient stock for product: ${product.name}`);
            }

            total_amount += product.price * item.quantity;
            validItems.push({
                product_id: product.product_id,
                quantity: item.quantity,
                price_at_purchase: product.price
            });
        }

        // 2. Create the order record
        const [orderResult] = await connection.query(
            'INSERT INTO orders (user_id, total_amount, shipping_address) VALUES (?, ?, ?)',
            [user_id, total_amount, shipping_address]
        );
        const order_id = orderResult.insertId;

        // 3. Insert order items and update inventory
        for (const item of validItems) {
            await connection.query(
                'INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES (?, ?, ?, ?)',
                [order_id, item.product_id, item.quantity, item.price_at_purchase]
            );

            await connection.query(
                'UPDATE products SET stock_quantity = stock_quantity - ? WHERE product_id = ?',
                [item.quantity, item.product_id]
            );
        }

        // Commit transaction
        await connection.commit();
        res.status(201).json({ message: 'Order placed successfully', order_id });
    } catch (error) {
        // Rollback on any failure
        await connection.rollback();
        console.error('Order transaction failed:', error.message);
        res.status(400).json({ error: error.message });
    } finally {
        connection.release();
    }
});

// Get user's orders
router.get('/', auth.verifyToken, async (req, res) => {
    try {
        let query = 'SELECT * FROM orders ';
        let params = [];

        // Admin sees all, Customers only see their own
        if (req.user.role === 'Customer') {
            query += 'WHERE user_id = ? ';
            params.push(req.user.userId);
        }
        
        query += 'ORDER BY created_at DESC';

        const [orders] = await pool.query(query, params);
        res.json(orders);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch orders' });
    }
});

// Get order details
router.get('/:id', auth.verifyToken, async (req, res) => {
    try {
        const [orders] = await pool.query('SELECT * FROM orders WHERE order_id = ?', [req.params.id]);
        
        if (orders.length === 0) return res.status(404).json({ error: 'Order not found' });
        
        // Authorization check
        if (req.user.role === 'Customer' && orders[0].user_id !== req.user.userId) {
            return res.status(403).json({ error: 'Access denied' });
        }

        const [items] = await pool.query(`
            SELECT oi.*, p.name as product_name 
            FROM order_items oi
            JOIN products p ON oi.product_id = p.product_id
            WHERE oi.order_id = ?`, 
            [req.params.id]
        );

        res.json({ order: orders[0], items });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch order details' });
    }
});

// Update order status (Admin only)
router.put('/:id/status', auth.verifyToken, auth.checkRole(['Admin']), async (req, res) => {
    const { status } = req.body;
    try {
        await pool.query('UPDATE orders SET status = ? WHERE order_id = ?', [status, req.params.id]);
        res.json({ message: 'Order status updated successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to update status' });
    }
});

module.exports = router;
