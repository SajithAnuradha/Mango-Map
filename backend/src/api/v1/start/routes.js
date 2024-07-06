const RegisterRouter = require('../routes/register.routes');
const PromotionRouter = require('../routes/promotion.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);
  app.use('/api/v1/promotion', PromotionRouter);
};
