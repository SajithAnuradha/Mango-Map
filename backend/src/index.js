const express = require('express');
require('dotenv').config();
const db = require('./api/v1/models');
const port = process.env.PORT || 8888;

const app = express();

require('./api/v1/start/routes')(app);
// demo only
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to the backend!' });
});

// habdle the errors that are thrown by the application
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: err.message });
});

db.sequelize.sync().then(() => {
  console.log('[DATABASE] Database connected');

  app.listen(port, () => {
    console.log(`[SERVER] Server is running on port ${port}`);
  });
});
