const { NormalUser, UserAuth } = require('../models');
const { hashPassword } = require('../util/password');

/*
  This function registers a new normal user in the database.
*/
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

/*
  This function checks if a user exists in the database.
  If the user exists, the function returns true.
  Otherwise, the function returns false.
*/
async function userExists(user_id) {
  const userCount = await NormalUser.count({
    where: {
      id: user_id,
    },
  });

  return userCount > 0;
}

module.exports = {
  registerNormalUser,
  userExists,
};
