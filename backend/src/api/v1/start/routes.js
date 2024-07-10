const RegisterRouter = require('../routes/register.routes');
const AuthRouter = require('../routes/auth.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/auth', AuthRouter);
};
