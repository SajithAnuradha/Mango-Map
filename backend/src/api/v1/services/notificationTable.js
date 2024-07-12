const {Notification} = require('../models');

async function getNotification (notification_id){

    const newNotification = await Notification.findOne({
        where: {
            id: notification_id,
        },
    });

    return newNotification;

}

async function deleteNotification(notification_id) {
    try {
        await Notification.destroy({
            where: {
                id: notification_id,
            },
        });
    } catch (error) {
        throw new Error('Error deleting notification');
    }
}

module.exports = {
    getNotification,
    deleteNotification
};