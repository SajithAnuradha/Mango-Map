const { BusinessChat } = require('../models');

async function postBusinessMessage(profileId, message, userId) {
  const newBusinessChat = await BusinessChat.create({
    profile_id: profileId,
    message: message,
    user_id: userId,
  });

  return newBusinessChat;
}

async function deleteBusinessMessage(UserId, chatId) {
  const chat = await BusinessChat.findByPk(chatId);
  
  if (chat.user_id == UserId) {
    if (chat.reply_id) {
      const replyChat = await BusinessChat.findByPk(chat.reply_id);
      await replyChat.destroy();
    }
    await chat.destroy();
    const chatMessage = chat.message;
    const replyMessage = chat.message;
    return {
      success: true,
      message: 'Chat and its replys deleted successfully',
      chatMessage,
      replyMessage,
    };
  } else {
    return false;
  }
}

async function replychat(previouschatId, newchatId) {
  const previousChat = await BusinessChat.findByPk(previouschatId);
  console.log('previousChat', previousChat);
  // update the previouschat
  if (!previousChat) {
    return { error: 'Previous chat not found', status: 404 };
  }

  // Update the previous chat's 'replyTo' field or any other necessary fields
  await previousChat.update({ reply_id: newchatId });
  return previousChat;
}

async function getBusinessMessage(profileId) {
  // Fetch all chat messages associated with the given profileId
  const businessChats = await BusinessChat.findAll({
    where: {
      profile_id: profileId,
    },
  });

  console.log('length', businessChats.length);
  if (businessChats.length === 0) {
    return false;
  } else {
    return businessChats;
  }
}

module.exports = {
  postBusinessMessage,
  deleteBusinessMessage,
  getBusinessMessage,
  replychat,
};
