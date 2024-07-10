const express = require('express');
const {
  businessMessageHandler,
} = require('../controllers/chat.controller');

const router = express.Router();

// define the routes related to the chat feature
router.post('/:id', businessMessageHandler);
router.delete('/:id/message/:user_id', businessMessageHandler);
router.post('/:id/message/:user_id', businessMessageHandler);
router.get('/:id', businessMessageHandler);

module.exports = router;
