const Joi = require('joi');

function validateNormalUser(data) {
  const schema = Joi.object({
    firstName: Joi.string().max(50).required(),
    lastName: Joi.string().max(50).required(),
    username: Joi.string().max(255).required(),
    password: Joi.string().max(50).required(),
    email: Joi.string().email().required(),
    birthday: Joi.date().max('now').required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateNormalUser,
};
