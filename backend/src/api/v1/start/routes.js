const RegisterRouter = require('../routes/register.routes');
const BusinessRouter = require('../routes/business.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/business', BusinessRouter);
};
