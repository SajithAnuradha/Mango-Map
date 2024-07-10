const APIError = require('../errors/APIError');
const BusinessError = require('../errors/BusinessError');
const {
  getAnnoucements,
  getAnnoucementById,
  createAnnoucement,
} = require('../services/annoucementTable');
const {
  getBusinessProfiles,
  getBusinessProfileByUserId,
  deleteBusinessProfile,
  profileExists,
  getBusinessProfileQRById,
  updateBusinessProfile,
  addBusinessProfileImage,
} = require('../services/businessProfileTable');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');
const { getPaginationParameters } = require('../util/pagination');
const {
  validateAnnoucementCreateBody,
} = require('../validations/annoucements.validation');
const {
  validateBusinessProfileUpdateBody,
} = require('../validations/businessprofile.validation');

async function businessProfileUpdateHandler(req, res) {
  const { id } = req.params;
  const profileId = parseInt(id) || -1;
  if (profileId === -1) {
    throw new APIError('Invalid business profile id', 400);
  }

  const { error } = validateBusinessProfileUpdateBody(req.body);
  if (error) {
    throw new APIError(error.details[0].message, 400);
  }

  // check whether if the profile exists
  const profileExists_ = await profileExists(profileId);
  if (!profileExists_) {
    throw new BusinessError('Business profile does not exist', 404);
  }

  // now update the business profile
  const updatedProfile = await updateBusinessProfile(profileId, req.body);
  return res.json(updatedProfile);
}

/*
 * This function deletes a business profile from the database
 */
async function businessProfileDeleteHandler(req, res) {
  // get the business id from the request parameter
  const { id } = req.params;
  const businessId = parseInt(id) || -1;
  if (businessId === -1) {
    throw new APIError('Invalid business id', 400);
  }

  // delete the business profile from the database
  const profile = await deleteBusinessProfile(businessId);
  return res.json({ count: profile });
}

async function getBusinessProfileHandler(req, res) {
  // pagination parameters
  const { page, limit } = getPaginationParameters(req);

  // get the reviews from the database
  const profiles = await getBusinessProfiles(page, limit);
  return res.json(profiles);
}

async function getBusinessProfileByIdHandler(req, res) {
  // get the business id from the request parameter
  const { id } = req.params;
  const businessId = parseInt(id) || -1;
  if (businessId === -1) {
    throw new APIError('Invalid business id', 400);
  }

  // get the reviews from the database
  const profile = await getBusinessProfileByUserId(businessId);
  return res.json(profile);
}

async function getBusinessProfileQRCodeHandler(req, res) {
  // get the business id from the request parameter
  const { id } = req.params;
  const profileId = parseInt(id) || -1;
  if (profileId === -1) {
    throw new APIError('Invalid business profile id', 400);
  }

  // checj whether the profile is exists
  const profileExists_ = await profileExists(profileId);
  if (!profileExists_) {
    throw new BusinessError('Business profile does not exist', 404);
  }

  // get the reviews from the database
  const profileQr = await getBusinessProfileQRById(profileId);
  return res.json(profileQr);
}

async function addBusinessProfileImageHandler(req, res) {
  // get the business profile id from the request parameter
  const { id } = req.params;
  const profileId = parseInt(id) || -1;
  if (profileId === -1) {
    throw new APIError('Invalid business profile id', 400);
  }

  // check whether the profile exists
  const profileExists_ = await profileExists(profileId);
  if (!profileExists_) {
    throw new BusinessError('Business profile does not exist', 404);
  }

  // get the file throught the file
  const file = req.file;
  if (!file) {
    throw new APIError('No file found', 400);
  }
  // first upload the image to the storage account
  const url = await uploadFileToBlob(file);
  // update the profile by adding profile image url
  const profile = await addBusinessProfileImage(profileId, url);
  return res.json(profile);
}

async function getBusinessAnnoucementHandler(req, res) {
  const { id } = req.params;
  const profileId = parseInt(id) || -1;
  if (profileId === -1) {
    throw new APIError('Invalid business id', 400);
  }

  // check if the business account exists
  const profileExists_ = await profileExists(profileId);
  if (!profileExists_) {
    throw new BusinessError('Business account does not exist', 404);
  }

  const { page, limit } = getPaginationParameters(req);

  // get the annoucements from the database
  const annoucements = await getAnnoucements(profileId, page, limit);
  return res.json(annoucements);
}

async function createAnnoucementHandler(req, res) {
  // get the profile id from the request parameter
  const { id } = req.params;
  const profileId = parseInt(id) || -1;
  if (profileId === -1) {
    throw new APIError('Invalid business profile id', 400);
  }

  // validate the request body
  const { error } = validateAnnoucementCreateBody(req.body);
  if (error) {
    throw new APIError(error.details[0].message, 400);
  }

  // check if the business profile exists
  const profileExists_ = await profileExists(profileId);
  if (!profileExists_) {
    throw new BusinessError('Business profile does not exist', 404);
  }

  // create the annoucement
  const annoucement = await createAnnoucement(profileId, req.body);
  return res.json(annoucement);
}

async function getAnnoucementByIdHandler(req, res) {
  // get the business id and annoucement id from the request parameter
  const { id, annoucement_id } = req.params;
  const profileId = parseInt(id) || -1;
  const annoucementId = parseInt(annoucement_id) || -1;

  if (annoucementId === -1 || profileId === -1) {
    throw new APIError('Invalid annoucement or profile id', 400);
  }

  // get the annoucement from the database
  const annoucement = await getAnnoucementById(annoucementId);
  return res.json(annoucement);
}

module.exports = {
  businessProfileUpdateHandler,
  businessProfileDeleteHandler,
  getBusinessProfileHandler,
  getBusinessProfileByIdHandler,
  getBusinessProfileQRCodeHandler,
  getBusinessAnnoucementHandler,
  getAnnoucementByIdHandler,
  createAnnoucementHandler,
  addBusinessProfileImageHandler,
};
