const { UserAlreadyExistsError } = require('../errors/UserError');
const { NormalUser, UserAuth } = require('../models');
const { hashPassword } = require('../util/password');
const { Op, where } = require('sequelize');
const sequelize = require('../models').sequelize;
/*
  This function registers a new normal user in the database.
*/
async function registerNormalUser(data) {
  const result = await sequelize.transaction(async (t) => {
    // check whether if the user is already registered using the same username or email ID
    const _userExists = await userExistsWithUsernameAndEmail(
      data.username,
      data.email
    );
    if (_userExists) {
      throw new UserAlreadyExistsError(
        'User already exists with the same username or email ID'
      );
    }

    // first create a new normal user
    const newNormalUser = await NormalUser.create(
      {
        first_name: data.firstName,
        last_name: data.lastName,
        birthday: data.birthday,
      },
      { transaction: t }
    );

    // hash the password before save it in the database
    const hashedPassword = hashPassword(data.password);

    // then create a new user auth
    const newUserAuth = await UserAuth.create(
      {
        username: data.username,
        email: data.email,
        password: hashedPassword,
        type: 'normal',
        normal_user_id: newNormalUser.id,
      },
      { transaction: t }
    );

    return newUserAuth;
  });

  return result;
}

// This function checks whether a user exists with the same username or email ID.
async function userExistsWithUsernameAndEmail(username, email) {
  const userCount = await UserAuth.count({
    where: {
      [Op.or]: [{ username: username }, { email: email }],
    },
  });

  return userCount > 0;
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

async function fetchNormalUsers(page, limit) {
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
  const result = await sequelize.transaction(async (t) => {
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
        transaction: t,
      }
    );

    // first check whether the given username is already exists
    if (await userExistsWithUsername(data.username, normalUserId)) {
      throw new UserAlreadyExistsError(
        'User already exists with the same username'
      );
    }

    // lets update the user auth data
    await UserAuth.update(
      {
        username: data.username,
      },
      {
        where: {
          normal_user_id: normalUserId,
        },
        transaction: t,
      }
    );
  });

  return result;
}

async function userExistsWithUsername(username, userId) {
  const user = await UserAuth.findOne({
    where: {
      username: username,
    },
  });

  if (!user) {
    return false;
  } else {
    return user.id != userId;
  }
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
  fetchNormalUsers,
  getNormalUserById,
  updateNormalUserProfileImage,
  updateNormalUserProfile,
  userExists,
};
