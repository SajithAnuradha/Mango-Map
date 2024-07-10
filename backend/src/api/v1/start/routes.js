const RegisterRouter = require('../routes/register.routes');
const BusinessRouter = require('../routes/business.routes');
const BusinessProfileRouter = require('../routes/businessprofile.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/business', BusinessRouter);
  app.use('/api/v1/profile/business', BusinessProfileRouter);
};
