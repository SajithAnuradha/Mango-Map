const { businessMessage } = require('../services/businessChatTable');
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
async function businessMessageHandler(req, res) {
  // parse the body of the request through the validation
  const { error } = validateBusinessChat(req.body);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }

  // parse the request body data to register the normal user
  const businessChat = await businessMessage(req.body);

  // return the normal user id as the response
  res.json({ id: normalUser.id });
}

module.exports = {
  businessMessageHandler,
};
