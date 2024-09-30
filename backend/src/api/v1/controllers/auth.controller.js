const { changeUserPassword } = require('../services/changeUserPassword');
const { userValidation } = require('../services/userValidation');
const {
  validateLoginBody,
  validatePasswordChangeBody,
} = require('../validations/businessuser.validation');
const UserError = require('../errors/UserError');
const { comparePassword } = require('../util/password');
const { generateJsonWebToken } = require('../util/jwt');

/**
 * @swagger
 * /api/v1/auth/login:
 *   post:
 *     summary: User login
 *     description: Endpoint for user login
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               email:
 *                 type: string
 *               password:
 *                 type: string
 *     responses:
 *       200:
 *         description: Successful login
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 username:
 *                   type: string
 *                 user_id:
 *                   type: string
 *                 token:
 *                   type: string
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       401:
 *         description: Unauthorized access
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       404:
 *         description: User not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 */
async function userLoginHandler(req, res) {
  // first validate the request body
  const { error } = validateLoginBody(req.body);
  if (error) {
    throw new UserError(error.details[0].message, 400);
  }

  // now get the resulted user from the database
  const user = await userValidation(req.body.email);
  if (!user) {
    throw new UserError('User does not exist', 404);
  }

  // now compare the password
  const isPasswordMatch = await comparePassword(
    req.body.password,
    user.password
  );
  if (!isPasswordMatch) {
    throw new UserError('Unauthorized access', 401);
  }

  // else generate a jwt token and return to the user based on normal and business user
  const id =
    user.type === 'normal' ? user.normal_user_id : user.business_user_id;
  const token = generateJsonWebToken({
    id: id,
    type: user.type,
    username: user.username,
  });

  return res.json({
    username: user.username,
    id: id,
    token: token,
  });
}

/**
 * @swagger
 * /api/v1/auth/change-password:
 *   post:
 *     summary: Change user password
 *     description: Endpoint for changing user password
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               currentPassword:
 *                 type: string
 *               newPassword:
 *                 type: string
 *     responses:
 *       200:
 *         description: Password changed successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       401:
 *         description: Unauthorized access
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 */
async function userPasswordChangeHandler(req, res) {
  // first validate the request body
  const { error } = validatePasswordChangeBody(req.body);
  if (error) {
    throw new UserError(error.details[0].message, 400);
  }

  // now get the user from the user autht table
  const user = await userValidation(req.body.email);
  if (!user) {
    throw new UserError('User does not exist', 404);
  }
  // compare the current password with the database password
  const isPasswordMatch = await comparePassword(
    req.body.oldPassword,
    user.password
  );
  if (!isPasswordMatch) {
    throw new UserError('Unauthorized access', 401);
  }

  // else change the password and update the user auth table
  // change database hashed password with new hashed password
  const changeResult = await changeUserPassword(user.id, req.body);
  if (!changeResult) {
    return res.status(200).json({ message: 'failed to update the password' });
  }
  return res.status(200).json({ message: 'updated password successfully !' });
}

module.exports = {
  userLoginHandler,
  userPasswordChangeHandler,
};
