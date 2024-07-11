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

async function getNormalUserById(normalUserId) {
  const normalUser = await NormalUser.findOne({
    where: {
      id: normalUserId,
    },
  });

  // also get the normal yser email and username through user auth
  const user = await UserAuth.findOne({
    where: {
      normal_user_id: normalUserId,
    },
    attributes: ['email', 'username'],
  });

  // merge the normaluser and user
  const mergedUser = {
    ...normalUser.dataValues,
    ...user.dataValues,
  };

  return mergedUser;
}

async function getNormalUsers(page, limit) {
  const normalUsers = await NormalUser.findAll({
    offset: (page - 1) * limit,
    limit: limit,
  });

  return normalUsers;
}

async function updateNormalUserProfileImage(normalUserId, imageUrl) {
  const result = await NormalUser.update(
    { profile_image: imageUrl },
    {
      where: {
        id: normalUserId,
      },
    }
  );

  return result;
}

async function updateNormalUserProfile(normalUserId, data) {
  // first update the normal user data
  await NormalUser.update(
    {
      first_name: data.firstName,
      last_name: data.lastName,
      birthday: data.birthday,
    },
    {
      where: {
        id: normalUserId,
      },
    }
  );

  // lets update the user auth data
  await UserAuth.update(
    {
      username: data.username,
      email: data.email,
    },
    {
      where: {
        normal_user_id: normalUserId,
      },
    }
  );
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
  getNormalUsers,
  getNormalUserById,
  updateNormalUserProfileImage,
  updateNormalUserProfile,
  userExists,
};
