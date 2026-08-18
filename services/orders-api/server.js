const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
const app = express();
app.use(cors());
app.use(express.json());
const pool = new Pool({
  host: process.env.DB_HOST || 'postgres-service',
  port: 5432,
  user: process.env.DB_USER || 'cafeboreal_admin',
  password: process.env.DB_PASS,
  database: process.env.DB_NAME || 'cafeboreal_db'
});
app.get('/api/orders/healthz', (req,res) => res.json({status:'ok'}));
app.get('/api/orders', async (req,res) => {
  const r = await pool.query('SELECT o.*, c.name as customer_name FROM orders o LEFT JOIN customers c ON o.customer_id=c.id ORDER BY o.id DESC');
  res.json(r.rows);
});
app.get('/api/orders/:id', async (req,res) => {
  const order = await pool.query('SELECT * FROM orders WHERE id=$1',[req.params.id]);
  if(!order.rows.length) return res.status(404).json({error:'Not found'});
  const items = await pool.query('SELECT oi.*, p.name as product_name FROM order_items oi JOIN products p ON oi.product_id=p.id WHERE oi.order_id=$1',[req.params.id]);
  res.json({...order.rows[0], items: items.rows});
});
app.post('/api/orders', async (req,res) => {
  const {customer_id, items} = req.body;
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    let total = 0;
    for(const item of items) {
      const p = await client.query('SELECT price FROM products WHERE id=$1',[item.product_id]);
      total += p.rows[0].price * item.quantity;
    }
    const order = await client.query('INSERT INTO orders(customer_id,total) VALUES($1,$2) RETURNING *',[customer_id,total]);
    for(const item of items) {
      const p = await client.query('SELECT price FROM products WHERE id=$1',[item.product_id]);
      await client.query('INSERT INTO order_items(order_id,product_id,quantity,unit_price) VALUES($1,$2,$3,$4)',[order.rows[0].id,item.product_id,item.quantity,p.rows[0].price]);
    }
    await client.query('COMMIT');
    res.status(201).json(order.rows[0]);
  } catch(e) { await client.query('ROLLBACK'); res.status(500).json({error:e.message}); }
  finally { client.release(); }
});
app.listen(3002, () => console.log('Orders API on 3002'));
