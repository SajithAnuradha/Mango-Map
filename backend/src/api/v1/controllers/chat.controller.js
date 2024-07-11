const {
  createBusinessChat,
  postBusinessMessage,
  deleteBusinessMessage,
  getBusinessMessage,
  replychat,
  getChatDetails,
} = require('../services/businessChatTable');
const {
  validateBusinessChat,
} = require('../validations/businessChat.validation');

/**
 * @swagger
 * /api/v1/chat/id:
 *   post:
 *     summary: Post Business Chat
 *     description: Post a new Business Chat with the provided details
 *     tags:
 *       - Business chat
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *     responses:
 *       200:
 *         description: Successful chat
 *         content:
 *           application/json:
 *
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *
 */

async function postbusinessMessageHandler(req, res) {
  const { profileId, message, userId } = req.body;
  try {
    const newChat = await postBusinessMessage(profileId, message, userId);
    return res.status(201).json({
      message: 'Business chat created successfully',
      data: newChat,
    });
  } catch (error) {
    res
      .status(400)
      .json({ error: 'userId, profileId, and message are required' });
  }
}

async function deletebusinessMessageHandler(req, res) {
  const { userId, chatId } = req.body;
  try {
    const chat = await deleteBusinessMessage(userId, chatId);
    if (!chat) {
      res.status(400).json({ error: 'userId, chatId Invalid' });
    }
    res.status(200).json({ message: 'successfully deleting process', data: chat });
  } catch (error) {
    res.status(400).json({ error: 'userId, chatId are required' });
  }
}

async function replybusinessMessageHandler(req, res) {
  const { profileId, message, userId, chatId } = req.body;
  try {
    const newChat = await postBusinessMessage(profileId, message, userId);

    const reply = replychat(chatId, newChat.id);

    if (!reply) {
      res.status(400).json({ error: 'userId, chatId Invalid' });
    }
    res.status(200).json({ message: 'successfull add process', data: reply });
  } catch (error) {
    res.status(400).json({ error: error });
  }
}

async function getbusinessMessageHandler(req, res) {
  const { profileId } = req.body;
  try {
    const getChat = await getBusinessMessage(profileId);
    if (!getChat) {
      res.status(400).json({ error: 'profileId is Invalid' });
    }
    res.status(200).json({ message: 'successfully fetched', data: getChat });
  } catch (error) {
    res.status(400).json({ error: 'profileId is required' });
  }
}

module.exports = {
  postbusinessMessageHandler,
  deletebusinessMessageHandler,
  replybusinessMessageHandler,
  getbusinessMessageHandler,
};
