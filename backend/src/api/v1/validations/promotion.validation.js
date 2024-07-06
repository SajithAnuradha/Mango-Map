const Joi = require('joi');

function validatePromotion(data) {
  const schema = Joi.object({
    title: Joi.string().max(255).required(),
    description: Joi.string().max(255).required(),
  });

  return schema.validate(data);
}

module.exports = {
  validatePromotion,
};
