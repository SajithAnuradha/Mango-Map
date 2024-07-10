const Joi = require('joi');

function validatePromotion(data) {
  const schema = Joi.object({
    user_id: Joi.string().max(255).required(),
    username: Joi.string().max(255).required(),
    title: Joi.string().max(255).required(),
    description: Joi.string().max(255).required(),
  });

  return schema.validate(data);
}

module.exports = {
  validatePromotion,
};
