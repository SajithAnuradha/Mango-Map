const express = require('express');
const {
  getBusinessProfileHandler,
  getBusinessProfileByIdHandler,
  businessProfileUpdateHandler,
  businessProfileDeleteHandler,
  getBusinessProfileQRCodeHandler,
  getBusinessAnnoucementHandler,
  getAnnoucementByIdHandler,
  createAnnoucementHandler,
} = require('../controllers/businessprofile.controller');
const router = express.Router();

router.get('/', getBusinessProfileHandler);
router.get('/:id/qr', getBusinessProfileQRCodeHandler);
router.post('/:id/announcements', createAnnoucementHandler);
router.get('/:id/announcements', getBusinessAnnoucementHandler);
router.get('/:id/announcements/:annoucement_id', getAnnoucementByIdHandler);
router.get('/:id', getBusinessProfileByIdHandler);
router.put('/:id', businessProfileUpdateHandler);
router.delete('/:id', businessProfileDeleteHandler);

module.exports = router;
