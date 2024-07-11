const { UserAuth } = require('../models');
const { hashPassword } = require('../util/password');

async function changeUserPassword(userId, data) {
  const newPassword = hashPassword(data.newPassword);
  const result = await UserAuth.update(
    {
      password: newPassword,
    },
    {
      where: {
        id: userId,
      },
    }
  );

  return result;
}

module.exports = {
  changeUserPassword,
};
