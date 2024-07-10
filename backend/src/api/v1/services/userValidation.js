const { UserAuth } = require('../models');
const { comparePassword } = require('../util/password');

async function userValidation(data) {
  try {
    const user = await UserAuth.findOne({
      where: {
        username: data.username,
      },
    });
    if (user == null) {
      // There is no any user matched with entered userName
      // console.log('no such user in database')
      return false;
    } else if (!comparePassword(data.password, user.password)) {
      // invalid pasword
      return false;
    } else {
      return true;
    }
  } catch {
    // console.log("error in User Authentication")
    return false;
  }
}

module.exports = {
  userValidation,
};
