const Joi = require('joi');

function validateBusinessReview(data) {
  const schema = Joi.object({
    profile_id: Joi.number().required(),
    user_id: Joi.number().required(),
    content: Joi.string().max(1024),
    rating: Joi.number().integer().min(0).max(5),
    photos: Joi.array().items({
      file: Joi.string().required(),
    }),
  });

  return schema.validate(data);
}

function validateUpdateReviewsBody(data) {
  const schema = Joi.object({
    content: Joi.string().max(1024),
    rating: Joi.number().integer().min(0).max(5),
  });

  return schema.validate(data);
}

module.exports = {
  validateBusinessReview,
  validateUpdateReviewsBody,
};
