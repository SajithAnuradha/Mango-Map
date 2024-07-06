const { BusinessChat } = require('../models');

async function businessMessage(data, id) {
  // then create a new business chat
  const newBusinessChat = await BusinessChat.create({
    profile_id: id,
    message: data.message,
    user_id: data.userId,
  });

  return newBusinessChat;
}

module.exports = {
  businessMessage,
};