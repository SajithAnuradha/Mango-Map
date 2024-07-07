const { changeUserPassword } = require('../services/changeUserPassword');
const { userValidation } = require('../services/userValidation');

async function userLoginHandler(req, res) {
  // checking database for password and username - rows == 1 (matched username and password from normail user and business user tables)
  const result = await userValidation(req.body);

  if (!result) {
    return res.status(200).json({ message: 'invalid login' });
  }
  return res.status(200).json({ message: 'success !' });
}

async function userPasswordChangeHandler(req, res) {
  // checking database for current user name and password
  const result = await userValidation(req.body);
  if (!result) {
    return res.status(200).json({ message: 'invalid current password' });
  }
  // change database hashed password with new hashed password
  const changeResult = await changeUserPassword(req.body);
  if (!changeResult) {
    return res.status(200).json({ message: 'failed to update the password' });
  }
  return res.status(200).json({ message: 'updated password successfully !' });
}

module.exports = {
  userLoginHandler,
  userPasswordChangeHandler,
};
