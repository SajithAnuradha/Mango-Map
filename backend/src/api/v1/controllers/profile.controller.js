/* eslint-disable no-unused-vars */
const APIError = require('../errors/APIError');
const { NormalUser, UserAuth } = require('../models');
const {
  getNormalUserById,
  updateNormalUserProfileImage,
  getNormalUsers,
  updateNormalUserProfile,
} = require('../services/normalUserTable');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');
const { getPaginationParameters } = require('../util/pagination');
const { validateNormalUser } = require('../validations/normaluser.validation');

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
async function getNormalUserDetails(req, res) {
  const { id } = req.params;

  const user = await getNormalUserById(id);

  if (!user) {
    return res.status(404).json({ error: 'Normal user not found' });
  } else {
    return res.json(user);
  }
}

async function getNormalUserProfiles(req, res) {
  const { page, limit } = getPaginationParameters(req);

  const users = await getNormalUsers(page, limit);
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
  const { error } = validateNormalUser(req.body);
  if (error) {
    throw new APIError(error.details[0].message, 400);
  }

  const id = req.user.id;

  // update the normal user
  await updateNormalUserProfile(id, req.body);
}

module.exports = {
  getNormalUserDetails,
  getNormalUserProfiles,
  deleteNormalUser,
  updateNormalUserImage,
  updateNormalUserProfileHandler,
};
