const Joi = require('joi');

function validateBusinessChat(data) {
  const schema = Joi.object({
    message: Joi.string().required(),
    senderId: Joi.number().required(),
    receiverId: Joi.number().required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateBusinessChat,
};
