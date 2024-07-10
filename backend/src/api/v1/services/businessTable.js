const {
  NormalUser,
  BusinessReview,
  BusinessPhoto,
  BusinessPhotoLike,
} = require('../models/index');

async function getBusinessReviews(businessId, page, limit) {
  // get the reviews from the database with their images
  const reviews = await BusinessReview.findAll({
    where: {
      profile_id: businessId,
    },
    include: [
      {
        model: BusinessPhoto,
        attributes: ['id', 'photo'],
      },
    ],
    offset: (page - 1) * limit,
    limit,
  });

  return reviews;
}

async function getBusinessReviewById(reviewId, likeCount = false) {
  // get the review from the database including like counts of each photo
  // get the review from the database with its images
  const review = await BusinessReview.findOne({
    where: {
      id: reviewId,
    },
    include: [
      {
        model: BusinessPhoto,
        attributes: ['id', 'photo'],
      },
    ],
  });

  if (likeCount) {
    // get the like count for each photo
    for (let i = 0; i < review.BusinessPhotos.length; i++) {
      const photo = review.BusinessPhotos[i];
      const likeCount = await BusinessPhotoLike.count({
        where: {
          photo_id: photo.id,
        },
      });
      photo.setDataValue('likes', likeCount);
    }
  }

  return review;
}

async function getBusinessPhotoLikes(photo_id, page, limit) {
  const likes = await BusinessPhotoLike.findAll({
    where: {
      photo_id: photo_id,
    },
    include: [
      {
        model: NormalUser,
        attributes: ['id', 'first_name', 'last_name'],
      },
    ],
    offset: (page - 1) * limit,
    limit,
  });

  return likes;
}

/*
    This function likes a business photo in the database.
*/
async function likeBusinessPhoto(photo_id, user_id) {
  const businessPhotoLike = await BusinessPhotoLike.create({
    photo_id: photo_id,
    user_id: user_id,
  });

  return businessPhotoLike;
}

async function unlikeBusinessPhoto(photo_id, user_id) {
  const businessPhotoLike = await BusinessPhotoLike.destroy({
    where: {
      photo_id: photo_id,
      user_id: user_id,
    },
  });

  return businessPhotoLike;
}

async function updateBusinessReview(review_id, data) {
  const review = await BusinessReview.update(
    {
      content: data.content,
      rating: data.rating,
    },
    {
      where: {
        id: review_id,
      },
    }
  );

  return review;
}

async function deleteBusinessReview(review_id) {
  const review = await BusinessReview.destroy({
    where: {
      id: review_id,
    },
  });

  return review;
}

async function deleteBusinessPhoto(photo_id) {
  const photo = await BusinessPhoto.destroy({
    where: {
      id: photo_id,
    },
  });

  return photo;
}

async function photoExists(photo_id) {
  const photoCount = await BusinessPhoto.count({
    where: {
      id: photo_id,
    },
  });

  return photoCount > 0;
}

async function likeExists(photo_id, user_id) {
  const likeCount = await BusinessPhotoLike.count({
    where: {
      photo_id: photo_id,
      user_id: user_id,
    },
  });

  return likeCount > 0;
}
async function reviewExists(review_id) {
  const reviewCount = await BusinessReview.count({
    where: {
      id: review_id,
    },
  });

  return reviewCount > 0;
}

module.exports = {
  getBusinessReviews,
  getBusinessReviewById,
  getBusinessPhotoLikes,
  likeBusinessPhoto,
  unlikeBusinessPhoto,
  updateBusinessReview,
  deleteBusinessReview,
  deleteBusinessPhoto,
  photoExists,
  likeExists,
  reviewExists,
};
