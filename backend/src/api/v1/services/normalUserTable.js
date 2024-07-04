const { NormalUser, UserAuth } = require('../models');
const { hashPassword } = require('../util/password');

async function registerNormalUser(data) {
  // first create a new normal user
  const newNormalUser = await NormalUser.create({
    first_name: data.firstName,
    last_name: data.lastName,
    birthday: data.birthday,
  });

  // hash the password before save it in the database
  const hashedPassword = hashPassword(data.password);

  // then create a new user auth
  const newUserAuth = await UserAuth.create({
    username: data.username,
    email: data.email,
    password: hashedPassword,
    type: 'normal',
    normal_user_id: newNormalUser.id,
  });

  return newUserAuth;
}

module.exports = {
  registerNormalUser,
};
