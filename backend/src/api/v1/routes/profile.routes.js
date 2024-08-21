const express = require('express');
const multer = require('multer');
const {
  getNormalUserDetails,
  deleteNormalUser,
  updateNormalUserImage,
  getNormalUserProfiles,
  updateNormalUserProfileHandler,
} = require('../controllers/profile.controller');
const { authorize } = require('../middlewares/auth');

const router = express.Router();
const fileUpload = multer();

router.get('/:id', getNormalUserDetails);
router.get('/', getNormalUserProfiles);
router.delete('/', authorize, deleteNormalUser);
router.put(
  '/image',
  authorize,
  fileUpload.single('file'),
  updateNormalUserImage
);
router.put('/', authorize, updateNormalUserProfileHandler);

module.exports = router;
