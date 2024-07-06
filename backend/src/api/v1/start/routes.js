const RegisterRouter = require('../routes/register.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
};
