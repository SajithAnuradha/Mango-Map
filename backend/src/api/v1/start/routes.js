const RegisterRouter = require('../routes/register.routes');
const ChatRouter = require('../routes/chat.routes');

module.exports = (app) => {
  app.use('/api/v1/register', RegisterRouter);

  app.use('/api/v1/chat', ChatRouter);
};
