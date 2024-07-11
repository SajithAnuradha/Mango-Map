const express = require('express');
const {
  getNormalUserDetails,
  deleteNormalUser,
  updateNormalUserImage,
} = require('../controllers/profile.controller');

const router = express.Router();

router.get('/normal/:id', getNormalUserDetails);
router.get('/normal/:id/delete', deleteNormalUser);
router.put('/normal/:id/updatenormaluserimage', updateNormalUserImage);

module.exports = router;
