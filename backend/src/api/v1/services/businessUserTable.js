const {
  BusinessUser,
  BusinessProfile,
  Location,
  UserAuth,
} = require('../models');
const { hashPassword } = require('../util/password');
const { generateProfileToken } = require('../util/profileToken');

async function registerBusinessUser(data) {
  // first create a location for business profile
  // longitude, latitude, google place id, address, city, state, country, postal code, additional infor need from frontend
  const newBusinessLocation = await Location.create({
    longitude: data.longitude,
    type: 'business',
    latitude: data.latitude,
    google_place_id: data.placeId,
    formatted_address: data.address,
    city: data.city,
    state: data.state,
    country: data.country,
    postal_code: data.postalCode,
    additional_info: data.additionalInfo,
  });
  console.log(newBusinessLocation.id);

  const newBusinessProfile = await BusinessProfile.create({
    profile_name: data.businessName,
    description: data.description,
    profile_token: generateProfileToken(),
    otp: 123, // should fill this field. required for otp
    location_id: newBusinessLocation.id,
  });
  console.log(newBusinessProfile.id);

  // then create businessuser using business profile
  const newBusinessUser = await BusinessUser.create({
    business_name: data.businessName,
    location: newBusinessLocation.id,
    profile_id: newBusinessProfile.id,
  });

  // hash the password before save it in the database
  const hashedPassword = hashPassword(data.password);

  // then create a new user auth
  const newUserAuth = await UserAuth.create({
    username: data.businessName,
    email: data.email,
    password: hashedPassword,
    type: 'business',
    business_user_id: newBusinessUser.id,
  });

  return newUserAuth;
}

module.exports = {
  registerBusinessUser,
};
