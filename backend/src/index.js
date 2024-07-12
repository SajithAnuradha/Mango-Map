const express = require('express');
require('express-async-errors');
require('dotenv').config();
const hpp = require('hpp');
const helmet = require('helmet');
const db = require('./api/v1/models');
const { globalErrorHandler } = require('./api/v1/start/errorHandler');
const limiter = require('./api/v1/start/ratelimitter');
const port = process.env.PORT || 8888;

process.on('unhandledRejection', (ex) => {
  console.error(ex.message);
  process.exit(1);
});

process.on('uncaughtException', (ex) => {
  console.error(ex.message);
  process.exit(1);
});

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true, limit: '50mb' }));
app.use('/api', limiter);
require('./api/v1/start/swagger')(app);
app.use(hpp());
app.use(helmet());
require('./api/v1/start/routes')(app);
// demo only
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to the backend!' });
});
// habdle the errors that are thrown by the application
app.use(globalErrorHandler);
db.sequelize.sync().then(() => {
  console.log('[DATABASE] Database connected');

  app.listen(port, () => {
    console.log(`[SERVER] Server is running on port ${port} `);
  });
});
