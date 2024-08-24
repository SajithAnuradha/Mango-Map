const jwt = require('jsonwebtoken');

function generateJsonWebToken(payload) {
  return jwt.sign(payload, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRATION,
  });
}

module.exports = {
  generateJsonWebToken,
};
