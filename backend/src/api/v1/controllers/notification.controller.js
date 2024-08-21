const {getNotification,deleteNotification} = require('../services/notificationTable');

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