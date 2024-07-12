const Joi = require('joi');

function validateAnnoucementCreateBody(data) {
  const schema = Joi.object({
    title: Joi.string().min(3).max(255).required(),
    description: Joi.string().min(3).max(255).required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateAnnoucementCreateBody,
};
