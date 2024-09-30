const { registerNormalUser } = require('../services/normalUserTable');
const { registerBusinessUser } = require('../services/businessUserTable');
const { validateNormalUser } = require('../validations/normaluser.validation');
const {
  validateBusinessUser,
} = require('../validations/businessuser.validation');
const { UserError } = require('../errors/UserError');

/**
 * @swagger
 * /api/v1/register/normal:
 *   post:
 *     summary: Register a normal user
 *     description: Register a new normal user with the provided details
 *     tags:
 *       - Register
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *     responses:
 *       200:
 *         description: Successful registration
 *         content:
 *           application/json:
 *
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *
 */
async function registerNormalUserHandler(req, res) {
  // parse the body of the request through the validation
  const { error } = validateNormalUser(req.body);
  if (error) {
    throw new UserError(error.details[0].message, 400);
  }

  // parse the request body data to register the normal user
  const normalUser = await registerNormalUser(req.body);

  // return the normal user id as the response
  res.json({ id: normalUser.id });
}

/**
 * @swagger
 * /api/v1/register/business:
 *   post:
 *     summary: Register a business user
 *     description: Register a new business user with the provided details
 *     tags:
 *       - Register
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *     responses:
 *       200:
 *         description: Successful registration
 *         content:
 *           application/json:
 *
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *
 */
async function registerBusinessUserHandler(req, res) {
  // parse the body of the request through the validation
  const { error } = validateBusinessUser(req.body);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }

  // parse the request body data to register the business user
  const businessUser = await registerBusinessUser(req.body);

  // return the business user id as the response
  res.json({ id: businessUser.id });
}

module.exports = {
  registerNormalUserHandler,
  registerBusinessUserHandler,
};
