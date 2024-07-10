const RegisterRouter = require('../routes/register.routes');
const LocationRouter = require('../routes/location.routes');

const AuthRouter = require('../routes/auth.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/auth', AuthRouter);
  app.use('/api/v1/profile', ProfileRouter);
  app.use('/api/v1/location', LocationRouter);
};
