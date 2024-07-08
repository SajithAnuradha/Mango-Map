const RegisterRouter = require('../routes/register.routes');
const LocationRouter=require('../routes/location.routes')

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/location',LocationRouter)
};


