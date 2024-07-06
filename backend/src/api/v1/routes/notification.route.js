const express = require('express');
const {
  NotificationHandler,NotificationDeleteHandler
} = require('../controllers/notification.controller');

const router = express.Router();

// define the routes related to the notification feature
router.get('/notification', NotificationHandler);
router.post('/notification', NotificationDeleteHandler);

module.exports = router;
