const express = require('express');
const {
  postPromotionUserHandler,
} = require('../controllers/promotion.controller');

const router = express.Router();

// define the routes related to the promotion feature
router.post('/', postPromotionUserHandler);

module.exports = router;
