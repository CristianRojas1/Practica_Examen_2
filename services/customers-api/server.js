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
const ENC_KEY = process.env.ENCRYPTION_KEY;
app.get('/api/customers/healthz', (req,res) => res.json({status:'ok'}));
app.get('/api/customers', async (req,res) => {
  const r = await pool.query('SELECT id,name,email,pgp_sym_decrypt(identity_encrypted,$1) as identity,created_at FROM customers ORDER BY id',[ENC_KEY]);
  res.json(r.rows);
});
app.get('/api/customers/:id', async (req,res) => {
  const r = await pool.query('SELECT id,name,email,pgp_sym_decrypt(identity_encrypted,$1) as identity,created_at FROM customers WHERE id=$2',[ENC_KEY,req.params.id]);
  r.rows.length ? res.json(r.rows[0]) : res.status(404).json({error:'Not found'});
});
app.post('/api/customers', async (req,res) => {
  const {name,email,identity} = req.body;
  const r = await pool.query('INSERT INTO customers(name,email,identity_encrypted) VALUES($1,$2,pgp_sym_encrypt($3,$4)) RETURNING id,name,email,created_at',[name,email,identity,ENC_KEY]);
  res.status(201).json(r.rows[0]);
});
app.put('/api/customers/:id', async (req,res) => {
  const {name,email} = req.body;
  const r = await pool.query('UPDATE customers SET name=COALESCE($1,name),email=COALESCE($2,email) WHERE id=$3 RETURNING id,name,email,created_at',[name,email,req.params.id]);
  r.rows.length ? res.json(r.rows[0]) : res.status(404).json({error:'Not found'});
});
app.delete('/api/customers/:id', async (req,res) => {
  await pool.query('DELETE FROM customers WHERE id=$1',[req.params.id]);
  res.json({deleted:true});
});
app.listen(3003, () => console.log('Customers API on 3003'));
