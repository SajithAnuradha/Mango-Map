const express = require('express');
const { businessMessageHandler } = require('../controllers/chat.controller');

const router = express.Router();

// define the routes related to the chat feature
router.post('/', businessMessageHandler);
router.delete('/', businessMessageHandler);
router.post('/', businessMessageHandler);
router.get('/', businessMessageHandler);

module.exports = router;
