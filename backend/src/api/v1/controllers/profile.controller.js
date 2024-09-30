/* eslint-disable no-unused-vars */
const APIError = require('../errors/APIError');
const { UserError } = require('../errors/UserError');
const { NormalUser, UserAuth } = require('../models');
const {
  getNormalUserById,
  updateNormalUserProfileImage,
  fetchNormalUsers,
  updateNormalUserProfile,
} = require('../services/normalUserTable');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');
const { getPaginationParameters } = require('../util/pagination');
const {
  validateNormalUser,
  validateNormalUserUpdate,
} = require('../validations/normaluser.validation');

/**
 * @swagger
 * /api/v1/profile/normal{id}:
 *   get:
 *     summary: Get normal user details
 *     description: Retrieve details of a normal user by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the normal user
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Successful operation
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/NormalUser'
 *       404:
 *         description: Normal user not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *     tags:
 *       - Profile
 */
async function getNormalUser(req, res) {
  const { id } = req.params;

  const user = await getNormalUserById(id);

  if (!user) {
    return res.status(404).json({ error: 'Normal user not found' });
  } else {
    return res.json(user);
  }
}

async function getAuthenticatedUser(req, res) {
  const userId = req.user.id;

  const user = await getNormalUserById(userId);
  return res.json(user);
}

async function getNormalUsers(req, res) {
  const { page, limit } = getPaginationParameters(req);

  const users = await fetchNormalUsers(page, limit);
  return res.json(users);
}

async function deleteNormalUser(req, res) {
  const id = req.user.id;
  const normalUser = await NormalUser.findByPk(id);
  await normalUser.destroy();

  if (!normalUser) {
    return res.status(404).json({ error: 'Normal user not found' });
  } else {
    return res.status(200).json({ msg: 'successfully deleted' });
  }
}

async function updateNormalUserImage(req, res) {
  const id = req.user.id;
  const normalUser = await NormalUser.findByPk(id);

  if (!normalUser) {
    return res.status(404).json({ error: 'Normal user not found' });
  }

  if (!req.file) {
    throw new APIError('No file uploaded', 400);
  }

  const profileImageUrl = await uploadFileToBlob(req.file);
  // update the normal user profile
  const result = await updateNormalUserProfileImage(id, profileImageUrl);
  return res.json({ imageUrl: profileImageUrl });
}

async function updateNormalUserProfileHandler(req, res) {
  // first validate the request body
  const { error } = validateNormalUserUpdate(req.body);
  if (error) {
    throw new UserError(error.details[0].message, 400);
  }

  const id = req.user.id;

  // update the normal user
  await updateNormalUserProfile(id, req.body);
}

module.exports = {
  getAuthenticatedUser,
  getNormalUser,
  getNormalUsers,
  deleteNormalUser,
  updateNormalUserImage,
  updateNormalUserProfileHandler,
};
