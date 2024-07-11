const express = require('express');
const {uploadimages, getimages, getTrendingImages, getimage, deleteimage, likeimage, unlikeimage,alltrendingimages } = require('../controllers/location.controller');
const router = express.Router();
const multer = require('multer');
const fileUpload = multer();




// uploading images
router.post('/', fileUpload.single('file'),uploadimages);

//get images
router.get('/',getimages );
//get trending images
router.get('/trending',getTrendingImages);

router.get('/alltrending',alltrendingimages)
//get images by id
router.get('/:id',getimage );

//delete images by id
router.delete('/:id',deleteimage);

//like images by id
router.post('/:id/like',likeimage);

//remove like from images by id
router.delete('/:id/unlike',unlikeimage);



module.exports = router;
