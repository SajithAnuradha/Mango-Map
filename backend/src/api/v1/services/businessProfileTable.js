const BusinessError = require('../errors/BusinessError');
const { BusinessProfile, BusinessUser, Location } = require('../models/index');

async function updateBusinessProfile(profileId, businessProfileData) {
  // first check if the location exists
  const locationExists_ = await locationExists(businessProfileData.location_id);
  if (!locationExists_) {
    throw new BusinessError('Location does not exist', 404);
  }

  // update the business profile
  const profile = await BusinessProfile.update(businessProfileData, {
    where: {
      id: profileId,
    },
  });

  return profile;
}

async function getBusinessProfiles(page, limit) {
  // get the business profiles icluding the business user model, incuding the profile count
  const businessProfiles = await BusinessUser.findAndCountAll({
    include: [
      {
        model: BusinessProfile,
        include: [
          {
            model: Location,
            attributes: [
              'id',
              'latitude',
              'longitude',
              'google_place_id',
              'formatted_address',
            ],
          },
        ],
      },
    ],
    offset: (page - 1) * limit,
    limit,
  });

  return businessProfiles;
}

async function getBusinessProfileByUserId(businessUserId) {
  const businessProfile = await BusinessUser.findOne({
    where: {
      id: businessUserId,
    },
    include: [
      {
        model: BusinessProfile,
        include: [
          {
            model: Location,
          },
        ],
      },
    ],
  });

  return businessProfile;
}

async function deleteBusinessProfile(businessUserId) {
  // first get the profile id of the business user
  const profile = await BusinessUser.findOne({
    where: {
      id: businessUserId,
    },
  });

  // delete the business profile from the database
  await BusinessProfile.destroy({
    where: {
      id: profile.profile_id,
    },
  });
}

async function getBusinessProfileQRById(businessProfileId) {
  const businessProfile = await BusinessProfile.findOne({
    where: {
      id: businessProfileId,
    },
    attributes: ['id', 'profile_token'],
  });

  return businessProfile;
}

async function profileExists(profileId) {
  const count = await BusinessProfile.count({
    where: {
      id: profileId,
    },
  });

  return count > 0;
}

async function businessUserExists(businessUserId) {
  const count = await BusinessUser.count({
    where: {
      id: businessUserId,
    },
  });

  return count > 0;
}

async function locationExists(locationId) {
  const count = await Location.count({
    where: {
      id: locationId,
    },
  });

  return count > 0;
}

module.exports = {
  updateBusinessProfile,
  getBusinessProfiles,
  getBusinessProfileByUserId,
  deleteBusinessProfile,
  getBusinessProfileQRById,
  profileExists,
  businessUserExists,
};
