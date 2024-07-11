const { v4: uuidv4 } = require('uuid');

function generateProfileToken() {
  // generate a profile token that can be used in a QR code
  // this token should be unique for each business profile
  const token = uuidv4();
  return token;
}

module.exports = {
  generateProfileToken,
};
