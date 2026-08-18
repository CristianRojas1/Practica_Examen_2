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
app.get('/api/catalog/healthz', (req,res) => res.json({status:'ok'}));
app.get('/api/catalog', async (req,res) => {
  const r = await pool.query('SELECT * FROM products ORDER BY id');
  res.json(r.rows);
});
app.get('/api/catalog/:id', async (req,res) => {
  const r = await pool.query('SELECT * FROM products WHERE id=$1',[req.params.id]);
  r.rows.length ? res.json(r.rows[0]) : res.status(404).json({error:'Not found'});
});
app.post('/api/catalog', async (req,res) => {
  const {name,price,stock,description,image} = req.body;
  const r = await pool.query('INSERT INTO products(name,price,stock,description,image) VALUES($1,$2,$3,$4,$5) RETURNING *',[name,price,stock||0,description||'',image||'default.jpg']);
  res.status(201).json(r.rows[0]);
});
app.put('/api/catalog/:id', async (req,res) => {
  const {name,price,stock,description,image} = req.body;
  const r = await pool.query('UPDATE products SET name=COALESCE($1,name),price=COALESCE($2,price),stock=COALESCE($3,stock),description=COALESCE($4,description),image=COALESCE($5,image) WHERE id=$6 RETURNING *',[name,price,stock,description,image,req.params.id]);
  r.rows.length ? res.json(r.rows[0]) : res.status(404).json({error:'Not found'});
});
app.delete('/api/catalog/:id', async (req,res) => {
  await pool.query('DELETE FROM products WHERE id=$1',[req.params.id]);
  res.json({deleted:true});
});
app.listen(3001, () => console.log('Catalog API on 3001'));
