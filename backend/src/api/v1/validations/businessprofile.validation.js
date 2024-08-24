const Joi = require('joi');

function validateBusinessProfileUpdateBody(data) {
  const schema = Joi.object({
    profile_name: Joi.string().min(3).max(255).required(),
    description: Joi.string().min(3).max(255).required(),
    location_id: Joi.number().integer().required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateBusinessProfileUpdateBody,
};
