const { Annoucement, BusinessProfile } = require('../models/index');

async function createAnnoucement(profileId, annoucementData) {
  // create the annoucement
  const annoucement = await Annoucement.create({
    title: annoucementData.title,
    description: annoucementData.description,
    business_profile_id: profileId,
  });

  return annoucement;
}

async function getAnnoucements(profileId, page, limit) {
  // get the annoucements for the business profile
  const annoucements = await Annoucement.findAndCountAll({
    where: {
      business_profile_id: profileId,
    },
    offset: (page - 1) * limit,
    limit,
  });

  return annoucements;
}

async function getAnnoucementById(annoucementId) {
  const annoucement = await Annoucement.findOne({
    where: {
      id: annoucementId,
    },
    include: [
      {
        model: BusinessProfile,
      },
    ],
  });

  return annoucement;
}

module.exports = {
  createAnnoucement,
  getAnnoucements,
  getAnnoucementById,
};
