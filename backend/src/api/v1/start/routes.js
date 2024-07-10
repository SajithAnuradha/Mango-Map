const RegisterRouter = require('../routes/register.routes');
const ProfileRouter = require('../routes/profile.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/profile', ProfileRouter);
};
