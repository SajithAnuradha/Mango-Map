const express = require('express');
const multer = require('multer');
const {
  getBusinessProfileHandler,
  getBusinessProfileByIdHandler,
  businessProfileUpdateHandler,
  businessProfileDeleteHandler,
  getBusinessProfileQRCodeHandler,
  getBusinessAnnoucementHandler,
  getAnnoucementByIdHandler,
  createAnnoucementHandler,
  addBusinessProfileImageHandler,
} = require('../controllers/businessprofile.controller');
const router = express.Router();

const fileUpload = multer();

router.get('/', getBusinessProfileHandler);
router.get('/:id/qr', getBusinessProfileQRCodeHandler);
router.post('/:id/announcements', createAnnoucementHandler);
router.get('/:id/announcements', getBusinessAnnoucementHandler);
router.get('/:id/announcements/:annoucement_id', getAnnoucementByIdHandler);
router.put(
  '/:id/image',
  fileUpload.single('file'),
  addBusinessProfileImageHandler
);
router.get('/:id', getBusinessProfileByIdHandler);
router.put('/:id', businessProfileUpdateHandler);
router.delete('/:id', businessProfileDeleteHandler);

module.exports = router;
