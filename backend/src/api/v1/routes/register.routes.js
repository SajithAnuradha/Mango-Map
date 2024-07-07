const express = require('express');
const {
  registerNormalUserHandler,
  registerBusinessUserHandler,
} = require('../controllers/register.controller');

const router = express.Router();

// define the routes related to the register feature
router.post('/normal', registerNormalUserHandler);
router.post('/business', registerBusinessUserHandler);

module.exports = router;
