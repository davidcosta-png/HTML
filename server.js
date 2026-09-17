/*
Simple Node.js + Express skeleton for the Biblioteca Digital API (mock)
This is an optional backend to run locally for integration. It serves:
  - GET /api/books => list books (from assets/books.json)
  - GET /api/books/:id => book detail
  - POST /api/borrow => mock borrow request

Usage:
  1. Install Node.js (https://nodejs.org/)
  2. In the project folder run: npm install
  3. Start: node server.js
  4. Access API: http://localhost:3000/api/books

This server is intentionally minimal and for development only.
*/
const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.json());
app.use(express.static(path.join(__dirname)));

function readBooks(){
  const p = path.join(__dirname,'assets','books.json');
  const raw = fs.readFileSync(p,'utf8');
  return JSON.parse(raw);
}

app.get('/api/books', (req,res)=>{
  try{ const books = readBooks(); res.json(books); } catch(e){ res.status(500).json({error:'failed to read books'}); }
});

app.get('/api/books/:id',(req,res)=>{
  try{ const books = readBooks(); const b = books.find(x=>x.id===req.params.id); if(!b) return res.status(404).json({error:'not found'}); res.json(b); } catch(e){ res.status(500).json({error:'failed'}); }
});

app.post('/api/borrow',(req,res)=>{
  // mock borrow: accept {id,user}
  const {id,user} = req.body || {};
  if(!id || !user) return res.status(400).json({error:'id and user required'});
  // in a real app: check availability, create loan record
  res.json({status:'ok',message:`Empréstimo solicitado para ${id} (demo)`});
});

app.listen(PORT, ()=>console.log(`Mock API running at http://localhost:${PORT}`));
