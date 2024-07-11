const bcrypt = require('bcrypt');

const PASSWORD_SALT = 10;

function hashPassword(password) {
  return bcrypt.hashSync(password, PASSWORD_SALT);
}
function comparePassword(password, hash) {
  return bcrypt.compareSync(password, hash);
}

module.exports = {
  hashPassword,
  comparePassword,
};
