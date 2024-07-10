const express = require('express');
const {
  NotificationHandler,NotificationDeleteHandler
} = require('../controllers/notification.controller');

const router = express.Router();

// define the routes related to the notification feature
router.get('/get_notification', NotificationHandler);
router.delete('/delete_notification', NotificationDeleteHandler);

module.exports = router;
