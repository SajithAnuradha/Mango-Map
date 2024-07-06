const express = require('express');
const {LocationHandler} = require('../controllers/location.controller');

const router = express.Router();

router.get('/location', LocationHandler);

module.exports = router;
