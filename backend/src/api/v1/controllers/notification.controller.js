const {getNotification,deleteNotification} = require('../services/notificationTable');

/**
 * @swagger
  * /api/v1/notification:
 *   get:
 *     summary: Get a notification
 *     description: Get a notification with the provided id
 *     tags:
 *       - Notification
 *     parameters:
 *       - in: query
 *         name: notification_id
 *         schema:
 *           type: integer
 *         required: true
 *         description: The id of the notification to get
 *     responses:
 *       200:
 *         description: Successful get
 *         content:
 *           application/json:
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 * /api/v1/notification:
 *   post:
 *     summary: Delete a notification
 *     description: Delete a notification with the provided id
 *     tags:
 *       - Notification
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               notification_id:
 *                 type: integer
 *     responses:
 *       200:
 *         description: Successful delete
 *         content:
 *           application/json:
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 */


async function NotificationHandler(req, res) {
    try {
        const notification = await getNotification(req.query.id);
        if (!notification) {
            return res.status(400).json({ error: 'Notification not found' });
        }
        res.json(notification);
    } catch (error) {
        res.status(500).json({ error: 'An error occurred' });
    }
}

async function NotificationDeleteHandler(req, res) {

    if (!req.query.id) {
        return res.status(400).json({ error: 'Notification ID is not provided' });
    }

    try {
        await deleteNotification(req.query.id);
        res.json({ message: 'Notification deleted' });
    } catch (error) {
        res.status(500).json({ error: 'An error occurred' });
    }
}

module.exports = {
    NotificationHandler,
    NotificationDeleteHandler,
};