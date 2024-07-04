const express = require('express');
const {
  registerNormalUser,
  registerBusinessUser,
} = require('../controllers/register.controller');

const router = express.Router();

// define the routes related to the register feature
router.post('/normal', registerNormalUser);
router.post('/business', registerBusinessUser);

module.exports = router;
