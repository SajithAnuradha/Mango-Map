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
  try {
    const chat = await BusinessChat.findByPk(chatId);

    if (!chat) {
      return { success: false, message: 'Chat not found' };
    }

    if (chat.user_id != UserId) {
      return {
        success: false,
        message: 'Unauthorized: User ID does not match',
      };
    }

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
  } catch {
    return false;
  }
}

async function replychat(previouschatId, newchatId) {
  const previousChat = await BusinessChat.findByPk(previouschatId);

  if (!previousChat) {
    return { success: false, message: 'Previous chat not found' };
  }
  console.log('DDFDF');
  // Update the previous chat's 'reply_id' field with the new chat ID
  await previousChat.update({ reply_id: newchatId });

  return {
    success: true,
    message: 'Reply chat linked successfully',
    updatedChat: previousChat,
  };
}

async function getBusinessMessage(profileId) {
  // Fetch all chat messages associated with the given profileId
  const businessChats = await BusinessChat.findAll({
    where: {
      profile_id: profileId,
    },
  });

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
