const APIError = require('../errors/APIError');
const UserError = require('../errors/UserError');
const BusinessError = require('../errors/BusinessError');
const {
  getBusinessReviews,
  getBusinessReviewById,
  photoExists,
  likeBusinessPhoto,
  likeExists,
  unlikeBusinessPhoto,
  reviewExists,
  updateBusinessReview,
  deleteBusinessReview,
  deleteBusinessPhoto,
  getBusinessPhotoLikes,
} = require('../services/businessTable');
const { userExists } = require('../services/normalUserTable');
const { getPaginationParameters } = require('../util/pagination');
const {
  validateUpdateReviewsBody,
} = require('../validations/review.validation');

async function getBusinessReviewsHandler(req, res) {
  // get the business id from the request parameter
  const { id } = req.params;
  const businessId = parseInt(id) || -1;
  if (businessId === -1) {
    throw new APIError('Invalid business id', 400);
  }

  // pagination parameters
  const { page, limit } = getPaginationParameters(req);

  // get the reviews from the database
  const reviews = await getBusinessReviews(businessId, page, limit);

  return res.json(reviews);
}

async function getBusinessReviewByIdHandler(req, res) {
  // get the business id and review id from the request parameter
  const { id, review_id } = req.params;
  const businessId = parseInt(id) || -1;
  const reviewId = parseInt(review_id) || -1;

  if (businessId === -1 || reviewId === -1) {
    throw new APIError('Invalid business or review id', 400);
  }
  const likeCount = req.query.likes ? req.query.likes === 'true' : false;

  // get the review from the database
  const review = await getBusinessReviewById(reviewId, likeCount);
  return res.json(review);
}

async function getBusinessPhotoLikesHandler(req, res) {
  // get the business id and review id from the request parameter
  const { id, photo_id } = req.params;
  const businessId = parseInt(id) || -1;
  const photoId = parseInt(photo_id) || -1;

  if (businessId === -1 || photoId === -1) {
    throw new APIError('Invalid business or photo id', 400);
  }

  const { page, limit } = getPaginationParameters(req);

  const photoExists_ = await photoExists(photoId);
  if (!photoExists_) {
    throw new BusinessError('Photo does not exist with ID: ' + photoId, 404);
  }

  // get the like count for the photo
  const likes = await getBusinessPhotoLikes(photoId, page, limit);
  return res.json(likes);
}

/*
    This function likes a business photo in the database.
    */
async function likeBusinessPhotoHandler(req, res) {
  const { id, photo_id } = req.params;
  const businessId = parseInt(id) || -1;
  const photoId = parseInt(photo_id) || -1;

  if (businessId === -1 || photoId === -1) {
    throw new APIError('Invalid business or photo id', 400);
  }

  // get the user id through the body
  let { userId } = req.body;
  userId = parseInt(userId) || -1;
  if (userId === -1) {
    throw new APIError('User ID is required', 400);
  }

  const userExists_ = await userExists(userId);
  if (!userExists_) {
    throw new UserError('User does not exist with ID: ' + userId, 404);
  }

  const photoExists_ = await photoExists(photoId);
  if (!photoExists_) {
    throw new BusinessError('Photo does not exist with ID: ' + photoId, 404);
  }

  // now like the photo
  const like = await likeBusinessPhoto(photoId, userId);
  return res.json(like);
}

/* 
    This function unlikes a business photo in the database.
    */
async function unlikeBusinessPhotoHandler(req, res) {
  const { id, photo_id } = req.params;
  const businessId = parseInt(id) || -1;
  const photoId = parseInt(photo_id) || -1;

  if (businessId === -1 || photoId === -1) {
    throw new APIError('Invalid business or photo id', 400);
  }

  // get the user id through the body
  let { userId } = req.body;
  userId = parseInt(userId) || -1;
  if (userId === -1) {
    throw new APIError('User ID is required', 400);
  }

  // check whether given like is exists or not
  const likeExists_ = await likeExists(photoId, userId);
  if (!likeExists_) {
    throw new BusinessError('Like does not exist', 404);
  }

  // now unlike the photo
  const unlike = await unlikeBusinessPhoto(photoId, userId);
  return res.json({ count: unlike });
}

async function businessReviewUpdateHandler(req, res) {
  const { error } = validateUpdateReviewsBody(req.body);
  if (error) {
    throw new APIError(error.details[0].message, 400);
  }

  const { id, review_id } = req.params;
  const businessId = parseInt(id) || -1;
  const reviewId = parseInt(review_id) || -1;
  if (businessId === -1 || reviewId === -1) {
    throw new APIError('Invalid business or review id', 400);
  }

  // check whether the review exists or not
  const reviewExists_ = await reviewExists(reviewId);
  if (!reviewExists_) {
    throw new BusinessError('Review does not exist with ID: ' + reviewId, 404);
  }

  // update the review
  const review = await updateBusinessReview(reviewId, req.body);
  return res.json(review);
}

async function businessReviewDeleteHandler(req, res) {
  // get the business id from the request parameter
  const { id, review_id } = req.params;
  const businessId = parseInt(id) || -1;
  const reviewId = parseInt(review_id) || -1;
  if (businessId === -1 || reviewId === -1) {
    throw new APIError('Invalid business or review id', 400);
  }

  //   check whether the review exists or not
  const reviewExists_ = await reviewExists(reviewId);
  if (!reviewExists_) {
    throw new BusinessError('Review does not exist with ID: ' + reviewId, 404);
  }

  // update the review
  const review = await deleteBusinessReview(reviewId);
  return res.json({ count: review });
}

async function businessPhotoDeleteHandler(req, res) {
  // get the business id and photo id from the request parameter
  const { id, photo_id } = req.params;
  const businessId = parseInt(id) || -1;
  const photoId = parseInt(photo_id) || -1;
  if (businessId === -1 || photoId === -1) {
    throw new APIError('Invalid business or photo id', 400);
  }

  // check whether the photo exists or not
  const photoExists_ = await photoExists(photoId);
  if (!photoExists_) {
    throw new BusinessError('Photo does not exist with ID: ' + photoId, 404);
  }

  // delete the photo
  const photo = await deleteBusinessPhoto(photoId);
  return res.json({ count: photo });
}

module.exports = {
  getBusinessReviewsHandler,
  getBusinessReviewByIdHandler,
  getBusinessPhotoLikesHandler,
  likeBusinessPhotoHandler,
  unlikeBusinessPhotoHandler,
  businessReviewUpdateHandler,
  businessReviewDeleteHandler,
  businessPhotoDeleteHandler,
};
