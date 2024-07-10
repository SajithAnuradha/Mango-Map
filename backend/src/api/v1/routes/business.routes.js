const express = require('express');
const {
  getBusinessReviewsHandler,
  getBusinessReviewByIdHandler,
  likeBusinessPhotoHandler,
  unlikeBusinessPhotoHandler,
  businessReviewUpdateHandler,
  businessReviewDeleteHandler,
  businessPhotoDeleteHandler,
  getBusinessPhotoLikesHandler,
} = require('../controllers/business.controller');
const router = express.Router();

router.get('/:id/reviews', getBusinessReviewsHandler);
router.get('/:id/reviews/:review_id', getBusinessReviewByIdHandler);
router.get('/:id/photos/:photo_id/likes', getBusinessPhotoLikesHandler);
router.post('/:id/photos/:photo_id/like', likeBusinessPhotoHandler);
router.delete('/:id/photos/:photo_id/like', unlikeBusinessPhotoHandler);
router.put('/:id/reviews/:review_id', businessReviewUpdateHandler);
router.delete('/:id/reviews/:review_id', businessReviewDeleteHandler);
router.delete('/:id/photos/:photo_id', businessPhotoDeleteHandler);

module.exports = router;
