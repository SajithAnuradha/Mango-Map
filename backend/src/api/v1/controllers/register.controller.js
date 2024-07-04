const { registerNormalUser } = require('../services/normalUserTable');
const { validateNormalUser } = require('../validations/normaluser.validation');

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
    return res.status(400).json({ error: error.details[0].message });
  }

  // parse the request body data to register the normal user
  const normalUser = await registerNormalUser(req.body);

  // return the normal user id as the response
  res.json({ id: normalUser.id });
}

function registerBusinessUserHandler(req, res) {
  res.json({ message: 'Register business user' });
}

module.exports = {
  registerNormalUserHandler,
  registerBusinessUserHandler,
};
