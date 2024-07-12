const Joi = require('joi');

function validateBusinessUser(data) {
  const schema = Joi.object({
    businessName: Joi.string().max(255).required(),
    password: Joi.string().max(50).required(),
    description: Joi.string().max(255).required(),
    email: Joi.string().email().required(),
    longitude: Joi.number().max(10),
    latitude: Joi.number().max(10),
    placeId: Joi.number().max(10),
    address: Joi.string().max(255),
    city: Joi.string().max(50),
    state: Joi.string().max(50),
    counrty: Joi.string().max(30),
    postalCode: Joi.number().max(10),
    additionalInfo: Joi.string().max(255),
  });

  return schema.validate(data);
}

function validateLoginBody(data) {
  const schema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().max(50).required(),
  });

  return schema.validate(data);
}

function validatePasswordChangeBody(data) {
  const schema = Joi.object({
    email: Joi.string().email().required(),
    oldPassword: Joi.string().max(50).required(),
    newPassword: Joi.string().max(50).required(),
  });

  return schema.validate(data);
}

module.exports = {
  validateBusinessUser,
  validateLoginBody,
  validatePasswordChangeBody,
};
