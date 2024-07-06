const express = require('express');
const {
  BusinessProfileHandler
} = require('../controllers/businessProfile.controller');

const router = express.Router();

// define the routes related to the business profile feature
router.get('/businessProfile', BusinessProfileHandler);

module.exports = router;