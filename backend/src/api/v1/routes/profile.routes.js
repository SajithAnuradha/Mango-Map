const express = require('express');
const multer = require('multer');
const {
  getNormalUsers,
  deleteNormalUser,
  updateNormalUserImage,
  getNormalUser,
  getAuthenticatedUser,
  updateNormalUserProfileHandler,
} = require('../controllers/profile.controller');
const { authorize } = require('../middlewares/auth');

const router = express.Router();
const fileUpload = multer();

router.get('/me', authorize, getAuthenticatedUser);
router.delete('/me', authorize, deleteNormalUser);
router.put(
  '/me/image',
  authorize,
  fileUpload.single('file'),
  updateNormalUserImage
);
router.put('/me', authorize, updateNormalUserProfileHandler);
router.get('/:id', authorize, getNormalUser);
router.get('/', authorize, getNormalUsers);

module.exports = router;
