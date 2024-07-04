const express = require('express');
require('dotenv').config();
const db = require('./api/models');
const port = process.env.PORT || 8888;

const app = express();

// demo only
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to the backend!' });
});

db.sequelize.sync().then(() => {
  console.log('[DATABASE] Database connected');

  app.listen(port, () => {
    console.log(`[SERVER] Server is running on port ${port}`);
  });
});
