const express = require('express');
const {
  postbusinessMessageHandler,
  deletebusinessMessageHandler,
  replybusinessMessageHandler,
  getbusinessMessageHandler,
} = require('../controllers/chat.controller');

const router = express.Router();

// define the routes related to the chat feature
router.post('/:id', postbusinessMessageHandler);
router.delete('/:id', deletebusinessMessageHandler);
router.post('/reply/:id', replybusinessMessageHandler);
router.get('/:id', getbusinessMessageHandler);

module.exports = router;
