const { Op } = require('sequelize');
const {
  BusinessUser,
  BusinessProfile,
  Location,
  UserAuth,
} = require('../models');
const { hashPassword } = require('../util/password');
const { generateProfileToken } = require('../util/profileToken');
const { UserAlreadyExistsError } = require('../errors/UserError');
const sequelize = require('../models').sequelize;

async function registerBusinessUser(data) {
  return sequelize.transaction(async (t) => {
    // check whether if the business user is already registered using the same username or email ID
    const _userExists = await businessUserExistsWithUsernameAndEmail(
      data.businessName,
      data.email
    );
    if (_userExists) {
      throw new UserAlreadyExistsError(
        'Business User already exists with the same username or email ID'
      );
    }

    // first create a location for business profile
    const newBusinessLocation = await Location.create(
      {
        longitude: data.location.longitude,
        type: 'business',
        latitude: data.location.latitude,
        google_place_id: data.location.placeId,
        formatted_address: data.location.address,
        city: data.location.city,
        state: data.location.state,
        country: data.location.country,
        postal_code: data.location.postalCode,
        additional_info: data.location.additionalInfo,
      },
      { transaction: t }
    );

    const newBusinessProfile = await BusinessProfile.create(
      {
        profile_name: data.businessName,
        description: data.description,
        profile_token: generateProfileToken(),
        otp: 0, // should fill this field. required for otp
        location_id: newBusinessLocation.id,
      },
      { transaction: t }
    );

    // then create businessuser using business profile
    const newBusinessUser = await BusinessUser.create(
      {
        business_name: data.businessName,
        location: newBusinessLocation.id,
        profile_id: newBusinessProfile.id,
      },
      { transaction: t }
    );

    // hash the password before save it in the database
    const hashedPassword = hashPassword(data.password);

    // then create a new user auth
    const newUserAuth = await UserAuth.create(
      {
        username: data.businessName,
        email: data.email,
        password: hashedPassword,
        type: 'business',
        business_user_id: newBusinessUser.id,
      },
      { transaction: t }
    );

    return newUserAuth;
  });
}

async function businessUserExistsWithUsernameAndEmail(username, email) {
  const userCount = await UserAuth.count({
    where: {
      [Op.or]: [{ username: username }, { email: email }],
    },
  });

  return userCount > 0;
}

module.exports = {
  registerBusinessUser,
};
