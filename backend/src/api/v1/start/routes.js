const RegisterRouter = require('../routes/register.routes');
const LocationRouter = require('../routes/location.routes');
const BusinessProfileRouter = require('../routes/businessProfile.route');
const NotificationRouter = require('../routes/notification.route');
const AuthRouter = require('../routes/auth.routes');
const BusinessRouter = require('../routes/business.routes');
const ProfileRouter = require('../routes/profile.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/auth', AuthRouter);
  app.use('/api/v1/businessProfile', BusinessProfileRouter);
  app.use('/api/v1/notification', NotificationRouter);
  app.use('/api/v1/profile', ProfileRouter);
  app.use('/api/v1/location', LocationRouter);
  app.use('/api/v1/business', BusinessRouter);
  app.use('/api/v1/profile/business', BusinessProfileRouter);
};
