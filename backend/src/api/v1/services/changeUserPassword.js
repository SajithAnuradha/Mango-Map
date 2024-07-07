const { UserAuth } = require('../models/UserAuth');
const { hashPassword } = require('../util/password');

async function changeUserPassword(data) {
  const newPassword = hashPassword(data.newPassword);
  try {
    const result = await UserAuth.update(
      {
        password: newPassword,
      },
      {
        where: {
          id: data.userId,
        },
      }
    );
    if (result[0] == 1) {
      return true;
    } else {
      return false;
    }
  } catch {
    return false;
  }
}

module.exports = {
  changeUserPassword,
};
