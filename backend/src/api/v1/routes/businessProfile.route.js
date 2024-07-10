const express = require('express');
const {
  BusinessProfileHandler
} = require('../controllers/bussinessProfile.controller');

const router = express.Router();

// define the routes related to the business profile feature
router.get('/', BusinessProfileHandler);

module.exports = router;