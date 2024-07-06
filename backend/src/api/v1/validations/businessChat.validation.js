const Joi = require('joi');

function validateBusinessChat(data) {
  const schema = Joi.object({
    message: Joi.string().required(),
    userId: Joi.number().required(),
    profileId: Joi.number().required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateBusinessChat,
};
