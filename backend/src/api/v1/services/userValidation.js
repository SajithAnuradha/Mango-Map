const { UserAuth } = require('../models');

async function userValidation(email) {
  // get the business or normal user from the database
  const user = await UserAuth.findOne({
    where: {
      email: email,
    },
  });

  return user;
}

module.exports = {
  userValidation,
};
