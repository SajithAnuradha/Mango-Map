const RegisterRouter = require('../routes/register.routes');
const BusinessProfileRouter = require('../routes/businessProfile.route');
const NotificationRouter = require('../routes/notification.route');
const LocationRouter = require('../routes/location.route');


module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/businessProfile', BusinessProfileRouter);
  app.use('/api/v1/notification',NotificationRouter);
  app.use('/api/v1/location',LocationRouter);
};
