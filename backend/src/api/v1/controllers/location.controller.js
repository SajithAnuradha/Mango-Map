const { LocationBasedImage } = require('../models');
const { LocationBasedImageLike } = require('../models');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');
const { getLocation } = require('../services/locationTable');

/**
 * @swagger
 * /api/v1/location:
 *  get:
 *   summary: Get a location
 *  description: Get a location with the provided id
 * tags:
 *  - Location
 * parameters:
 * - in: query
 *  name: location_id
 * schema:
 * type: integer
 * required: true
 * description: The id of the location to get
 * responses:
 * 200:
 * description: Successful get
 * content:
 * application/json:
 * 400:
 * description: Bad request
 * content:
 * application/json:
 */

async function LocationHandler(req, res) {
  try {
    // const { location, locationBasedImages } = await getLocation(req.query.location_id);
    const location = await getLocation(req.query.id);
    if (!location) {
      return res.status(400).json({ error: 'Location not found' });
    }
    // res.json({ location, locationBasedImages });
    res.json(location);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
}

//This is working
async function getimages(req, res) {
  try {
    const images = await LocationBasedImage.findAll();
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.log(error);
  }
}

//have to check
async function uploadimages(req, res) {
  console.log(req.body);
  try {
    const { file, location_id, user_id, review } = req.body;
    console.log(location_id);
    const url = await uploadFileToBlob(file);
    const image = await LocationBasedImage.create({
      photo: url,
      location_id: location_id,
      user_id: user_id,
      review: review,
    });
    res.status(201).json(image);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

async function getTrendingImages(req, res) {
  try {
    const { location_id } = req.body;
    // Fetch all images for the given location_id
    const images = await LocationBasedImage.findAll({
      where: { location_id },
      include: [
        {
          model: LocationBasedImageLike,
          attributes: ['id'],
        },
      ],
    });
    // Calculate the number of likes for each image
    const imagesWithLikeCount = images.map((image) => ({
      ...image.toJSON(),
      likeCount: image.LocationBasedImageLikes.length,
    }));

    // Sort images by likeCount in descending order
    imagesWithLikeCount.sort((a, b) => b.likeCount - a.likeCount);

    res.status(200).json(imagesWithLikeCount);
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.error(error);
  }
}

async function getimage(req, res) {
  try {
    const { id } = req.params;
    const image = await LocationBasedImage.findByPk(id);
    if (!image) {
      res.status(404).json({ error: 'Image not found' });
    }
    res.status(200).json(image);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

async function deleteimage(req, res) {
  try {
    const { id } = req.params;
    const image = await LocationBasedImage.findByPk(id);
    if (!image) {
      res.status(404).json({ error: 'Image not found' });
    }
    await image.destroy();
    res.status(204).json();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

async function likeimage(req, res) {
  try {
    const { image_id, user_id } = req.body;
    if (!image_id || !user_id) {
      res.status(400).json({ error: 'Missing required fields' });
    }
    const like = await LocationBasedImageLike.create({ image_id, user_id });
    res.status(201).json(like);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

async function unlikeimage(req, res) {
  try {
    const { image_id, user_id } = req.body;
    if (!image_id || !user_id) {
      res.status(400).json({ error: 'Missing required fields' });
    }
    const like = await LocationBasedImageLike.findOne({
      where: { image_id, user_id },
    });
    if (!like) {
      res.status(404).json({ error: 'Like not found' });
    }
    await like.destroy();
    res.status(204).json();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

module.exports = {
  LocationHandler,
  uploadimages,
  getimages,
  getTrendingImages,
  getimage,
  deleteimage,
  likeimage,
  unlikeimage,
};
